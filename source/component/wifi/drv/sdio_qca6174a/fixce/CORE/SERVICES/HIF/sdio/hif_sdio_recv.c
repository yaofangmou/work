/*
 * Copyright (c) 2013-2014,2016 The Linux Foundation. All rights reserved.
 *
 * Previously licensed under the ISC license by Qualcomm Atheros, Inc.
 *
 *
 * Permission to use, copy, modify, and/or distribute this software for
 * any purpose with or without fee is hereby granted, provided that the
 * above copyright notice and this permission notice appear in all
 * copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
 * WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
 * AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
 * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
 * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 */

/*
 * This file was originally distributed by Qualcomm Atheros, Inc.
 * under proprietary terms before Copyright ownership was assigned
 * to the Linux Foundation.
 */

#define ATH_MODULE_NAME hif
#include <adf_os_types.h>
#include <adf_os_dma.h>
#include <adf_os_timer.h>
#include <adf_os_time.h>
#include <adf_os_lock.h>
#include <adf_os_io.h>
#include <adf_os_mem.h>
#include <adf_os_module.h>
#include <adf_os_util.h>
#include <adf_os_stdtypes.h>
#include <adf_os_defer.h>
#include <adf_os_atomic.h>
#include <adf_nbuf.h>
#include <vos_threads.h>
#include <athdefs.h>
#include <adf_net_types.h>
#include <a_types.h>
#include <athdefs.h>
#include <a_osapi.h>
#include <hif.h>
#include <htc_services.h>
#include "hif_sdio_internal.h"
#include "../../HTC/htc_internal.h"
#include "regtable.h"
#include "if_ath_sdio.h"

#define NBUF_ALLOC_FAIL_WAIT_TIME 100

static void HIFDevDumpRegisters(HIF_SDIO_DEVICE *pDev,
        MBOX_IRQ_PROC_REGISTERS *pIrqProcRegs,
        MBOX_IRQ_ENABLE_REGISTERS *pIrqEnableRegs,
        MBOX_COUNTER_REGISTERS *pMailBoxCounterRegisters)
{

    AR_DEBUG_PRINTF(ATH_DEBUG_ANY, ("RegTable->"));

    if (pIrqProcRegs != NULL) {
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("HostIntStatus: 0x%x ",pIrqProcRegs->host_int_status));
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("CPUIntStatus: 0x%x ",pIrqProcRegs->cpu_int_status));
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("ErrorIntStatus: 0x%x ",pIrqProcRegs->error_int_status));
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("CounterIntStatus: 0x%x ",pIrqProcRegs->counter_int_status));
        AR_DEBUG_PRINTF(ATH_DEBUG_ANY,
                ("MboxFrame: 0x%x ",pIrqProcRegs->mbox_frame));

        AR_DEBUG_PRINTF(ATH_DEBUG_ANY, ("\nRegTable->"));

        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("RxLKAValid: 0x%x ",pIrqProcRegs->rx_lookahead_valid));
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("RxLKA0: 0x%x",pIrqProcRegs->rx_lookahead[0]));
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("RxLKA1: 0x%x ",pIrqProcRegs->rx_lookahead[1]));

        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("RxLKA2: 0x%x ",pIrqProcRegs->rx_lookahead[2]));
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                ("RxLKA3: 0x%x",pIrqProcRegs->rx_lookahead[3]));
        AR_DEBUG_PRINTF(ATH_DEBUG_ANY, ("\nRegTable->"));

        if (pDev->MailBoxInfo.GMboxAddress != 0) {
            /* if the target supports GMBOX hardware, dump some additional state */
            AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                    ("GMBOX-HostIntStatus2:  0x%x ",pIrqProcRegs->host_int_status2));
            AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                    ("GMBOX-RX-Avail: 0x%x ",pIrqProcRegs->gmbox_rx_avail));
        }
    }

    if (pIrqEnableRegs != NULL) {
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
               ("Int Status Enable:         0x%x\n",pIrqEnableRegs->int_status_enable));
        AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
               ("Counter Int Status Enable: 0x%x\n",pIrqEnableRegs->counter_int_status_enable));
   }

   if (pMailBoxCounterRegisters != NULL){
       int i;
       for (i = 0; i < 4; i ++){
           AR_DEBUG_PRINTF( ATH_DEBUG_ANY,
                   ("Counter[%d]:               0x%x\n", i, pMailBoxCounterRegisters->counter[i]));
       }
   }
   AR_DEBUG_PRINTF(ATH_DEBUG_ANY, ("<------------------------------->\n"));
}


static A_STATUS HIFDevAllocAndPrepareRxPackets(HIF_SDIO_DEVICE *pDev,
        A_UINT32 LookAheads[], int Messages, HTC_PACKET_QUEUE *pQueue)
{
    A_STATUS status = A_OK;
    HTC_PACKET *pPacket;
    HTC_FRAME_HDR *pHdr;
    int i, j;
    int numMessages;
    int fullLength;
    A_BOOL noRecycle;
#if HIF_ASYNC_ALLOC
    unsigned long flags;
#endif
    HTC_TARGET *target = NULL;

    target = (HTC_TARGET *)pDev->pTarget;
    /* lock RX while we assemble the packet buffers */
    LOCK_HIF_DEV_RX(pDev);

    for (i = 0; i < Messages; i++) {

        pHdr = (HTC_FRAME_HDR *) &LookAheads[i];
        if (pHdr->EndpointID >= ENDPOINT_MAX) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR,
                    ("Invalid Endpoint in look-ahead: %d \n",pHdr->EndpointID));
            /* invalid endpoint */
            status = A_EPROTO;
            break;
        }

        if (pHdr->PayloadLen > HTC_MAX_PAYLOAD_LENGTH) {
            AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                    ("Payload length %d exceeds max HTC : %d !\n", pHdr->PayloadLen, (A_UINT32)HTC_MAX_PAYLOAD_LENGTH));
            status = A_EPROTO;
            break;
        }

        numMessages = GET_RECV_BUNDLE_COUNT(pHdr->Flags);

        if (!numMessages)
        {
            /* HTC header only indicates 1 message to fetch */
            numMessages = 1;
        }
        else
        {
            /* the count doesn't include the starter frame, just a count of
               frames to follow */
            numMessages++;
            //A_ASSERT(numMessages <= target->MaxMsgPerBundle);
            AR_DEBUG_PRINTF( ATH_DEBUG_RECV,
                    ("HTC header indicates :%d messages can be fetched as a bundle \n",numMessages));
        }

#if HIF_BUNDLE_DIFF_BLK_FRAMES
        if(numMessages > 1)
            fullLength = target->TargetCreditSize;
        else
            fullLength = DEV_CALC_RECV_PADDED_LEN(pDev,pHdr->PayloadLen + sizeof(HTC_FRAME_HDR));
#else
        fullLength = DEV_CALC_RECV_PADDED_LEN(pDev,pHdr->PayloadLen + sizeof(HTC_FRAME_HDR));
#endif
#if HIF_DBG
        printk("payl %d msg %d\n", pHdr->PayloadLen, numMessages);
#endif

        /*
            all but the last packet have a length of payloadLen + sizeof(HTC_FRAME_HDR)
            The last packet in the bundle has an additional 16 byte lookahead information.
            This is present only if bit 0 of the flags is set
        */

        /* get packet buffers for each message, if there was a bundle detected in the header,
         * use pHdr as a template to fetch all packets in the bundle */
#if HIF_ASYNC_ALLOC
        spin_lock_irqsave(&pDev->pRecvTask->rx_alloc_lock, flags);
#endif
        for (j = 0; j < numMessages; j++) {

            /* reset flag, any packets allocated using the RecvAlloc() API cannot be recycled on cleanup,
             * they must be explicitly returned */
            noRecycle = FALSE;

            /*allocate memory for the last packet*/
            if ((j == (numMessages-1)) && ((pHdr->Flags) & HTC_FLAGS_RECV_1MORE_BLOCK)) {
                fullLength += HIF_MBOX_BLOCK_SIZE;
            }

#if HIF_ASYNC_ALLOC
            pPacket = HTC_PACKET_DEQUEUE(&pDev->pRecvTask->rxAllocQueue);
            if(pPacket == NULL) {
                pPacket = HIFDevAllocRxBuffer(pDev, fullLength);
            }
#else
            pPacket = HIFDevAllocRxBuffer(pDev, fullLength);
#endif

            if (pPacket == NULL) {
                /* this is not an error, we simply need to mark that we are waiting for buffers.*/
                pDev->RecvStateFlags |= HTC_RECV_WAIT_BUFFERS;
                //pDev->EpWaitingForBuffers = pEndpoint->Id;
                status = A_NO_RESOURCE;
                break;
            }
            pPacket->BundlePktnum = 0;
#if HIF_DBG
            printk("alloc %p\n", pPacket);
#endif

            //AR_DEBUG_ASSERT(pPacket->Endpoint == pEndpoint->Id);
            /* clear flags */
            pPacket->PktInfo.AsRx.HTCRxFlags = 0;
            pPacket->PktInfo.AsRx.IndicationFlags = 0;
            pPacket->Status = A_OK;

            if (noRecycle) {
                /* flag that these packets cannot be recycled, they have to be returned to the
                 * user */
                pPacket->PktInfo.AsRx.HTCRxFlags |= HTC_RX_PKT_NO_RECYCLE;
            }
            /* add packet to queue (also incase we need to cleanup down below)  */
            HTC_PACKET_ENQUEUE(pQueue, pPacket);

            /*
             if (HTC_STOPPING(target)) {
             status = A_ECANCELED;
             break;
             }
             */

            /* make sure this message can fit in the endpoint buffer */
            if ((A_UINT32) fullLength > pPacket->BufferLength) {
                AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                        ("Payload Length Error : header reports payload of: %d (%d) endpoint buffer size: %d \n", pHdr->PayloadLen, fullLength, pPacket->BufferLength));
                status = A_EPROTO;
                break;
            }
            if (j > 0) {
                /* for messages fetched in a bundle the expected lookahead is unknown since we
                 * are only using the lookahead of the first packet as a template of what to
                 * expect for lengths */
                /* flag that once we get the real HTC header we need to refesh the information */
                pPacket->PktInfo.AsRx.HTCRxFlags |= HTC_RX_PKT_REFRESH_HDR;
                /* set it to something invalid */
                pPacket->PktInfo.AsRx.ExpectedHdr = 0xFFFFFFFF;
            } else {
                pPacket->PktInfo.AsRx.ExpectedHdr = LookAheads[i]; /* set expected look ahead */
#if HIF_DBG
                printk("exp 0x%08X\n", LookAheads[i]);
#endif
            }
            /* set the amount of data to fetch */
#if HIF_BUNDLE_DIFF_BLK_FRAMES
            if(numMessages > 1)
                pPacket->ActualLength = target->TargetCreditSize;
            else
                pPacket->ActualLength = pHdr->PayloadLen + HTC_HDR_LENGTH;
#else
            pPacket->ActualLength = pHdr->PayloadLen + HTC_HDR_LENGTH;
#endif
            if ((j == (numMessages-1)) && ((pHdr->Flags) & HTC_FLAGS_RECV_1MORE_BLOCK)) {
                pPacket->PktInfo.AsRx.HTCRxFlags |=
                HTC_RX_PKT_LAST_BUNDLED_PKT_HAS_ADDTIONAL_BLOCK;
#if HIF_DBG
                printk("1more block!\n");
#endif
            }
            pPacket->Endpoint = pHdr->EndpointID;
            pPacket->Completion = NULL;
        }
#if HIF_ASYNC_ALLOC
        spin_unlock_irqrestore(&pDev->pRecvTask->rx_alloc_lock, flags);
#endif

        if (A_FAILED(status)) {
            if (A_NO_RESOURCE == status) {
                /* this is actually okay */
                status = A_OK;
            }
            break;
        }

    }

    UNLOCK_HIF_DEV_RX(pDev);

    if (A_FAILED(status)) {
        while (!HTC_QUEUE_EMPTY(pQueue)) {
            pPacket = HTC_PACKET_DEQUEUE(pQueue);
        }
    }
    return status;
}
#if HIF_RX_THREAD_V2
static INLINE void HIFDevPreprocessTrailer(HIF_SDIO_DEVICE *pDev, HTC_PACKET* pPacket, A_UINT32 LookAheads[], int *pNumLookAheads
#if HIF_BUNDLE_DIFF_BLK_FRAMES
        , A_UINT32 lookAhead_part2[])
#else
        )
#endif
{
    A_UINT8 *pRecordBuf;
    HTC_RECORD_HDR *pRecord;
    HTC_LOOKAHEAD_REPORT *pLookAhead;
    A_UINT8 *pBuffer, *pLastPktBuffer, *pCur;
    A_UINT8 lastPktFlag;
    A_UINT16 lastPktPayloadLength;
    A_UINT8 lastPktRecordID;
    int numMessages;
    A_UINT8 temp;
#if HIF_BUNDLE_DIFF_BLK_FRAMES
#if HIF_DBG
    A_UINT16 NextTotalLen;
#endif
    A_UINT32 i;
#endif
    A_UINT16 curPayloadLen = 0;
    A_UINT32 paddedLength = 0, lastPktOffset = 0;

    pBuffer = pPacket->pBuffer;
    pLastPktBuffer = pBuffer;
    pCur = pBuffer;
    numMessages = GET_RECV_BUNDLE_COUNT(pBuffer[1]);
#if HIF_BUNDLE_DIFF_BLK_FRAMES
    for(i = 0; i < numMessages; i++) {
        curPayloadLen = *((A_UINT16*)(&pCur[2]));
        paddedLength = DEV_CALC_RECV_PADDED_LEN(pDev, curPayloadLen + HTC_HDR_LENGTH);
        lastPktOffset += paddedLength;
        pCur += paddedLength;
    }
#else
    curPayloadLen = *((A_UINT16*)(pBuffer + 2));
    paddedLength = DEV_CALC_RECV_PADDED_LEN(pDev, curPayloadLen + HTC_HDR_LENGTH);
    lastPktOffset = numMessages * paddedLength;
#endif
    pLastPktBuffer = pBuffer + lastPktOffset;
    lastPktFlag = pLastPktBuffer[1];
    lastPktPayloadLength = ((A_UINT16)(*(A_UINT16*)(pLastPktBuffer + 2)));

    if(lastPktFlag & HTC_FLAGS_RECV_TRAILER) {
        temp = HTC_GET_FIELD(pLastPktBuffer, HTC_FRAME_HDR, CONTROLBYTES0);
        if ((temp < sizeof(HTC_RECORD_HDR)) || (temp > lastPktPayloadLength)) {
            AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                ("%s: invalid header (payloadlength should be :%d, CB[0] is:%d) \n", __func__, lastPktPayloadLength, temp));
            return;
        }
        lastPktRecordID = *(A_UINT8*)(pLastPktBuffer + lastPktPayloadLength + 8 - temp);
        pRecord = (HTC_RECORD_HDR *)(pLastPktBuffer + lastPktPayloadLength + 8 - temp);
        pRecordBuf = (A_UINT8*)(pLastPktBuffer + lastPktPayloadLength - temp + 12);
#if HIF_DBG
        printk("%p curPayloadLen %d padLen %d lastpkt flag %x pl %d rid %d temp %d\n", pPacket, curPayloadLen, paddedLength, lastPktFlag, lastPktPayloadLength, lastPktRecordID, temp);
#endif
        if(lastPktRecordID == HTC_RECORD_LOOKAHEAD) {
            pLookAhead = (HTC_LOOKAHEAD_REPORT *) pRecordBuf;
            if (pLookAhead->PreValid == ((~pLookAhead->PostValid) & 0xFF)) {
                ((A_UINT8 *) (&LookAheads[0]))[0] = pLookAhead->LookAhead0;
                ((A_UINT8 *) (&LookAheads[0]))[1] = pLookAhead->LookAhead1;
                ((A_UINT8 *) (&LookAheads[0]))[2] = pLookAhead->LookAhead2;
                ((A_UINT8 *) (&LookAheads[0]))[3] = pLookAhead->LookAhead3;
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                ((A_UINT8 *) (&lookAhead_part2[0]))[0] = pLookAhead->LookAhead4;
                ((A_UINT8 *) (&lookAhead_part2[0]))[1] = pLookAhead->LookAhead5;
                ((A_UINT8 *) (&lookAhead_part2[0]))[2] = pLookAhead->LookAhead6;
                ((A_UINT8 *) (&lookAhead_part2[0]))[3] = pLookAhead->LookAhead7;
#if HIF_DBG
                NextTotalLen = (A_UINT16)((lookAhead_part2[0] & 0xffff0000) >> 16);
                printk("%s next lookahead_part2 0x%08X len %d\n", __func__, lookAhead_part2[0], NextTotalLen);
#endif
#endif
#if HIF_DBG
                printk("next lookahead 2 0x%08X\n", LookAheads[0]);
#endif
                if (pNumLookAheads != NULL) {
                    *pNumLookAheads = 1;
                }
                return;
            }
        }
        else if (lastPktRecordID == HTC_RECORD_LOOKAHEAD_BUNDLE) {
            if(pRecord->Length >= sizeof(HTC_BUNDLED_LOOKAHEAD_REPORT)) {
                HTC_BUNDLED_LOOKAHEAD_REPORT *pBundledLookAheadRpt;
                int i;

                pBundledLookAheadRpt =
                        (HTC_BUNDLED_LOOKAHEAD_REPORT *) pRecordBuf;

                if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
                    DebugDumpBytes(pRecordBuf,
                            pRecord->Length,
                            "Bundle LookAhead");
                }

                if ((pRecord->Length / (sizeof(HTC_BUNDLED_LOOKAHEAD_REPORT)))
                        > HTC_MAX_MSG_PER_BUNDLE_RX) {
                    /* this should never happen, the target restricts the number
                     * of messages per bundle configured by the host */
                    A_ASSERT(FALSE);
                    return ;
                }
                for (i = 0; i< (int) (pRecord->Length / (sizeof(HTC_BUNDLED_LOOKAHEAD_REPORT))); i++) {
                    ((A_UINT8 *) (&LookAheads[i]))[0] =
                            pBundledLookAheadRpt->LookAhead0;
                    ((A_UINT8 *) (&LookAheads[i]))[1] =
                            pBundledLookAheadRpt->LookAhead1;
                    ((A_UINT8 *) (&LookAheads[i]))[2] =
                            pBundledLookAheadRpt->LookAhead2;
                    ((A_UINT8 *) (&LookAheads[i]))[3] =
                            pBundledLookAheadRpt->LookAhead3;
#if HIF_DBG
                    printk("next lookahead 3 0x%08X\n", LookAheads[0]);
#endif
                    pBundledLookAheadRpt++;
                }

                if (pNumLookAheads != NULL) {
                    *pNumLookAheads = i;
                }

            }
        }
    }
}
#endif

static INLINE A_STATUS HIFDevRecvPacket(HIF_SDIO_DEVICE *pDev,
    HTC_PACKET *pPacket,
    A_UINT32 RecvLength,
    A_UINT8 mboxIndex)
{
    A_UINT32 paddedLength;
    A_STATUS status;
    A_BOOL sync = (pPacket->Completion == NULL) ? TRUE : FALSE;

    /* adjust the length to be a multiple of block size if appropriate */
    paddedLength = DEV_CALC_RECV_PADDED_LEN(pDev, RecvLength);

    if (paddedLength > pPacket->BufferLength) {
        AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                ("DevRecvPacket, Not enough space for padlen:%d recvlen:%d bufferlen:%d \n", paddedLength,RecvLength,pPacket->BufferLength));
        if (pPacket->Completion != NULL) {
            COMPLETE_HTC_PACKET(pPacket, A_EINVAL);
            return A_OK;
        }
        return A_EINVAL;
    }

    /* mailbox index is saved in Endpoint member */
    AR_DEBUG_PRINTF( ATH_DEBUG_RECV,
        ("HIFDevRecvPacket (0x%lX : hdr:0x%X) Len:%d, Padded Length: %d Mbox:0x%X\n",
         (unsigned long)pPacket, pPacket->PktInfo.AsRx.ExpectedHdr,
         RecvLength,
         paddedLength,
         pDev->MailBoxInfo.MboxAddresses[mboxIndex]));

#ifdef HIF_SYNC_READ
    status = HIFSyncRead(pDev->HIFDevice,
                pDev->MailBoxInfo.MboxAddresses[mboxIndex],
                pPacket->pBuffer,
                paddedLength,
                (sync ? HIF_RD_SYNC_BLOCK_FIX : HIF_RD_ASYNC_BLOCK_FIX),
                sync ? NULL : pPacket); /* pass the packet as the context to the HIF request */
#else
    status = HIFReadWrite(pDev->HIFDevice,
                pDev->MailBoxInfo.MboxAddresses[mboxIndex],
                pPacket->pBuffer,
                paddedLength,
                (sync ? HIF_RD_SYNC_BLOCK_FIX : HIF_RD_ASYNC_BLOCK_FIX),
                sync ? NULL : pPacket); /* pass the packet as the context to the HIF request */
#endif

    AR_DEBUG_PRINTF( ATH_DEBUG_RECV, ("EP%d, Seq:%d\n",
           ((HTC_FRAME_HDR*)pPacket->pBuffer)->EndpointID,
           ((HTC_FRAME_HDR*)pPacket->pBuffer)->ControlBytes1));
    if (status != A_OK) {
        AR_DEBUG_PRINTF( ATH_DEBUG_RECV,
                ("HIFDevRecvPacket (0x%lX : hdr:0x%X) Failed\n", (unsigned long)pPacket, pPacket->PktInfo.AsRx.ExpectedHdr));
    }
    if (sync) {
        pPacket->Status = status;
        if (status == A_OK) {
            HTC_FRAME_HDR *pHdr = (HTC_FRAME_HDR *) pPacket->pBuffer;
#if HIF_DBG
            printk("lookahead in packet: 0x%08X\n", (*(A_UINT32*)pPacket->pBuffer));
#endif
            AR_DEBUG_PRINTF(ATH_DEBUG_RECV,
                    ("HIFDevRecvPacket "
                    "EP:%d,PayloadLen:%d,Flag:%d,CB:0x%02X,0x%02X\n",
                    pHdr->EndpointID,
                    pHdr->PayloadLen,
                    pHdr->Flags,
                    pHdr->ControlBytes0,
                    pHdr->ControlBytes1));
        }
    }

    return status;
}

static INLINE A_STATUS HIFDevProcessTrailer(HIF_SDIO_DEVICE *pDev,
        A_UINT8 *pBuffer, int Length, A_UINT32 *pNextLookAheads,
        int *pNumLookAheads, HTC_ENDPOINT_ID FromEndpoint
#if HIF_BUNDLE_DIFF_BLK_FRAMES
        , A_UINT32 lookAhead_part2[])
#else
        )
#endif
{
    HTC_RECORD_HDR *pRecord;
    A_UINT8 *pRecordBuf;
    HTC_LOOKAHEAD_REPORT *pLookAhead;
    A_UINT8 *pOrigBuffer;
    int origLength;
    A_STATUS status;
#if HIF_BUNDLE_DIFF_BLK_FRAMES
#if HIF_DBG
    A_UINT16 NextTotalLen;
#endif
#endif

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV,
            ("+HTCProcessTrailer (length:%d) \n", Length));

    if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
        AR_DEBUG_PRINTBUF(pBuffer,Length,"Recv Trailer");
    }

    pOrigBuffer = pBuffer;
    origLength = Length;
    status = A_OK;

    while (Length > 0) {

        if (Length < sizeof(HTC_RECORD_HDR)) {
            status = A_EPROTO;
            break;
        }
        /* these are byte aligned structs */
        pRecord = (HTC_RECORD_HDR *) pBuffer;
        Length -= sizeof(HTC_RECORD_HDR);
        pBuffer += sizeof(HTC_RECORD_HDR);

        if (pRecord->Length > Length) {
            /* no room left in buffer for record */
            AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                    (" invalid record length: %d (id:%d) buffer has: %d bytes left \n", pRecord->Length, pRecord->RecordID, Length));
            status = A_EPROTO;
            break;
        }
        /* start of record follows the header */
        pRecordBuf = pBuffer;

        switch (pRecord->RecordID) {
        case HTC_RECORD_CREDITS:
            /* Process in HTC, ignore here*/
            break;
        case HTC_RECORD_LOOKAHEAD:
            AR_DEBUG_ASSERT(pRecord->Length >= sizeof(HTC_LOOKAHEAD_REPORT));
            pLookAhead = (HTC_LOOKAHEAD_REPORT *) pRecordBuf;
            if ((pLookAhead->PreValid == ((~pLookAhead->PostValid) & 0xFF))
                    && (pNextLookAheads != NULL)) {

                AR_DEBUG_PRINTF( ATH_DEBUG_RECV,
                    (" LookAhead Report Found (pre valid:0x%X, post valid:0x%X) %d %d\n",
                           pLookAhead->PreValid, pLookAhead->PostValid,
                           FromEndpoint,
                           pLookAhead->LookAhead0
                           ));
                /* look ahead bytes are valid, copy them over */
                ((A_UINT8 *) (&pNextLookAheads[0]))[0] = pLookAhead->LookAhead0;
                ((A_UINT8 *) (&pNextLookAheads[0]))[1] = pLookAhead->LookAhead1;
                ((A_UINT8 *) (&pNextLookAheads[0]))[2] = pLookAhead->LookAhead2;
                ((A_UINT8 *) (&pNextLookAheads[0]))[3] = pLookAhead->LookAhead3;

#if HIF_BUNDLE_DIFF_BLK_FRAMES
                ((A_UINT8 *) (&lookAhead_part2[0]))[0] = pLookAhead->LookAhead4;
                ((A_UINT8 *) (&lookAhead_part2[0]))[1] = pLookAhead->LookAhead5;
                ((A_UINT8 *) (&lookAhead_part2[0]))[2] = pLookAhead->LookAhead6;
                ((A_UINT8 *) (&lookAhead_part2[0]))[3] = pLookAhead->LookAhead7;
#if HIF_DBG
                NextTotalLen = (A_UINT16)((lookAhead_part2[0] & 0xffff0000) >> 16);
                printk("%s next lookahead 0x%08X lookahead_part2 0x%08X len %d\n", __func__, pNextLookAheads[0], lookAhead_part2[0], NextTotalLen);
#endif
#endif

                if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
                    DebugDumpBytes((A_UINT8 *) pNextLookAheads,
                            4,
                            "Next Look Ahead");
                }
                /* just one normal lookahead */
                if (pNumLookAheads != NULL) {
                    *pNumLookAheads = 1;
                }
            }
            break;
        case HTC_RECORD_LOOKAHEAD_BUNDLE:
            AR_DEBUG_ASSERT(pRecord->Length >= sizeof(HTC_BUNDLED_LOOKAHEAD_REPORT));
            if (pRecord->Length >= sizeof(HTC_BUNDLED_LOOKAHEAD_REPORT)
                    && (pNextLookAheads != NULL)) {
                HTC_BUNDLED_LOOKAHEAD_REPORT *pBundledLookAheadRpt;
                int i;

                pBundledLookAheadRpt =
                        (HTC_BUNDLED_LOOKAHEAD_REPORT *) pRecordBuf;

                if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
                    DebugDumpBytes(pRecordBuf,
                            pRecord->Length,
                            "Bundle LookAhead");
                }

                if ((pRecord->Length / (sizeof(HTC_BUNDLED_LOOKAHEAD_REPORT)))
                        > HTC_MAX_MSG_PER_BUNDLE_RX) {
                    /* this should never happen, the target restricts the number
                     * of messages per bundle configured by the host */
                    A_ASSERT(FALSE);
                    status = A_EPROTO;
                    break;
                }
                for (i = 0; i< (int) (pRecord->Length / (sizeof(HTC_BUNDLED_LOOKAHEAD_REPORT))); i++) {
                    ((A_UINT8 *) (&pNextLookAheads[i]))[0] =
                            pBundledLookAheadRpt->LookAhead0;
                    ((A_UINT8 *) (&pNextLookAheads[i]))[1] =
                            pBundledLookAheadRpt->LookAhead1;
                    ((A_UINT8 *) (&pNextLookAheads[i]))[2] =
                            pBundledLookAheadRpt->LookAhead2;
                    ((A_UINT8 *) (&pNextLookAheads[i]))[3] =
                            pBundledLookAheadRpt->LookAhead3;
                    pBundledLookAheadRpt++;
                }

                if (pNumLookAheads != NULL) {
                    *pNumLookAheads = i;
                }
            }
            break;
        default:
            AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                (" HIF unhandled record: id:%d length:%d \n", pRecord->RecordID, pRecord->Length));
            break;
        }

        if (A_FAILED(status)) {
            break;
        }

        /* advance buffer past this record for next time around */
        pBuffer += pRecord->Length;
        Length -= pRecord->Length;
    }

    if (A_FAILED(status)) {
        DebugDumpBytes(pOrigBuffer, origLength, "BAD Recv Trailer");
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("-HTCProcessTrailer \n"));
    return status;

}

/* process a received message (i.e. strip off header, process any trailer data)
 * note : locks must be released when this function is called */
static A_STATUS HIFDevProcessRecvHeader(HIF_SDIO_DEVICE *pDev,
        HTC_PACKET *pPacket, A_UINT32 *pNextLookAheads, int *pNumLookAheads, bool processTrailer
#if HIF_BUNDLE_DIFF_BLK_FRAMES
        , A_UINT32 lookAhead_part2[])
#else
        )
#endif
{
    A_UINT8 temp;
    A_UINT8 *pBuf;
    A_STATUS status = A_OK;
    A_UINT16 payloadLen;
    A_UINT32 lookAhead, ActualLength;

    pBuf = pPacket->pBuffer;
    ActualLength = pPacket->ActualLength;

    if (pNumLookAheads != NULL) {
        *pNumLookAheads = 0;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("+HTCProcessRecvHeader \n"));

    if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
        AR_DEBUG_PRINTBUF(pBuf,pPacket->ActualLength,"HTC Recv PKT");
    }

    do {
        /* note, we cannot assume the alignment of pBuffer, so we use the safe macros to
         * retrieve 16 bit fields */
        payloadLen = HTC_GET_FIELD(pBuf, HTC_FRAME_HDR, PAYLOADLEN);

        ((A_UINT8 *) &lookAhead)[0] = pBuf[0];
        ((A_UINT8 *) &lookAhead)[1] = pBuf[1];
        ((A_UINT8 *) &lookAhead)[2] = pBuf[2];
        ((A_UINT8 *) &lookAhead)[3] = pBuf[3];

        if (pPacket->PktInfo.AsRx.HTCRxFlags & HTC_RX_PKT_REFRESH_HDR) {
            /* refresh expected hdr, since this was unknown at the time we grabbed the packets
             * as part of a bundle */
            pPacket->PktInfo.AsRx.ExpectedHdr = lookAhead;
            /* refresh actual length since we now have the real header */
            pPacket->ActualLength = payloadLen + HTC_HDR_LENGTH;

            /* validate the actual header that was refreshed  */
            if (pPacket->ActualLength > pPacket->BufferLength) {
                AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                        ("Refreshed HDR payload length (%d) in bundled RECV is invalid (hdr: 0x%X) \n", payloadLen, lookAhead));
                /* limit this to max buffer just to print out some of the buffer */
                pPacket->ActualLength =
                min(pPacket->ActualLength, pPacket->BufferLength);
                status = A_EPROTO;
                break;
            }

            if (pPacket->Endpoint
                    != HTC_GET_FIELD(pBuf, HTC_FRAME_HDR, ENDPOINTID)) {
                AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                        ("Refreshed HDR endpoint (%d) does not match expected endpoint (%d) \n", HTC_GET_FIELD(pBuf, HTC_FRAME_HDR, ENDPOINTID), pPacket->Endpoint));
                status = A_EPROTO;
                break;
            }
        }

        if (lookAhead != pPacket->PktInfo.AsRx.ExpectedHdr) {
            /* somehow the lookahead that gave us the full read length did not
             * reflect the actual header in the pending message */
            AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                ("HIFDevProcessRecvHeader, lookahead mismatch! (pPkt:%p flags:0x%X), 0x%08X != 0x%08X len %d\n",
                           pPacket, pPacket->PktInfo.AsRx.HTCRxFlags,
                           lookAhead, pPacket->PktInfo.AsRx.ExpectedHdr, payloadLen));
#ifdef ATH_DEBUG_MODULE
            DebugDumpBytes((A_UINT8 *)&pPacket->PktInfo.AsRx.ExpectedHdr,4,"Expected Message LookAhead");
            DebugDumpBytes(pBuf,sizeof(HTC_FRAME_HDR),"Current Frame Header");
#ifdef HTC_CAPTURE_LAST_FRAME
            DebugDumpBytes((A_UINT8 *)&target->LastFrameHdr,sizeof(HTC_FRAME_HDR),"Last Frame Header");
            if (target->LastTrailerLength != 0) {
                DebugDumpBytes(target->LastTrailer,
                        target->LastTrailerLength,
                        "Last trailer");
            }
#endif
#endif
            status = A_EPROTO;
            break;
        }

        if(processTrailer == TRUE) {
            /* get flags */
            temp = HTC_GET_FIELD(pBuf, HTC_FRAME_HDR, FLAGS);

            if (temp & HTC_FLAGS_RECV_TRAILER) {
                /* this packet has a trailer */

                /* extract the trailer length in control byte 0 */
                temp = HTC_GET_FIELD(pBuf, HTC_FRAME_HDR, CONTROLBYTES0);

                if ((temp < sizeof(HTC_RECORD_HDR)) || (temp > payloadLen)) {
                    AR_DEBUG_PRINTF( ATH_DEBUG_ERR,
                        ("HIFDevProcessRecvHeader, invalid header (payloadlength should be :%d, CB[0] is:%d) \n", payloadLen, temp));
                    status = A_EPROTO;
                    break;
                }

                if (pPacket->PktInfo.AsRx.HTCRxFlags & HTC_RX_PKT_IGNORE_LOOKAHEAD) {
                    /* this packet was fetched as part of an HTC bundle, the embedded lookahead is
                     * not valid since the next packet may have already been fetched as part of the
                     * bundle */
                    pNextLookAheads = NULL;
                    pNumLookAheads = NULL;
                }

                /* process trailer data that follows HDR + application payload */
#if HIF_DBG
                printk("recordid offset %lu payl %d tmp %d\n", HTC_HDR_LENGTH + payloadLen - temp, payloadLen, temp);
#endif
                status = HIFDevProcessTrailer(pDev,
                        (pBuf + HTC_HDR_LENGTH + payloadLen - temp),
                        temp,
                        pNextLookAheads,
                        pNumLookAheads,
                        pPacket->Endpoint
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                        , lookAhead_part2);
#else
                        );
#endif

                if (A_FAILED(status)) {
                    break;
                }
            }
        }
    }while (FALSE);

    if (A_FAILED(status)) {
        /* dump the whole packet */
#if 0
        DebugDumpBytes(pBuf,
            pPacket->ActualLength,
            "BAD HTC Recv PKT");
#endif
    } else {
        if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
            if (pPacket->ActualLength > 0) {
                AR_DEBUG_PRINTBUF(pPacket->pBuffer,pPacket->ActualLength,"HTC - Application Msg");
            }
        }
    }
    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("-HIFDevProcessRecvHeader \n"));
    return status;
}

#if HIF_RX_THREAD
static A_STATUS processHdrAndRxComp(HIF_SDIO_DEVICE *device, HTC_PACKET *pPacket, bool processTrailer)
{
    A_UINT8 pipeid;
    adf_nbuf_t netbuf;
    int NumLookAheads;
    A_UINT32 lookAheads[HTC_MAX_MSG_PER_BUNDLE_RX];
#if HIF_BUNDLE_DIFF_BLK_FRAMES
    A_UINT32 lookAhead_part2[HTC_MAX_MSG_PER_BUNDLE_RX];
#endif
    A_STATUS status = A_OK;

    NumLookAheads = 0;
    status = HIFDevProcessRecvHeader(device, pPacket, lookAheads, &NumLookAheads, processTrailer
#if HIF_BUNDLE_DIFF_BLK_FRAMES
        , lookAhead_part2);
#else
            );
#endif
    if (A_FAILED(status)) {
        return status;
    }

    netbuf = (adf_nbuf_t) pPacket->pNetBufContext;
    /* set data length */
    adf_nbuf_put_tail(netbuf, pPacket->ActualLength);

    if (device->hif_callbacks.rxCompletionHandler) {
        pipeid = HIFDevMapMailBoxToPipe(device, 0, TRUE);
        device->hif_callbacks.rxCompletionHandler(device->hif_callbacks.Context,
            netbuf,
            pipeid);
    }
    return status;
}

int rx_completion_task(void *param)
{
    HIF_SDIO_DEVICE *device;
    HTC_PACKET *pPacket = NULL;
    unsigned long flags;
#if HIF_RX_THREAD_V2
    HTC_PACKET *pPacketRxBundle;
    A_UINT32 paddedLength;
    unsigned char    *pBundleBuffer = NULL;
    unsigned char *pBuffer;
    HTC_TARGET *target = NULL;
    A_UINT8 syncQDepth = 0;
    A_UINT8 nextIsSingle = 0;
#if HIF_BUNDLE_DIFF_BLK_FRAMES
    A_UINT16 curPayloadLen = 0;
#endif
#endif
    A_STATUS status = A_OK;

    device = (HIF_SDIO_DEVICE *)param;
#if HIF_RX_THREAD_V2
    target = (HTC_TARGET *)device->pTarget;
#endif
    AR_DEBUG_PRINTF(ATH_DEBUG_TRACE, ("AR6000: rx completion task\n"));

    set_current_state(TASK_INTERRUPTIBLE);
    vos_set_cpus_allowed_ptr(current, 1);

    while (!device->pRecvTask->rx_completion_shutdown) {
        if (down_interruptible(&device->pRecvTask->sem_rx_completion) != 0) {
                AR_DEBUG_PRINTF(ATH_DEBUG_ERROR,
                        ("%s: rx completion task interrupted\n",
                         __func__));
                break;
        }

        if (device->pRecvTask->rx_completion_shutdown) {
                AR_DEBUG_PRINTF(ATH_DEBUG_ERROR,
                        ("%s: rx completion task stopping\n",
                         __func__));
                break;
        }

#if HIF_RX_THREAD_V2
        //process single packet
#if HIF_DBG
        printk("[task]task enter\n");
#endif
        spin_lock_irqsave(&device->pRecvTask->rx_bundle_lock, flags);
        if(HTC_QUEUE_EMPTY(&device->pRecvTask->rxBundleQueue)) {
            spin_lock_irqsave(&device->pRecvTask->rx_sync_completion_lock, flags);
            while(!HTC_QUEUE_EMPTY(&device->pRecvTask->rxSyncCompletionQueue)) {
                pPacket = HTC_PACKET_DEQUEUE(&device->pRecvTask->rxSyncCompletionQueue);
                if(pPacket == NULL) {
                    break;
                }
#if HIF_DBG
                printk("[task]process single %p\n", pPacket);
#endif
                status = processHdrAndRxComp(device, pPacket, FALSE);

                if (A_FAILED(status)) {
                    break;
                }
#if HIF_DBG
                printk("[task]process single done %p\n", pPacket);
#endif
            }
            spin_unlock_irqrestore(&device->pRecvTask->rx_sync_completion_lock, flags);
        }
        else {
            //1. Dequeue from bundle buffer queue, scatter data to sync completion queue
            while(!HTC_QUEUE_EMPTY(&device->pRecvTask->rxBundleQueue)) {
                pPacketRxBundle = HTC_PACKET_DEQUEUE(&device->pRecvTask->rxBundleQueue);
                if(pPacketRxBundle == NULL) {
                    break;
                }
                if(pPacketRxBundle->BundlePktnum < 1) {
                    printk("[task]Packets in bundle buffer is < 1\n");
                    break;
                }
                spin_lock_irqsave(&device->pRecvTask->rx_sync_completion_lock, flags);
                if(HTC_PACKET_QUEUE_DEPTH(&device->pRecvTask->rxSyncCompletionQueue) < pPacketRxBundle->BundlePktnum) {
#if HIF_DBG
                    printk("corner case: the sync queue depth is not enough for processing this bundle pkt, push it back\n");
#endif
                    HTC_PACKET_ENQUEUE_TO_HEAD(&device->pRecvTask->rxBundleQueue, pPacketRxBundle);
                    spin_unlock_irqrestore(&device->pRecvTask->rx_sync_completion_lock, flags);
                    break;
                }
                spin_unlock_irqrestore(&device->pRecvTask->rx_sync_completion_lock, flags);
                pBundleBuffer = pPacketRxBundle->pBuffer;
                pBuffer = pBundleBuffer;
                if(pPacketRxBundle == NULL)
                    break;

                spin_lock_irqsave(&device->pRecvTask->rx_sync_completion_lock, flags);
                //if the next pkt is single, dequeue it and process it, until the bundle pkts
                while(TRUE) {
                    nextIsSingle = 0;
                    pPacket = HTC_GET_PKT_AT_HEAD(&device->pRecvTask->rxSyncCompletionQueue);
                    if(pPacket == NULL)
                        break;
                    if(pPacket->BundlePktnum == 1) {
#if HIF_DBG
                        printk("[task]the next is singlepkt, dequeue it %p\n", pPacket);
#endif
                        nextIsSingle = 1;
                    }
                    if(nextIsSingle == 1) {
                        pPacket = HTC_PACKET_DEQUEUE(&device->pRecvTask->rxSyncCompletionQueue);
                        if(pPacket == NULL)
                            break;

                        status = processHdrAndRxComp(device, pPacket, FALSE);

                        if (A_FAILED(status)) {
                            break;
                        }
                    }
                    else
                        break;
                }

                //2. Dequeue from sync completion queue for processing header, the trialer info at this point is useless.
#if HIF_DBG
                printk("[task]process bundle %p %d\n", pPacketRxBundle, pPacketRxBundle->BundlePktnum);
#endif
                syncQDepth = 0;
                while(!HTC_QUEUE_EMPTY(&device->pRecvTask->rxSyncCompletionQueue)) {
                    pPacket = HTC_PACKET_DEQUEUE(&device->pRecvTask->rxSyncCompletionQueue);
                    if(pPacket == NULL)
                        break;
                    syncQDepth++;
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                    curPayloadLen = *(A_UINT16*)(&pBuffer[2]);
                    pPacket->ActualLength = curPayloadLen + HTC_HDR_LENGTH;
                    paddedLength = DEV_CALC_RECV_PADDED_LEN(device, pPacket->ActualLength);
#else
                    paddedLength = DEV_CALC_RECV_PADDED_LEN(device, pPacket->ActualLength);
                    if (pPacket->PktInfo.AsRx.HTCRxFlags & HTC_RX_PKT_LAST_BUNDLED_PKT_HAS_ADDTIONAL_BLOCK){
                            paddedLength += HIF_MBOX_BLOCK_SIZE;
                    }
#endif
                    A_MEMCPY(pPacket->pBuffer, pBuffer, paddedLength);
                    pBuffer += paddedLength;
#if HIF_DBG
                    printk("[task]process %p %d\n", pPacket, syncQDepth);
#endif
                    status = processHdrAndRxComp(device, pPacket, FALSE);
                    if (A_FAILED(status)) {
                        break;
                    }

                    if(syncQDepth > (pPacketRxBundle->BundlePktnum - 1))
                        break;
                }
#if HIF_DBG
                printk("[task]process bundle done %p %d\n", pPacketRxBundle, syncQDepth);
#endif
                //if the next pkt is single, dequeue it and process it, until the bundle pkts
                while(TRUE) {
                    nextIsSingle = 0;
                    pPacket = HTC_GET_PKT_AT_HEAD(&device->pRecvTask->rxSyncCompletionQueue);
                    if(pPacket == NULL)
                        break;
                    if(pPacket->BundlePktnum == 1) {
#if HIF_DBG
                        printk("[task]the next is singlepkt, dequeue it %p\n", pPacket);
#endif
                        nextIsSingle = 1;
                    }
                    if(nextIsSingle == 1) {
                        pPacket = HTC_PACKET_DEQUEUE(&device->pRecvTask->rxSyncCompletionQueue);
                        if(pPacket == NULL)
                            break;
                        status = processHdrAndRxComp(device, pPacket, FALSE);
                        if (A_FAILED(status)) {
                            break;
                        }
                    }
                    else
                        break;
                }
                spin_unlock_irqrestore(&device->pRecvTask->rx_sync_completion_lock, flags);
                FreeHTCBundleRxPacket(target, pPacketRxBundle);
            }
        }
        spin_unlock_irqrestore(&device->pRecvTask->rx_bundle_lock, flags);
#else
        spin_lock_irqsave(&device->pRecvTask->rx_completion_lock, flags);
        while(!HTC_QUEUE_EMPTY(&device->pRecvTask->rxComQueue)) {
            pPacket = HTC_PACKET_DEQUEUE(&device->pRecvTask->rxComQueue);
            if(pPacket == NULL)
                break;

            status = processHdrAndRxComp(device, pPacket, FALSE);
            if (A_FAILED(status)) {
                break;
            }
        }
        spin_unlock_irqrestore(&device->pRecvTask->rx_completion_lock, flags);

#endif

#if HIF_ASYNC_ALLOC
        //alloc skb for next bundle
        spin_lock_irqsave(&device->pRecvTask->rx_alloc_lock, flags);
        while(HTC_PACKET_QUEUE_DEPTH(&device->pRecvTask->rxAllocQueue) < 64) {
            pPacket = HIFDevAllocRxBuffer(device, 2048);
            if(pPacket == NULL) {
                printk("[task]%s allocate failed\n", __func__);
                break;
            }
            HTC_PACKET_ENQUEUE(&device->pRecvTask->rxAllocQueue, pPacket);
        }
        spin_unlock_irqrestore(&device->pRecvTask->rx_alloc_lock, flags);
#endif
#if HIF_DBG
        printk("[task]task break\n");
#endif
    }
    complete_and_exit(&device->pRecvTask->rx_completion_exit, 0);
    return 0;
}
#endif

#if HIF_COSTTIME
unsigned long gt0=0;
unsigned long gt1=0;
unsigned long gt2=0;
unsigned long gt3=0;
unsigned long gt4=0;
unsigned long gt5=0;
unsigned long gt6=0;
unsigned long gt7=0;
int gBundleCnt=0;
int gMaxBundleCnt=0;
#endif
static A_STATUS HIFDevIssueRecvPacketBundle(HIF_SDIO_DEVICE *pDev,
        HTC_PACKET_QUEUE *pRecvPktQueue,
        HTC_PACKET_QUEUE *pSyncCompletionQueue,
        A_UINT8 MailBoxIndex,
        int *pNumPacketsFetched,
        A_BOOL  PartialBundle
#if !HIF_RX_THREAD_V2
#if HIF_BUNDLE_DIFF_BLK_FRAMES
        , A_UINT32 lookAhead_part2[])
#else
        )
#endif
#else
        , int *pNumLookAheads
        , A_UINT32 LookAheads[]
#if HIF_BUNDLE_DIFF_BLK_FRAMES
        , A_UINT32 lookAhead_part2[])
#else
        )
#endif
#endif
{ A_STATUS status = A_OK;
    int i, totalLength = 0;
    unsigned char    *pBundleBuffer = NULL;
    HTC_PACKET *pPacket, *pPacketRxBundle;
    HTC_TARGET *target = NULL;
    A_UINT32 paddedLength;
#if HIF_COSTTIME
    struct timeval tv;
#endif
#if HIF_RX_THREAD_V2
    unsigned long flags;
#endif
#if (HIF_BUNDLE_DIFF_BLK_FRAMES && !HIF_RX_THREAD_V2)
    A_UINT16 curPayloadLen = 0;
#if HIF_DBG
    A_UINT32 totalPadLength = 0;
#endif
#endif

    int bundleSpaceRemaining = 0;
    target = (HTC_TARGET *)pDev->pTarget;

    if (!pSyncCompletionQueue) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERROR,
                  ("%s: pSyncCompletionQueue is NULL\n", __func__));
        return A_ERROR;
    }

    if((HTC_PACKET_QUEUE_DEPTH(pRecvPktQueue) - HTC_MAX_MSG_PER_BUNDLE_RX) > 0){
        PartialBundle = TRUE;
        AR_DEBUG_PRINTF(ATH_DEBUG_WARN, ("%s, partial bundle detected num: %d, %d \n",
                __FUNCTION__, HTC_PACKET_QUEUE_DEPTH(pRecvPktQueue),  HTC_MAX_MSG_PER_BUNDLE_RX));
    }

    bundleSpaceRemaining = HTC_MAX_MSG_PER_BUNDLE_RX * target->TargetCreditSize;
    pPacketRxBundle = AllocateHTCBundleRxPacket(target);
    if (!pPacketRxBundle) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("%s: pPacketRxBundle is NULL \n",
            __FUNCTION__));
        vos_sleep(NBUF_ALLOC_FAIL_WAIT_TIME);  /* 100 msec sleep */
        return A_NO_MEMORY;
    }
    pBundleBuffer = pPacketRxBundle->pBuffer;

    for(i = 0; !HTC_QUEUE_EMPTY(pRecvPktQueue) && i < HTC_MAX_MSG_PER_BUNDLE_RX; i++){
        pPacket = HTC_PACKET_DEQUEUE(pRecvPktQueue);
        if (pPacket == NULL)
            break;
        if (pPacket->PktInfo.AsRx.HTCRxFlags & HTC_RX_PKT_LAST_BUNDLED_PKT_HAS_ADDTIONAL_BLOCK)
            paddedLength = DEV_CALC_RECV_PADDED_LEN(pDev, pPacket->ActualLength)
                                                    + HIF_MBOX_BLOCK_SIZE;
        else
            paddedLength = DEV_CALC_RECV_PADDED_LEN(pDev, pPacket->ActualLength);

        if((bundleSpaceRemaining - paddedLength) < 0){
            /* exceeds what we can transfer, put the packet back */
            HTC_PACKET_ENQUEUE_TO_HEAD(pRecvPktQueue, pPacket);
            break;
        }
        bundleSpaceRemaining -= paddedLength;

        if(PartialBundle || HTC_PACKET_QUEUE_DEPTH(pRecvPktQueue) > 0){
            pPacket->PktInfo.AsRx.HTCRxFlags |= HTC_RX_PKT_IGNORE_LOOKAHEAD;
        }
        pPacket->PktInfo.AsRx.HTCRxFlags |= HTC_RX_PKT_PART_OF_BUNDLE;

        HTC_PACKET_ENQUEUE(pSyncCompletionQueue, pPacket);

        totalLength += paddedLength;
    }
#if HIF_DBG
    printk("alloc bundle %p\n", pPacketRxBundle);
#endif
#if HIF_BUNDLE_DIFF_BLK_FRAMES
    totalLength = (A_UINT16)((lookAhead_part2[0] & 0xffff0000) >> 16);
#endif
#if HIF_DBG
    printk("total %d\n", totalLength);
#endif
#if DEBUG_BUNDLE
    adf_os_print("Recv bundle count %d, length %d.\n",
       HTC_PACKET_QUEUE_DEPTH(pSyncCompletionQueue), totalLength);
#endif

#if defined(DEBUG_HL_LOGGING) && defined(CONFIG_HL_SUPPORT)
    if (HTC_PACKET_QUEUE_DEPTH(pSyncCompletionQueue) <= HTC_MAX_MSG_PER_BUNDLE_RX)
        target->rx_bundle_stats[HTC_PACKET_QUEUE_DEPTH(pSyncCompletionQueue) - 1]++;
#endif


#ifdef HIF_SYNC_READ
    status = HIFSyncRead(pDev->HIFDevice,
                pDev->MailBoxInfo.MboxAddresses[(int)MailBoxIndex],
                pBundleBuffer,
                totalLength,
                HIF_RD_SYNC_BLOCK_FIX,
                NULL);
#else
    status = HIFReadWrite(pDev->HIFDevice,
                pDev->MailBoxInfo.MboxAddresses[(int)MailBoxIndex],
                pBundleBuffer,
                totalLength,
                HIF_RD_SYNC_BLOCK_FIX,
                NULL);
#endif

    if(status != A_OK){
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("%s, HIFSend Failed status:%d \n",__FUNCTION__, status));
    }else{
#if !HIF_RX_THREAD_V2
        unsigned char *pBuffer = pBundleBuffer;
#endif

#if HIF_RX_THREAD_V2
        HIFDevPreprocessTrailer(pDev, pPacketRxBundle, LookAheads, pNumLookAheads
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                    , lookAhead_part2);
#else
                );
#endif
        *pNumPacketsFetched = i;
        pPacketRxBundle->BundlePktnum = i;
#if HIF_DBG
        printk("bundle read %d\n", i);
#endif

        spin_lock_irqsave(&pDev->pRecvTask->rx_bundle_lock, flags);
        HTC_PACKET_ENQUEUE(&pDev->pRecvTask->rxBundleQueue, pPacketRxBundle);
        spin_unlock_irqrestore(&pDev->pRecvTask->rx_bundle_lock, flags);

        spin_lock_irqsave(&pDev->pRecvTask->rx_sync_completion_lock, flags);
        HTC_PACKET_QUEUE_TRANSFER_TO_TAIL(&pDev->pRecvTask->rxSyncCompletionQueue, pSyncCompletionQueue);
        spin_unlock_irqrestore(&pDev->pRecvTask->rx_sync_completion_lock, flags);
#else
        *pNumPacketsFetched = i;
        HTC_PACKET_QUEUE_ITERATE_ALLOW_REMOVE(pSyncCompletionQueue, pPacket){
#if HIF_BUNDLE_DIFF_BLK_FRAMES
            curPayloadLen = *(A_UINT16*)(&pBuffer[2]);
            pPacket->ActualLength = curPayloadLen + HTC_HDR_LENGTH;
            paddedLength = DEV_CALC_RECV_PADDED_LEN(pDev, pPacket->ActualLength);
#else
            paddedLength = DEV_CALC_RECV_PADDED_LEN(pDev, pPacket->ActualLength);
            if (pPacket->PktInfo.AsRx.HTCRxFlags & HTC_RX_PKT_LAST_BUNDLED_PKT_HAS_ADDTIONAL_BLOCK){
                    paddedLength += HIF_MBOX_BLOCK_SIZE;
            }
#endif
#if HIF_BUNDLE_DIFF_BLK_FRAMES
#if HIF_DBG
            totalPadLength += paddedLength;
            printk("payl %d padl %d\n", curPayloadLen, paddedLength);
#endif
#endif
            A_MEMCPY(pPacket->pBuffer, pBuffer, paddedLength);
            pBuffer += paddedLength;
        }HTC_PACKET_QUEUE_ITERATE_END;
#if HIF_BUNDLE_DIFF_BLK_FRAMES
#if HIF_DBG
        if(totalPadLength != totalLength)
            printk("ERROR: driver calc total len %d fw indicated total len %d\n", totalPadLength, totalLength);
#endif
#endif
#endif
#if HIF_COSTTIME
        do_gettimeofday(&tv);
        gt6 = tv.tv_sec*1000000 + tv.tv_usec;
#endif
    }
    /* free bundle space under Sync mode */
#if !HIF_RX_THREAD_V2
    FreeHTCBundleRxPacket(target, pPacketRxBundle);
#endif
    return status;
}

#if HIF_SCATTER_GATHER
A_STATUS HIFDevIssueRecvPacketBundleSG(HIF_SDIO_DEVICE *pDev,
        HTC_PACKET_QUEUE *pRecvPktQueue,
        HTC_PACKET_QUEUE *pSyncCompletionQueue,
        A_UINT8 MailBoxIndex,
        int *pNumPacketsFetched,
        A_BOOL  PartialBundle)
{
    A_STATUS        status = A_OK;
    HIF_SCATTER_REQ *pScatterReq;
    int             i, totalLength;
    int             pktsToScatter;
    HTC_PACKET      *pPacket;
    //A_BOOL          asyncMode = (pSyncCompletionQueue == NULL) ? TRUE : FALSE;
    A_BOOL          asyncMode = FALSE;
    int             scatterSpaceRemaining;
#if HIF_COSTTIME
    struct timeval tv;
#endif

    HTC_TARGET *target = NULL;
    target = (HTC_TARGET *)pDev->pTarget;

    //AR_DEBUG_PRINTF(ATH_DEBUG_WARN, ("+%s pSyncCompletionQueue = %p\n", __func__, pSyncCompletionQueue));

    pktsToScatter = HTC_PACKET_QUEUE_DEPTH(pRecvPktQueue);
    pktsToScatter = min(pktsToScatter, HTC_MAX_MSG_PER_BUNDLE_RX);


    if ((HTC_PACKET_QUEUE_DEPTH(pRecvPktQueue) - pktsToScatter) > 0)
    {
            /* we were forced to split this bundle receive operation
             * all packets in this partial bundle must have their lookaheads ignored */
        PartialBundle = TRUE;
            /* this would only happen if the target ignored our max bundle limit */
        AR_DEBUG_PRINTF(ATH_DEBUG_WARN, ("%s : partial bundle detected num:%d , %d \n", __func__, HTC_PACKET_QUEUE_DEPTH(pRecvPktQueue), pktsToScatter));
    }

    totalLength = 0;

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV,("+%s (Numpackets: %d , actual : %d) \n", __func__, HTC_PACKET_QUEUE_DEPTH(pRecvPktQueue), pktsToScatter));

    do {

        scatterSpaceRemaining = HTC_MAX_MSG_PER_BUNDLE_RX * target->TargetCreditSize;
        pScatterReq = DEV_ALLOC_SCATTER_REQ(pDev);

        if (pScatterReq == NULL) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERROR,("%s  no scatter resources left \n", __func__));
            break;
        }

        pScatterReq->CallerFlags = 0;

        if (PartialBundle) {
                /* mark that this is a partial bundle, this has special ramifications to the
                 * scatter completion routine */
            pScatterReq->CallerFlags |= HTC_SCATTER_REQ_FLAGS_PARTIAL_BUNDLE;
        }

            /* convert HTC packets to scatter list */
        for (i = 0; i < pktsToScatter; i++)
        {
            int paddedLength;

            pPacket = HTC_PACKET_DEQUEUE(pRecvPktQueue);
            A_ASSERT(pPacket != NULL);
            if (pPacket == NULL)
                return A_ERROR;

            paddedLength = DEV_CALC_RECV_PADDED_LEN(pDev, pPacket->ActualLength);

            if ((scatterSpaceRemaining - paddedLength) < 0) {
                    /* exceeds what we can transfer, put the packet back */
                HTC_PACKET_ENQUEUE_TO_HEAD(pRecvPktQueue,pPacket);
                break;
            }

            scatterSpaceRemaining -= paddedLength;

            if (PartialBundle || (i < (pktsToScatter - 1))) {
                    /* packet 0..n-1 cannot be checked for look-aheads since we are fetching a bundle
                     * the last packet however can have it's lookahead used */
                pPacket->PktInfo.AsRx.HTCRxFlags |= HTC_RX_PKT_IGNORE_LOOKAHEAD;
            }

            /* note: 1 HTC packet per scatter entry */
                    /* setup packet into */
            pScatterReq->ScatterList[i].pBuffer = pPacket->pBuffer;
            pScatterReq->ScatterList[i].Length = paddedLength;

            pPacket->PktInfo.AsRx.HTCRxFlags |= HTC_RX_PKT_PART_OF_BUNDLE;

            if (asyncMode) {
                    /* save HTC packet for async completion routine */
                pScatterReq->ScatterList[i].pCallerContexts[0] = pPacket;
            } else {
                    /* queue to caller's sync completion queue, caller will unload this when we return */
                HTC_PACKET_ENQUEUE(pSyncCompletionQueue,pPacket);
            }

            A_ASSERT(pScatterReq->ScatterList[i].Length);
            totalLength += pScatterReq->ScatterList[i].Length;
        }

        pScatterReq->TotalLength = totalLength;
        pScatterReq->ValidScatterEntries = i;

#if HIF_COSTTIME
        do_gettimeofday(&tv);
        gt2 = tv.tv_sec*1000000 + tv.tv_usec;
        printk("memcpy cost %lu us + rxcomp cost %lu us + alloc cost %lu us \n", gt6-gt3, gt5-gt4, gt2-gt1);
        if(gt2 > gt3)
            printk("bundle read gap %lu us\n", gt2-gt3);
#endif
        status = HIFDevSubmitScatterRequest(pDev, pScatterReq, DEV_SCATTER_READ, asyncMode);

#if HIF_COSTTIME
        do_gettimeofday(&tv);
        gt3 = tv.tv_sec*1000000 + tv.tv_usec;
        gBundleCnt++;
        if(gMaxBundleCnt < gBundleCnt)
            gMaxBundleCnt = gBundleCnt;
        printk("bundle read cost %lu us gBundleCnt %d max %d\n", gt3-gt2, gBundleCnt, gMaxBundleCnt);
#endif
        if (A_SUCCESS(status)) {
            *pNumPacketsFetched = i;
        }

        if (!asyncMode) {
                /* free scatter request */
            DEV_FREE_SCATTER_REQ(pDev, pScatterReq);
        }

    } while (FALSE);

#if HIF_COSTTIME
        do_gettimeofday(&tv);
        gt6 = tv.tv_sec*1000000 + tv.tv_usec;
#endif
    AR_DEBUG_PRINTF(ATH_DEBUG_RECV,("-HTCIssueRecvPacketBundle (status:%d) (fetched:%d) \n",
            status,*pNumPacketsFetched));

    return status;
}
#endif

#if HIF_DBG
unsigned long singlenum = 0;
int printcnd = 0;
#endif
A_STATUS HIFDevRecvMessagePendingHandler(HIF_SDIO_DEVICE *pDev,
        A_UINT8 MailBoxIndex,
        A_UINT32 MsgLookAheads[],
        int NumLookAheads,
        A_BOOL *pAsyncProc,
        int *pNumPktsFetched
#if HIF_BUNDLE_DIFF_BLK_FRAMES
        , A_UINT32 LookAhead_Part2[])
#else
        )
#endif
{
    A_STATUS status = A_OK;
    HTC_PACKET *pPacket;
    A_BOOL asyncProc = FALSE;
    A_UINT32 lookAheads[HTC_MAX_MSG_PER_BUNDLE_RX];
#if HIF_BUNDLE_DIFF_BLK_FRAMES
    A_UINT32 lookAhead_part2[HTC_MAX_MSG_PER_BUNDLE_RX];
#endif
    int pktsFetched;
    HTC_PACKET_QUEUE recvPktQueue, syncCompletedPktsQueue;
    A_BOOL partialBundle;
    HTC_ENDPOINT_ID id;
    int totalFetched = 0;
#if HIF_RX_THREAD
    unsigned long flags;
#endif
#if HIF_COSTTIME
    struct timeval tv;
#endif
#if HIF_BUNDLE_DIFF_BLK_FRAMES
#if HIF_DBG
    A_UINT16 total_len;
#endif
#endif

    HTC_TARGET *target = NULL;

    AR_DEBUG_PRINTF( ATH_DEBUG_RECV,
            ("+HTCRecvMessagePendingHandler NumLookAheads: %d \n", NumLookAheads));

    if (pNumPktsFetched != NULL) {
        *pNumPktsFetched = 0;
    }

    if (IS_DEV_IRQ_PROCESSING_ASYNC_ALLOWED(pDev)) {
        /* We use async mode to get the packets if the device layer supports it.
         * The device layer interfaces with HIF in which HIF may have restrictions on
         * how interrupts are processed */
        asyncProc = TRUE;
    }

    if (pAsyncProc != NULL) {
        /* indicate to caller how we decided to process this */
        *pAsyncProc = asyncProc;
    }
    if (NumLookAheads > HTC_MAX_MSG_PER_BUNDLE_RX) {
        A_ASSERT(FALSE);
        return A_EPROTO;
    }
    A_MEMCPY(lookAheads, MsgLookAheads, (sizeof(A_UINT32)) * NumLookAheads);
#if HIF_BUNDLE_DIFF_BLK_FRAMES
    A_MEMCPY(lookAhead_part2, LookAhead_Part2, (sizeof(A_UINT32)) * NumLookAheads);
#endif

    target = (HTC_TARGET *)pDev->pTarget;
    id = ((HTC_FRAME_HDR *) &lookAheads[0])->EndpointID;

#ifdef HTC_EP_STAT_PROFILING
    LOCK_HTC_RX(target);
    INC_HTC_EP_STAT(&target->EndPoint[id],HIFDSRCount,1);
    UNLOCK_HTC_RX(target);
#endif


    while (TRUE) {

#if HIF_COSTTIME
        do_gettimeofday(&tv);
        gt1 = tv.tv_sec*1000000 + tv.tv_usec;
#endif
        /* reset packets queues */
        INIT_HTC_PACKET_QUEUE(&recvPktQueue);
        INIT_HTC_PACKET_QUEUE(&syncCompletedPktsQueue);
        if (NumLookAheads > HTC_MAX_MSG_PER_BUNDLE_RX) {
            status = A_EPROTO;
            A_ASSERT(FALSE);
            break;
        }
        /* first lookahead sets the expected endpoint IDs for all packets in a bundle */
        id = ((HTC_FRAME_HDR *) &lookAheads[0])->EndpointID;

        if (id >= ENDPOINT_MAX) {
#if HIF_DBG
            if(printcnd == 0) {
            printcnd = 1;
#endif
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR,
                    ("MsgPend, Invalid Endpoint in look-ahead: %d \n",id));
#if HIF_DBG
            }
#endif
            status = A_EPROTO;
            break;
        }
#if HIF_BUNDLE_DIFF_BLK_FRAMES
#if HIF_DBG
        total_len = (A_UINT16)(((lookAhead_part2[0] & 0xffff0000)) >> 16);
        printk("%s total_len %d\n", __func__, total_len);
#endif
#endif
        /* try to allocate as many HTC RX packets indicated by the lookaheads
         * these packets are stored in the recvPkt queue */
        status = HIFDevAllocAndPrepareRxPackets(pDev,
                lookAheads,
                NumLookAheads,
                &recvPktQueue);
        if (A_FAILED(status)) {
            break;
        }
        totalFetched += HTC_PACKET_QUEUE_DEPTH(&recvPktQueue);

        /* we've got packet buffers for all we can currently fetch,
         * this count is not valid anymore  */
        NumLookAheads = 0;
        partialBundle = FALSE;

        /* now go fetch the list of HTC packets */
        while (!HTC_QUEUE_EMPTY(&recvPktQueue)) {
            pktsFetched = 0;
            if ((HTC_PACKET_QUEUE_DEPTH(&recvPktQueue) > 1)) {
                /* there are enough packets to attempt a bundle transfer and recv bundling is allowed  */
#if HIF_SCATTER_GATHER
                if (!pDev->HIFDevice->scatter_enabled)
#endif
                {
                    status = HIFDevIssueRecvPacketBundle(pDev,
                            &recvPktQueue,
                            asyncProc ? NULL : &syncCompletedPktsQueue,
                            MailBoxIndex,
                            &pktsFetched,
                            partialBundle
#if !HIF_RX_THREAD_V2
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                            , lookAhead_part2);
#else
                            );
#endif
#else
                            , &NumLookAheads
                            , lookAheads
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                            , lookAhead_part2);
#else
                            );
#endif
#endif
                }
#if HIF_SCATTER_GATHER
                else
                {
                    status = HIFDevIssueRecvPacketBundleSG(pDev,
                            &recvPktQueue,
                            asyncProc ? NULL : &syncCompletedPktsQueue,
                            MailBoxIndex,
                            &pktsFetched,
                            partialBundle);
                }
#endif

                if (A_FAILED(status)) {
                    while (!HTC_QUEUE_EMPTY(&recvPktQueue)) {
                        adf_nbuf_t netbuf;

                        pPacket = HTC_PACKET_DEQUEUE(&recvPktQueue);
                        if (pPacket == NULL)
                            break;
                        netbuf = (adf_nbuf_t) pPacket->pNetBufContext;
                        if (netbuf)
                            adf_nbuf_free(netbuf);
                    }
                    break;
                }

                if (HTC_PACKET_QUEUE_DEPTH(&recvPktQueue) != 0) {
                    /* we couldn't fetch all packets at one time, this creates a broken
                     * bundle  */
                    partialBundle = TRUE;
                }
                if (pktsFetched)
                {
                    HTC_TARGET *target = NULL;
                    target = (HTC_TARGET *)pDev->pTarget;

#ifdef HTC_EP_STAT_PROFILING
                    LOCK_HTC_RX(target);
                    INC_HTC_EP_STAT(&target->EndPoint[id],RxPacketsBundled,pktsFetched);
                    UNLOCK_HTC_RX(target);
#endif
                }

            }

            /* see if the previous operation fetched any packets using bundling */
            if (0 == pktsFetched) {
                /* dequeue one packet */
                pPacket = HTC_PACKET_DEQUEUE(&recvPktQueue);
                if (pPacket == NULL)
                    break;
                pPacket->Completion = NULL;

                if (HTC_PACKET_QUEUE_DEPTH(&recvPktQueue) > 0) {
                    /* lookaheads in all packets except the last one in the bundle must be ignored */
                    pPacket->PktInfo.AsRx.HTCRxFlags |= HTC_RX_PKT_IGNORE_LOOKAHEAD;
                }
#if DEBUG_BUNDLE
                adf_os_print("Recv single packet, length %d.\n", pPacket->ActualLength);
#endif

#if defined(DEBUG_HL_LOGGING) && defined(CONFIG_HL_SUPPORT)
                target->rx_bundle_stats[0]++;
#endif

                /* go fetch the packet */
                status = HIFDevRecvPacket(pDev, pPacket, pPacket->ActualLength, MailBoxIndex);
                if (A_FAILED(status)) {
                    break;
                }
                /* sent synchronously, queue this packet for synchronous completion */
#if HIF_RX_THREAD_V2
                NumLookAheads = 0;
                HIFDevPreprocessTrailer(pDev, pPacket, lookAheads, &NumLookAheads
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                    , lookAhead_part2);
#else
                        );
#endif

#if HIF_DBG
                printk("got single %p 0x%08X singlenum %lu len %d trailer %d\n", pPacket, *(A_UINT32*)pPacket->pBuffer, ++singlenum, pPacket->ActualLength, NumLookAheads);
#endif

                pPacket->BundlePktnum = 1;
                spin_lock_irqsave(&pDev->pRecvTask->rx_sync_completion_lock, flags);
                HTC_PACKET_ENQUEUE(&pDev->pRecvTask->rxSyncCompletionQueue, pPacket);
                spin_unlock_irqrestore(&pDev->pRecvTask->rx_sync_completion_lock, flags);
#else
                HTC_PACKET_ENQUEUE(&syncCompletedPktsQueue, pPacket);
#endif
            }
        }

        /* synchronous handling */
        if (pDev->DSRCanYield) {
            /* for the SYNC case, increment count that tracks when the DSR should yield */
            pDev->CurrentDSRRecvCount++;
        }

        /* in the sync case, all packet buffers are now filled,
         * we can process each packet, check lookaheads and then repeat */

#if HIF_COSTTIME
        do_gettimeofday(&tv);
        gt4 = tv.tv_sec*1000000 + tv.tv_usec;
#endif

#if HIF_RX_THREAD
#if !HIF_RX_THREAD_V2
        while (!HTC_QUEUE_EMPTY(&syncCompletedPktsQueue)) {
            pPacket = HTC_PACKET_DEQUEUE(&syncCompletedPktsQueue);
            if (pPacket == NULL)
                break;

            NumLookAheads = 0;
            status = HIFDevProcessRecvHeader(pDev, pPacket, lookAheads, &NumLookAheads, TRUE
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                    , lookAhead_part2);
#else
                    );
#endif
            if (A_FAILED(status)) {
                break;
            }
            spin_lock_irqsave(&pDev->pRecvTask->rx_completion_lock, flags);
            HTC_PACKET_ENQUEUE(&pDev->pRecvTask->rxComQueue, pPacket);
            spin_unlock_irqrestore(&pDev->pRecvTask->rx_completion_lock, flags);
        }
#endif
#if HIF_DBG
        printk("up task\n");
#endif
        up(&pDev->pRecvTask->sem_rx_completion);
#else
        /* unload sync completion queue */
        while (!HTC_QUEUE_EMPTY(&syncCompletedPktsQueue)) {
            A_UINT8 pipeid;
            adf_nbuf_t netbuf;

            pPacket = HTC_PACKET_DEQUEUE(&syncCompletedPktsQueue);
            if (pPacket == NULL)
                break;

            NumLookAheads = 0;
            status = HIFDevProcessRecvHeader(pDev, pPacket, lookAheads, &NumLookAheads, TRUE
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                    , lookAhead_part2);
#else
                    );
#endif
            if (A_FAILED(status)) {
                break;
            }

            netbuf = (adf_nbuf_t) pPacket->pNetBufContext;
            /* set data length */
            adf_nbuf_put_tail(netbuf, pPacket->ActualLength);

            if (pDev->hif_callbacks.rxCompletionHandler) {
                pipeid = HIFDevMapMailBoxToPipe(pDev, MailBoxIndex, TRUE);
                pDev->hif_callbacks.rxCompletionHandler(pDev->hif_callbacks.Context,
                        netbuf,
                        pipeid);
            }
        }
#endif
#if HIF_COSTTIME
        do_gettimeofday(&tv);
        gt5 = tv.tv_sec*1000000 + tv.tv_usec;
#endif
        if (A_FAILED(status)) {
            break;
        }

        if (NumLookAheads == 0) {
            /* no more look aheads */
            break;
        }
        /* check whether other OS contexts have queued any WMI command/data for WLAN.
         * This check is needed only if WLAN Tx and Rx happens in same thread context */
        A_CHECK_DRV_TX();
    }
    if (pNumPktsFetched != NULL) {
        *pNumPktsFetched = totalFetched;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("-HTCRecvMessagePendingHandler \n"));
    return status;
}

static A_STATUS HIFDevServiceCPUInterrupt(HIF_SDIO_DEVICE *pDev)
{
    A_STATUS status;
    A_UINT8 cpu_int_status;
    A_UINT8 regBuffer[4];

    AR_DEBUG_PRINTF(ATH_DEBUG_IRQ, ("CPU Interrupt\n"));
    if (pDev == NULL)
       return A_ERROR;

    cpu_int_status = pDev->IrqProcRegisters.cpu_int_status
            & pDev->IrqEnableRegisters.cpu_int_status_enable;
    A_ASSERT(cpu_int_status);
    AR_DEBUG_PRINTF( ATH_DEBUG_IRQ,
            ("Valid interrupt source(s) in CPU_INT_STATUS: 0x%x\n", cpu_int_status));

    /* Clear the interrupt */
    pDev->IrqProcRegisters.cpu_int_status &= ~cpu_int_status; /* W1C */

    /* set up the register transfer buffer to hit the register 4 times , this is done
     * to make the access 4-byte aligned to mitigate issues with host bus interconnects that
     * restrict bus transfer lengths to be a multiple of 4-bytes */

    /* set W1C value to clear the interrupt, this hits the register first */
    regBuffer[0] = cpu_int_status;
    /* the remaining 4 values are set to zero which have no-effect  */
    regBuffer[1] = 0;
    regBuffer[2] = 0;
    regBuffer[3] = 0;

    status = HIFReadWrite(pDev->HIFDevice,
            CPU_INT_STATUS_ADDRESS,
            regBuffer,
            4,
            HIF_WR_SYNC_BYTE_FIX,
            NULL);

    A_ASSERT(status == A_OK);

    /* The Interrupt sent to the Host is generated via bit0 of CPU INT register*/
    if (cpu_int_status & 0x1){
        if (pDev && pDev->hif_callbacks.fwEventHandler)
            /* It calls into HTC which propagates this to ol_target_failure() */
            pDev->hif_callbacks.fwEventHandler(pDev->hif_callbacks.Context,
                                               A_ERROR);
    }
    else
    AR_DEBUG_PRINTF( ATH_DEBUG_ERROR,
            ("%s: Unable to call fwEventHandler, invalid input arguments\n",__func__));

    return status;
}

static A_STATUS HIFDevServiceErrorInterrupt(HIF_SDIO_DEVICE *pDev)
{
    A_STATUS status;
    A_UINT8 error_int_status;
    A_UINT8 regBuffer[4];

    AR_DEBUG_PRINTF(ATH_DEBUG_IRQ, ("Error Interrupt\n"));
    error_int_status = pDev->IrqProcRegisters.error_int_status & 0x0F;
    A_ASSERT(error_int_status);
    AR_DEBUG_PRINTF( ATH_DEBUG_IRQ,
            ("Valid interrupt source(s) in ERROR_INT_STATUS: 0x%x\n", error_int_status));

    if (ERROR_INT_STATUS_WAKEUP_GET(error_int_status)) {
        /* Wakeup */
        AR_DEBUG_PRINTF(ATH_DEBUG_IRQ, ("Error : Wakeup\n"));
    }

    if (ERROR_INT_STATUS_RX_UNDERFLOW_GET(error_int_status)) {
        /* Rx Underflow */
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Error : Rx Underflow\n"));
    }

    if (ERROR_INT_STATUS_TX_OVERFLOW_GET(error_int_status)) {
        /* Tx Overflow */
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Error : Tx Overflow\n"));
    }

    /* Clear the interrupt */
    pDev->IrqProcRegisters.error_int_status &= ~error_int_status; /* W1C */

    /* set up the register transfer buffer to hit the register 4 times , this is done
     * to make the access 4-byte aligned to mitigate issues with host bus interconnects that
     * restrict bus transfer lengths to be a multiple of 4-bytes */

    /* set W1C value to clear the interrupt, this hits the register first */
    regBuffer[0] = error_int_status;
    /* the remaining 4 values are set to zero which have no-effect  */
    regBuffer[1] = 0;
    regBuffer[2] = 0;
    regBuffer[3] = 0;

    status = HIFReadWrite(pDev->HIFDevice,
            ERROR_INT_STATUS_ADDRESS,
            regBuffer,
            4,
            HIF_WR_SYNC_BYTE_FIX,
            NULL);

    A_ASSERT(status == A_OK);
    return status;
}

static A_STATUS HIFDevServiceDebugInterrupt(HIF_SDIO_DEVICE *pDev)
{
    A_UINT32 dummy;
    A_STATUS status;

    /* Send a target failure event to the application */
    AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Target debug interrupt\n"));

    /* clear the interrupt , the debug error interrupt is
     * counter 0 */
    /* read counter to clear interrupt */
    status = HIFReadWrite(pDev->HIFDevice,
            COUNT_DEC_ADDRESS,
            (A_UINT8 *) &dummy,
            4,
            HIF_RD_SYNC_BYTE_INC,
            NULL);

    A_ASSERT(status == A_OK);
    return status;
}

static A_STATUS HIFDevServiceCounterInterrupt(HIF_SDIO_DEVICE *pDev)
{
    A_UINT8 counter_int_status;

    AR_DEBUG_PRINTF(ATH_DEBUG_IRQ, ("Counter Interrupt\n"));

    counter_int_status = pDev->IrqProcRegisters.counter_int_status
            & pDev->IrqEnableRegisters.counter_int_status_enable;

    AR_DEBUG_PRINTF( ATH_DEBUG_IRQ,
            ("Valid interrupt source(s) in COUNTER_INT_STATUS: 0x%x\n", counter_int_status));

    /* Check if the debug interrupt is pending
     * NOTE: other modules like GMBOX may use the counter interrupt for
     * credit flow control on other counters, we only need to check for the debug assertion
     * counter interrupt */
    if (counter_int_status & AR6K_TARGET_DEBUG_INTR_MASK) {
        return HIFDevServiceDebugInterrupt(pDev);
    }

    return A_OK;
}

/* process pending interrupts synchronously */
static A_STATUS HIFDevProcessPendingIRQs(HIF_SDIO_DEVICE *pDev, A_BOOL *pDone,
        A_BOOL *pASyncProcessing)
{
    A_STATUS status = A_OK;
    A_UINT8 host_int_status = 0;
    A_UINT32 lookAhead[MAILBOX_USED_COUNT];
#if HIF_BUNDLE_DIFF_BLK_FRAMES
    A_UINT32 lookAhead_part2[MAILBOX_USED_COUNT];
#endif
    int i;
#if HIF_COSTTIME
    struct timeval tv;
#endif

    A_MEMZERO(&lookAhead, sizeof(lookAhead));
    AR_DEBUG_PRINTF(ATH_DEBUG_IRQ,
            ("+ProcessPendingIRQs: (dev: 0x%lX)\n", (unsigned long)pDev));

    /*** NOTE: the HIF implementation guarantees that the context of this call allows
     *         us to perform SYNCHRONOUS I/O, that is we can block, sleep or call any API that
     *         can block or switch thread/task ontexts.
     *         This is a fully schedulable context.
     * */
    do {

        if (pDev->IrqEnableRegisters.int_status_enable == 0) {
            /* interrupt enables have been cleared, do not try to process any pending interrupts that
             * may result in more bus transactions.  The target may be unresponsive at this
             * point. */
            break;
        }

#ifdef HIF_SYNC_READ
        status = HIFSyncRead(pDev->HIFDevice,
                    HOST_INT_STATUS_ADDRESS,
                    (A_UINT8 *) &pDev->IrqProcRegisters,
                    sizeof(pDev->IrqProcRegisters),
                    HIF_RD_SYNC_BYTE_INC,
                    NULL);
#else
        status = HIFReadWrite(pDev->HIFDevice,
                    HOST_INT_STATUS_ADDRESS,
                    (A_UINT8 *) &pDev->IrqProcRegisters,
                    sizeof(pDev->IrqProcRegisters),
                    HIF_RD_SYNC_BYTE_INC,
                    NULL);
#endif

        if (A_FAILED(status)) {
            break;
        }
#if HIF_COSTTIME
        do_gettimeofday(&tv);
        gt7 = tv.tv_sec*1000000 + tv.tv_usec;
#endif

        if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_IRQ)) {
            HIFDevDumpRegisters(pDev,
                    &pDev->IrqProcRegisters,
                    &pDev->IrqEnableRegisters,
                    &pDev->MailBoxCounterRegisters);
        }

        /* Update only those registers that are enabled */
        host_int_status = pDev->IrqProcRegisters.host_int_status
                & pDev->IrqEnableRegisters.int_status_enable;

        /* only look at mailbox status if the HIF layer did not provide this function,
         * on some HIF interfaces reading the RX lookahead is not valid to do */
        for (i = 0; i < MAILBOX_USED_COUNT; i++) {
            lookAhead[i] = 0;
            if (host_int_status & (1 << i)) {
                /* mask out pending mailbox value, we use "lookAhead" as the real flag for
                 * mailbox processing below */
                host_int_status &= ~(1 << i);
                if (pDev->IrqProcRegisters.rx_lookahead_valid & (1 << i)) {
                    /* mailbox has a message and the look ahead is valid */
                    lookAhead[i] = pDev->IrqProcRegisters.rx_lookahead[MAILBOX_LOOKAHEAD_SIZE_IN_WORD*i];
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                    lookAhead_part2[i] = pDev->IrqProcRegisters.rx_lookahead[MAILBOX_LOOKAHEAD_SIZE_IN_WORD*i + 1];
#endif
                }
            }
        } /*end of for loop*/
#if HIF_DBG
        if(printcnd == 0)
            printk("lookahead: 0x%08X 0x%08X\n", pDev->IrqProcRegisters.rx_lookahead[0], pDev->IrqProcRegisters.rx_lookahead[1]);
#endif
#if HIF_DBG
        printk("lookahead: 0x%08X\n", lookAhead[0]);
        if(((HTC_FRAME_HDR *) &lookAhead[0])->EndpointID >= ENDPOINT_MAX )
            printk("endpoint id in register invalid %d\n", ((HTC_FRAME_HDR *) &lookAhead[0])->EndpointID);
#endif
    } while (FALSE);

    do {
        A_BOOL bLookAheadValid = FALSE;
        /* did the interrupt status fetches succeed? */
        if (A_FAILED(status)) {
            break;
        }

        for (i = 0; i < MAILBOX_USED_COUNT; i++) {
            if (lookAhead[i] != 0) {
                bLookAheadValid = TRUE;
                break;
            }
        }

        if ((0 == host_int_status) && !bLookAheadValid) {
            /* nothing to process, the caller can use this to break out of a loop */
            *pDone = TRUE;
            break;
        }

        if (bLookAheadValid) {
            for (i = 0; i < MAILBOX_USED_COUNT; i++) {
                int fetched = 0;
                if (lookAhead[i] == 0) {
                    continue;
                }
                AR_DEBUG_PRINTF(ATH_DEBUG_IRQ,
                        ("Pending mailbox[%d] message, LookAhead: 0x%X\n", i, lookAhead[i]));
                /* Mailbox Interrupt, the HTC layer may issue async requests to empty the
                 * mailbox...
                 * When emptying the recv mailbox we use the async handler above called from the
                 * completion routine of the callers read request. This can improve performance
                 * by reducing context switching when we rapidly pull packets */
                status = HIFDevRecvMessagePendingHandler(pDev,
                        i,
                        &lookAhead[i],
                        1,
                        pASyncProcessing,
                        &fetched
#if HIF_BUNDLE_DIFF_BLK_FRAMES
                        , lookAhead_part2);
#else
                        );
#endif
                if (A_FAILED(status)) {
                    break;
                }

                if (!fetched) {
                    /* HTC could not pull any messages out due to lack of resources */
                    /* force DSR handler to ack the interrupt */
                    *pASyncProcessing = FALSE;
                    pDev->RecheckIRQStatusCnt = 0;
                }
            }
        }

        /* now handle the rest of them */
        AR_DEBUG_PRINTF( ATH_DEBUG_IRQ,
                (" Valid interrupt source(s) for OTHER interrupts: 0x%x\n", host_int_status));

        if (HOST_INT_STATUS_CPU_GET(host_int_status)) {
            /* CPU Interrupt */
            status = HIFDevServiceCPUInterrupt(pDev);
            if (A_FAILED(status)) {
                break;
            }
        }

        if (HOST_INT_STATUS_ERROR_GET(host_int_status)) {
            /* Error Interrupt */
            status = HIFDevServiceErrorInterrupt(pDev);
            if (A_FAILED(status)) {
                break;
            }
        }

        if (HOST_INT_STATUS_COUNTER_GET(host_int_status)) {
            /* Counter Interrupt */
            status = HIFDevServiceCounterInterrupt(pDev);
            if (A_FAILED(status)) {
                break;
            }
        }

    } while (FALSE);

    /* an optimization to bypass reading the IRQ status registers unecessarily which can re-wake
     * the target, if upper layers determine that we are in a low-throughput mode, we can
     * rely on taking another interrupt rather than re-checking the status registers which can
     * re-wake the target.HIFDevProcessRecvHeader,
     *
     * NOTE : for host interfaces that use the special GetPendingEventsFunc, this optimization cannot
     * be used due to possible side-effects.  For example, SPI requires the host to drain all
     * messages from the mailbox before exiting the ISR routine. */
    if (!(*pASyncProcessing) && (pDev->RecheckIRQStatusCnt == 0)) {
        AR_DEBUG_PRINTF(ATH_DEBUG_IRQ,
                ("Bypassing IRQ Status re-check, forcing done \n"));
        *pDone = TRUE;
    }

    AR_DEBUG_PRINTF( ATH_DEBUG_IRQ,
            ("-ProcessPendingIRQs: (done:%d, async:%d) status=%d \n", *pDone, *pASyncProcessing, status));

    return status;
}

#define DEV_CHECK_RECV_YIELD(pDev) \
            ((pDev)->CurrentDSRRecvCount >= (pDev)->HifIRQYieldParams.RecvPacketYieldCount)
/* Synchronousinterrupt handler, this handler kicks off all interrupt processing.*/
A_STATUS HIFDevDsrHandler(void *context)
{
    HIF_SDIO_DEVICE *pDev = (HIF_SDIO_DEVICE *) context;
    A_STATUS status = A_OK;
    A_BOOL done = FALSE;
    A_BOOL asyncProc = FALSE;
#if HIF_COSTTIME
    struct timeval tv;
#endif

    AR_DEBUG_PRINTF(ATH_DEBUG_IRQ,
            ("+DevDsrHandler: (dev: 0x%lX)\n", (unsigned long)pDev));

    /* reset the recv counter that tracks when we need to yield from the DSR */
    pDev->CurrentDSRRecvCount = 0;
    /* reset counter used to flag a re-scan of IRQ status registers on the target */
    pDev->RecheckIRQStatusCnt = 0;

    while (!done) {
#if (HIF_DBG) || (HIF_COSTTIME)
        printk("dsr asyncQ %d\n", HTC_PACKET_QUEUE_DEPTH(&pDev->pRecvTask->rxAllocQueue));
#endif
#if HIF_COSTTIME
        gBundleCnt = 0;
        do_gettimeofday(&tv);
        gt0 = tv.tv_sec*1000000 + tv.tv_usec;
#endif
        status = HIFDevProcessPendingIRQs(pDev, &done, &asyncProc);
        if (A_FAILED(status)) {
            break;
        }

        if (HIF_DEVICE_IRQ_SYNC_ONLY == pDev->HifIRQProcessingMode) {
            /* the HIF layer does not allow async IRQ processing, override the asyncProc flag */
            asyncProc = FALSE;
            /* this will cause us to re-enter ProcessPendingIRQ() and re-read interrupt status registers.
             * this has a nice side effect of blocking us until all async read requests are completed.
             * This behavior is required on some HIF implementations that do not allow ASYNC
             * processing in interrupt handlers (like Windows CE) */

            if (pDev->DSRCanYield && DEV_CHECK_RECV_YIELD(pDev)) {
                /* ProcessPendingIRQs() pulled enough recv messages to satisfy the yield count, stop
                 * checking for more messages and return */
                break;
            }
        }

        if (asyncProc) {
            /* the function performed some async I/O for performance, we
             need to exit the ISR immediately, the check below will prevent the interrupt from being
             Ack'd while we handle it asynchronously */
            break;
        }

    }

    if (A_SUCCESS(status) && !asyncProc) {
        /* Ack the interrupt only if :
         *  1. we did not get any errors in processing interrupts
         *  2. there are no outstanding async processing requests */
        if (pDev->DSRCanYield) {
            /* if the DSR can yield do not ACK the interrupt, there could be more pending messages.
             * The HIF layer must ACK the interrupt on behalf of HTC */
            AR_DEBUG_PRINTF( ATH_DEBUG_IRQ,
                    (" Yield in effect (cur RX count: %d) \n", pDev->CurrentDSRRecvCount));
        } else {
            AR_DEBUG_PRINTF(ATH_DEBUG_IRQ,
                    (" Acking interrupt from DevDsrHandler \n"));
            HIFAckInterrupt(pDev->HIFDevice);
        }
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_IRQ, ("-DevDsrHandler \n"));
    return status;
}

