#!/bin/sh

if [ $# -ne 5 ]
then
    echo -e "Error: wrong input parameters"
    echo -e "usage: ./lxc_creat.sh mode rootbox_dir lxc_name"
    echo -e "        for example: ./lxc_create_lxc0.sh DEBUG /home/user/HiSTBLinuxV100R002/out/hi3716mv410/hi3716m41dma_ca_debug/rootbox stb arm-histbv300-linux"
    exit 1
fi

#===========prepare environment=================================================
#fetch configure
source $5/lxc0_network_proxy.config

LXC_MODE=$1
SDK_PATH=$2/../../../..
PREFIX=$2
name=$3
toolchain_name=$4
CUR_PATH=$5

SAMPLE_OUT_PATH=$2/../$OBJ_NAME/sample

echo -e "p1:$1 p2:$2  p3:$3 p4:$4 p5:$5"
STRIP=${toolchain_name}-strip


#===========function: create fs directory tree==================================
function configure_main_app()
{
    echo  "=========$CUR_PATH/lxc0_network_proxy.config=============="
    echo  "LXC_CAPABILITY         :$LXC_CAPABILITY"
    echo  "LXC_CONSOLE_ENABLE     :$LXC_CONSOLE_ENABLE"
    echo  "LXC_DEV_MCE_ENABLE     :$LXC_DEV_MCE_ENABLE"
    echo  "LXC_DEV_OTP_ENABLE     :$LXC_DEV_OTP_ENABLE"
    echo  "LXC_DEV_PM_ENABLE      :$LXC_DEV_PM_ENABLE"
    echo  "LXC_DEV_PNG_ENABLE     :$LXC_DEV_PNG_ENABLE"
    echo  "LXC_DEV_JPEG_ENABLE    :$LXC_DEV_JPEG_ENABLE"
    echo  "LXC_DEV_PQ_ENABLE      :$LXC_DEV_PQ_ENABLE"
    echo  "LXC_DEV_TDE_ENABLE     :$LXC_DEV_TDE_ENABLE"
    echo  "LXC_DEV_WATCHDOG_ENABLE:$LXC_DEV_WATCHDOG_ENABLE"
    echo  "LXC_DEV_FUSE_ENABLE    :$LXC_DEV_FUSE_ENABLE"
    echo  "LXC_DEV_AUDIO_ENABLE   :$LXC_DEV_AUDIO_ENABLE"
    echo  "LXC_DEV_CA_ENABLE      :$LXC_DEV_CA_ENABLE"
    echo  "LXC_DEV_CIPHER_ENABLE  :$LXC_DEV_CIPHER_ENABLE"
    echo  "LXC_DEV_DEMUX_ENABLE   :$LXC_DEV_DEMUX_ENABLE"
    echo  "LXC_DEV_GPIO_ENABLE    :$LXC_DEV_GPIO_ENABLE"
    echo  "LXC_DEV_I2C_ENABLE     :$LXC_DEV_I2C_ENABLE"
    echo  "LXC_DEV_IR_ENABLE      :$LXC_DEV_IR_ENABLE"
    echo  "LXC_DEV_KEYLED_ENABLE  :$LXC_DEV_KEYLED_ENABLE"
    echo  "LXC_DEV_LOG_ENABLE     :$LXC_DEV_LOG_ENABLE"
    echo  "LXC_DEV_PVR_ENABLE     :$LXC_DEV_PVR_ENABLE"
    echo  "LXC_DEV_SCI_ENABLE     :$LXC_DEV_SCI_ENABLE"
    echo  "LXC_DEV_TUNER_ENABLE   :$LXC_DEV_TUNER_ENABLE"
    echo  "LXC_DEV_PROC_ENABLE    :$LXC_DEV_PROC_ENABLE"
    echo  "LXC_DEV_VDEC_ENABLE    :$LXC_DEV_VDEC_ENABLE"
    echo  "LXC_DEV_VO_ENABLE      :$LXC_DEV_VO_ENABLE"
    echo  "LXC_DEV_USB_ENABLE     :$LXC_DEV_USB_ENABLE"
    echo  "LXC_DEV_ETHERNET_ENABLE:$LXC_DEV_ETHERNET_ENABLE"
    echo  "LXC_DEV_BINDER         :$LXC_DEV_BINDER"
    echo  "LXC_DEV_TTYAMA0_ENABLE :$LXC_DEV_TTYAMA0_ENABLE"
    echo  "LXC_DEV_HI_CA_ENABLE   :$LXC_DEV_HI_CA_ENABLE"
    echo  "LXC_DEV_MODULE_ENABLE  :$LXC_DEV_MODULE_ENABLE"
    echo  "LXC_DEV_HI_CERT_ENABLE :$LXC_DEV_HI_CERT_ENABLE"
    echo  "LXC_FIREWALL_ENABLE    :$LXC_FIREWALL_ENABLE"
    echo  "LXC_TEEC_ENABLE        :$LXC_TEEC_ENABLE"
    echo  "LXC_HIGO_ENABLE        :$LXC_HIGO_ENABLE"
    echo  "LXC_HIPLAYER_ENABLE    :$LXC_HIPLAYER_ENABLE"
}

# create fs directory tree
function install_fs_dir()
{
    TREE_PATH="$PREFIX/$lxc_rootfs_dir/dev "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/home "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/root "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/etc "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/etc/init.d "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/bin "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/sbin "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/proc "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/sys "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/mnt "
    TREE_PATH+="PREFIX/$lxc_rootfs_dir/mnt/ca "
    TREE_PATH+="PREFIX/$lxc_rootfs_dir/mnt/flash_dat "
    TREE_PATH+="PREFIX/$lxc_rootfs_dir/mnt/dbase "
    TREE_PATH+="PREFIX/$lxc_rootfs_dir/mnt/app "
    TREE_PATH+="PREFIX/$lxc_rootfs_dir/mnt/date "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/tmp "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/dev/pts "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/lib "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/usr/sbin "
    TREE_PATH+="$PREFIX/$lxc_rootfs_dir/usr/lib "

    for tree in $TREE_PATH ; do
       mkdir -p $tree
       chmod 755 $tree
    done

    mkdir -p $PREFIX/`dirname $lxc_config_file`
}

#===========function: create container init script for CA debug=========
function install_dbg_fs_scripts()
{
    echo "=======install debug FS configure================="
    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/inittab
::sysinit:/etc/init.d/rcS
tty1::respawn:/bin/sh
EOF
    chmod 644 $PREFIX/$lxc_rootfs_dir/etc/inittab

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/init.d/rcS
#!/bin/sh
/etc/firewall
EOF
    chmod 744 $PREFIX/$lxc_rootfs_dir/etc/init.d/rcS

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/passwd
root:x:0:0:root:/root:/bin/sh
proxy:x:1001:1001:Linux User,,,:/home:/bin/sh
EOF
    chmod 644 $PREFIX/$lxc_rootfs_dir/etc/passwd

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/group
root:x:0:root
gproxy:x:1001:
EOF
    chmod 644 $PREFIX/$lxc_rootfs_dir/etc/group

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/shadow
$name:\$1\$eF8I65UL\$7FfdLFZEBw46GPpAOYcOQ/:0:0:99999:7:::
EOF
    chmod 640 $PREFIX/$lxc_rootfs_dir/etc/shadow

    # udhcpc scripts
    mkdir -p $PREFIX/$lxc_rootfs_dir/usr/share/udhcpc
    cp -r $PREFIX/usr/share/udhcpc/* $PREFIX/$lxc_rootfs_dir/usr/share/udhcpc
    cp -r $PREFIX/bin/mkdir          $PREFIX/$lxc_rootfs_dir/bin/mkdir
    cp -r $PREFIX/usr/sbin/arping    $PREFIX/$lxc_rootfs_dir/usr/sbin/arping
}


#===========function: create container init script for CA release============
function install_rel_fs_scripts()
{
    echo "=======install release FS configure==============="
    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/inittab
::sysinit:/etc/init.d/rcS
EOF
    chmod 644 $PREFIX/$lxc_rootfs_dir/etc/inittab

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/init.d/rcS
#!/bin/sh
/etc/firewall
EOF
    chmod 744 $PREFIX/$lxc_rootfs_dir/etc/init.d/rcS

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/passwd
root:x:0:0:root:/root:/bin/false
proxy:x:1001:1001:Linux User,,,:/home:/bin/sh
EOF
    chmod 644 $PREFIX/$lxc_rootfs_dir/etc/passwd

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/group
root:x:0:root
gproxy:x:1001:
EOF
    chmod 644 $PREFIX/$lxc_rootfs_dir/etc/group

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/shadow
root:!:15506:0:99999:7:::
EOF
    chmod 640 $PREFIX/$lxc_rootfs_dir/etc/shadow

}

#===========function: install busybox============================================
function install_busybox()
{
    # refer to Busybox Config File For LXC
    echo "=======Copy busybox meterial to LXC====="
    cp -r $PREFIX/home/stb/* $PREFIX/$lxc_rootfs_dir/
    cp -r $PREFIX/usr/sbin/init.lxc $PREFIX/$lxc_rootfs_dir/usr/sbin/
    if [[ $LXC_ETHERNET_ENABLE == y* ]]; then
        cp -r $PREFIX/sbin/iptables $PREFIX/$lxc_rootfs_dir/sbin/
        cp -r $PREFIX/sbin/xtables-multi $PREFIX/$lxc_rootfs_dir/sbin/
    fi
}

#===========function: Generate firewall for LXC==================================
function install_firewall()
{
    if [[ $LXC_ETHERNET_ENABLE == n* ]]; then
        return;
    fi

    if [[ $LXC_FIREWALL_ENABLE == n* ]]; then
        return;
    fi

    echo "=======install firewall==========================="

    LXC1_ADDR=192.168.1.2
    LXC2_ADDR=192.168.2.2

    cat <<EOF > $PREFIX/$lxc_rootfs_dir/etc/firewall
#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward

##Set default policy to DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

## Flush, Zero all chains
iptables -F
iptables -t raw -F
iptables -t nat -F

iptables -Z
iptables -t raw -Z
iptables -t nat -Z

## Delete any user defined chains
iptables -X
iptables -t raw -X
iptables -t nat -X

#######################################Define our chain###########################################################
iptables -t raw -N CHECK_TCPFLAGS
iptables -t raw -A CHECK_TCPFLAGS -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -t raw -A CHECK_TCPFLAGS -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -t raw -A CHECK_TCPFLAGS -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
iptables -t raw -A CHECK_TCPFLAGS -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
iptables -t raw -A CHECK_TCPFLAGS -p tcp --tcp-flags ALL ALL -j DROP
iptables -t raw -A CHECK_TCPFLAGS -p tcp --tcp-flags ALL NONE -j DROP
iptables -t raw -A CHECK_TCPFLAGS -p tcp --tcp-flags URG,FIN URG,FIN -j DROP

######################################Process PREROUTING chain of raw table########################################
iptables -t raw -A PREROUTING -f -j DROP
iptables -t raw -A PREROUTING -m addrtype --src-type BLACKHOLE,UNREACHABLE,PROHIBIT,ANYCAST,BROADCAST -j DROP
iptables -t raw -A PREROUTING -m addrtype --dst-type BLACKHOLE,UNREACHABLE,PROHIBIT,ANYCAST,BROADCAST -j DROP
#iptables -t raw -A PREROUTING -p icmp -j DROP
iptables -t raw -A PREROUTING -i eth0 -m addrtype --src-type LOCAL -j DROP
iptables -t raw -A PREROUTING -i eth1 -m addrtype --src-type LOCAL -j DROP
iptables -t raw -A PREROUTING -i eth2 -m addrtype --src-type LOCAL -j DROP

#Dicard connecton from LXC2
iptables -t raw -A PREROUTING -i eth2 -p tcp --tcp-flags ALL SYN -j DROP
iptables -t raw -A PREROUTING -p tcp -j CHECK_TCPFLAGS

iptables -t raw -A PREROUTING -i eth0 -s 127.0.0.1/8 -j DROP
iptables -t raw -A PREROUTING -i eth1 -s 127.0.0.1/8 -j DROP
iptables -t raw -A PREROUTING -i eth2 -s 127.0.0.1/8 -j DROP

######################################Process PREROUTING chain of nat table########################################
# map http server port 80 to one private port 8888 for the non-privilege mode
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8888 -j DNAT --to-destination $LXC2_ADDR:8888

#######################################Process Forward packet###########################################################
#Dicard invalid packet for forward
iptables -A FORWARD -p tcp -m conntrack --ctstate INVALID -j DROP

#Syn-flood protection:
iptables -t filter -A FORWARD -i eth0 -o eth1 -d $LXC2_ADDR -p tcp --syn -m limit --limit 1/s -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o eth1 -d $LXC2_ADDR -p tcp -j DROP

#Forward the packet from eth0 to LXC1,LXC2
iptables -A FORWARD -i eth0 -o eth1 -d $LXC1_ADDR -p tcp -m tcp --sport 4444 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth2 -d $LXC2_ADDR -p tcp -m tcp --dport 8888 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i eth0 -o eth1 -d $LXC1_ADDR -p tcp -m tcp --sport 80 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth2 -d $LXC2_ADDR -p tcp -m tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT

#Forward the packet from LXC1,LXC2 to eth0
iptables -A FORWARD -i eth1 -o eth0 -s $LXC1_ADDR -p tcp -m tcp --dport 4444 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -s $LXC2_ADDR -p tcp -m tcp --sport 8888 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i eth1 -o eth0 -s $LXC1_ADDR -p tcp -m tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -s $LXC2_ADDR -p tcp -m tcp --sport 80 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#icmp allowd
iptables -A FORWARD -p icmp -j ACCEPT
######################################Process Local packet########################################
#########Process INPUT chain of raw table for local packet##
##reject invalid TCP flag under some one connection state
iptables -A INPUT -p tcp -m conntrack --ctstate INVALID -j DROP
## Allow loop back come in
iptables -A INPUT -i lo -j ACCEPT

#Furtive port scanner protection:
iptables -A INPUT -i eth0 -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 30/minute --limit-burst 5 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --tcp-flags SYN,ACK,FIN,RST RST -j DROP

##Allow multicast packets from DMC to come in
iptables -A INPUT -i eth0 -p udp --dport 1900 -d 239.255.255.250 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -m limit --limit 30/m --limit-burst 30 -j ACCEPT
iptables -A INPUT -i eth0 -p udp -j DROP

##Allow TCP request packets from DMC to come in
iptables -A INPUT -i eth0 -p tcp --dport 49152 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m tcp  -j ACCEPT

#icmp allowd
iptables -A INPUT -p icmp -j ACCEPT


#######for UDHCPC##################
iptables -A INPUT -i eth0 -p icmp -j DROP

iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
#We only accept part of icmp type 3
iptables -A INPUT -p icmp --icmp-type 3/0 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 3/1 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 3/2 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 3/3 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 3/4 -j ACCEPT

#Allow DHCP package come in
iptables -A INPUT -i eth0 -p udp -m udp --sport 67 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#########Process OUTPUT chain of raw table for local packet####
iptables -t raw -A OUTPUT -f -j DROP
iptables -t raw -A OUTPUT -m addrtype --src-type BLACKHOLE,UNREACHABLE,PROHIBIT,ANYCAST,BROADCAST -j DROP
iptables -t raw -A OUTPUT -m addrtype --dst-type BLACKHOLE,UNREACHABLE,PROHIBIT,ANYCAST,BROADCAST -j DROP
#iptables -t raw -A OUTPUT -p icmp -j DROP
iptables -t raw -A OUTPUT -o eth0 -m addrtype --dst-type LOCAL -j DROP
iptables -t raw -A OUTPUT -o eth1 -m addrtype --dst-type LOCAL -j DROP
iptables -t raw -A OUTPUT -o eth2 -m addrtype --dst-type LOCAL -j DROP

iptables -t raw -A OUTPUT -p tcp -j CHECK_TCPFLAGS

#########Process OUTPUT chain of filter table for local packet####
iptables -A OUTPUT -o eth0 -d 127.0.0.1/8 -j DROP
iptables -A OUTPUT -o eth1 -d 127.0.0.1/8 -j DROP
iptables -A OUTPUT -o eth2 -d 127.0.0.1/8 -j DROP

## Reject invalid state packet output
iptables -A OUTPUT -p tcp -m conntrack --ctstate INVALID -j DROP

## Allow loop back packet out
iptables -A OUTPUT -o lo -j ACCEPT

####Allow multicast packets from DMS server go out
iptables -A OUTPUT -o eth0 -p udp --dport 1900 -d 239.255.255.250 -j ACCEPT

####Allow UDP point-to-point response packets go out to DMC
iptables -A OUTPUT -o eth0 -p udp -j ACCEPT

####Allow TCP request response packets go out to DMC
iptables -A OUTPUT -o eth0 -p tcp --sport 49152  -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#######for UDHCPC##################
#Not send the echo reply(0/0) to outside device. This means external device does not ping our stb
iptables -A OUTPUT -o eth0 -p icmp --icmp-type echo-reply -j DROP

## Allow our STB send echo-request(8/0) to outside.
iptables -A OUTPUT -o eth0 -p icmp --icmp-type echo-request -j ACCEPT

#Allow DHCP package go out
iptables -A OUTPUT -o eth0 -p udp -m udp --dport 67 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT


#icmp allowd
iptables -A OUTPUT -p icmp -j ACCEPT

iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW -m tcp -j ACCEPT
######################################Process POSTROUTING chain of nat table########################################
iptables -t nat -A POSTROUTING -s $LXC1_ADDR/32 -p tcp -j MASQUERADE
iptables -t nat -A POSTROUTING -s $LXC2_ADDR/32 -p tcp -j MASQUERADE
EOF
}

#===========function: copy app related libraries================================
function copy_app_libs()
{
    echo "=======copy app libraries========================="
    #audio
    if [[ $LXC_DEV_AUDIO_ENABLE == y* ]]; then
        lib_to_cp+=" libHA.AUDIO.* "
    fi

    lib_to_cp+=" libfreetype.so* "
    lib_to_cp+=" libharfbuzz.so* "

    #hisi drivers
    lib_to_cp+=" libhi_cc.so "
    lib_to_cp+=" libhi_common.so "
    lib_to_cp+=" libhi_msp.so "
    lib_to_cp+=" libhi_so.so "
    lib_to_cp+=" libhi_subtitle.so "
    lib_to_cp+=" libhi_ttx.so "

    #graphic modules
    if [[ $LXC_DEV_JPEG_ENABLE == y* ]]; then
        lib_to_cp+=" libjpeg.so* "
    fi

    if [[ $LXC_DEV_PNG_ENABLE == y* ]]; then
        lib_to_cp+=" libpng16.so* "
    fi

    #secureos
    if [[ $LXC_TEEC_ENABLE == y* ]]; then
        lib_to_cp+=" libteec.so "
    fi

    #graphic
    if [[ $LXC_HIGO_ENABLE == y* ]]; then
        lib_to_cp+=" libhigo.so "
        lib_to_cp+=" libhigoadp.so "
        lib_to_cp+=" higo-adp "
    fi


    #binder
    if [[ $LXC_DEV_BINDER == y* ]]; then
        lib_to_cp+=" libbinder_ipc.so "
    fi

    #hiplayer
    if [[ $LXC_HIPLAYER_ENABLE == y* ]]; then
        lib_to_cp+=" libsubdec.so "
        lib_to_cp+=" libplayer.so "
        lib_to_cp+=" libhiplayer_utils.so "
        lib_to_cp+=" libdrmengine.so "
        lib_to_cp+=" libdrm_common.so "
        lib_to_cp+=" libdrm.so "
#        lib_to_cp+=" libdl.so "
        lib_to_cp+=" libHV.VIDEO.FFMPEG_VDEC.decode.so "
        lib_to_cp+=" libformat* "
        lib_to_cp+=" libffmpegformat.so "
        lib_to_cp+=" libavformat.so* "
        lib_to_cp+=" libavcodec.so* "
        lib_to_cp+=" libbluray.so* "
        lib_to_cp+=" libavutil.so* "
        lib_to_cp+=" libcodec_hi_ext.so "
        lib_to_cp+=" libssl.so* "
        lib_to_cp+=" libxml2.so* "
        lib_to_cp+=" libcrypto.so* "
        lib_to_cp+=" libswscale.so* "
        lib_to_cp+=" libclientadp.so* "
    fi

     for ff in $lib_to_cp ; do
#         echo "=======copy $PREFIX/usr/lib/$ff to  $PREFIX/$lxc_rootfs_dir/usr/lib"
         cp -r -d $PREFIX/usr/lib/$ff  $PREFIX/$lxc_rootfs_dir/usr/lib
     done
}

#===========function: install app ==============================================
function install_app()
{
    echo "=======install application========================"
    make -C $SDK_PATH/sample/lxc
    cp -f $SAMPLE_OUT_PATH/lxc/launch/launch_app      $PREFIX/$lxc_rootfs_dir/home/ && \
    $STRIP $PREFIX/$lxc_rootfs_dir/home/launch_app
#    cp -f $SAMPLE_OUT_PATH/lxc/ipc/msg_rcv_lxc2      $PREFIX/$lxc_rootfs_dir/home/ && \
#    $STRIP $PREFIX/$lxc_rootfs_dir/home/msg_rcv_lxc2
#
#    cp -f $SAMPLE_OUT_PATH/lxc/ipc/shm_read_lxc2      $PREFIX/$lxc_rootfs_dir/home/ && \
#    $STRIP $PREFIX/$lxc_rootfs_dir/home/shm_read_lxc2
#
    cp -f $SAMPLE_OUT_PATH/lxc/refapp/ref_client      $PREFIX/$lxc_rootfs_dir/home/ && \
    $STRIP $PREFIX/$lxc_rootfs_dir/home/ref_client


    cat << EOF > $PREFIX/$lxc_rootfs_dir/home/lxc0_start.sh
#!/bin/sh
echo "default eh0 ipaddress is : 10.6.2.2/24" &
#/home/msg_rcv_lxc2
#/home/shm_read_lxc2
/home/ref_client
EOF
    chmod ug+x $PREFIX/$lxc_rootfs_dir/home/lxc0_start.sh
}

#===========function: create and deploy lxc config file for CA =================
function install_lxc_config()
{
    LXC_CONFIGURE_FILE=$PREFIX/usr/var/lib/lxc/$name/config
    echo "=======install LXC configure=================="
#    echo "configure:$LXC_CONFIGURE_FILE"

    LXC_APP_UID=$(echo $LXC_APP_UID | sed 's/\r//')
    LXC_APP_GID=$(echo $LXC_APP_GID | sed 's/\r//')
    LXC_CAPABILITY=$(echo $LXC_CAPABILITY | sed 's/\r//')

    cat <<EOF > $LXC_CONFIGURE_FILE
lxc.utsname = $name
EOF

    echo "lxc.cap.keep = $LXC_CAPABILITY" >> $LXC_CONFIGURE_FILE

    if [[ $LXC_CONSOLE_ENABLE = n* ]]; then
        echo "lxc.console = none" >> $LXC_CONFIGURE_FILE
    fi

    echo "lxc.tty = 1" >> $LXC_CONFIGURE_FILE
    echo "lxc.pts = 1" >> $LXC_CONFIGURE_FILE
    echo "lxc.rootfs = $lxc_rootfs_dir" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount = $lxc_config_dir/fstab" >> $LXC_CONFIGURE_FILE
    echo "lxc.pivotdir = /tmp/lxc_putold" >> $LXC_CONFIGURE_FILE
    echo "" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /sys/power/state sys/power/state none rw,bind 0 0" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = shm dev/shm tmpfs rw,nosuid,nodev,noexec,mode=0660,create=dir 0 0" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /dev/shm dev/shm none rw,bind 0 0" >> $LXC_CONFIGURE_FILE

    if [[ $LXC_DEV_AUDIO_ENABLE == y* ]]; then
        echo "" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/hi_adec dev/hi_adec none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/hi_adsp dev/hi_adsp none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/hi_aenc dev/hi_aenc none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/hi_ao dev/hi_ao none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_CA_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_ca dev/hi_ca none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_CIPHER_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_cipher dev/hi_cipher none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_DEMUX_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_demux dev/hi_demux none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_VO_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_disp dev/hi_disp none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_GPIO_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_gpio dev/hi_gpio none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_VO_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_hdmi dev/hi_hdmi none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_I2C_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_i2c dev/hi_i2c none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_IR_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_ir dev/hi_ir none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_KEYLED_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_keyled dev/hi_keyled none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_LOG_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_log dev/hi_log none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_MCE_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_mce dev/hi_mce none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_MODULE_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_module dev/hi_module none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_HI_CERT_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_cert dev/hi_cert none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_OTP_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_otp dev/hi_otp none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_PM_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_pm dev/hi_pm none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_PNG_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_png dev/hi_png none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_PQ_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_pq dev/hi_pq none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_PVR_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_pvr dev/hi_pvr none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_SCI_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_sci dev/hi_sci none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    echo "lxc.mount.entry = /dev/hi_stat dev/hi_stat none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /dev/hi_sync dev/hi_sync none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /dev/hi_sys dev/hi_sys none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE

    if [[ $LXC_DEV_TDE_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_tde dev/hi_tde none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_TUNER_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_tuner dev/hi_tuner none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_PROC_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_userproc dev/hi_userproc none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_VDEC_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_vdec dev/hi_vdec none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_VO_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_vo dev/hi_vo none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/hi_vpss dev/hi_vpss none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/fb0 dev/fb0 none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/fb1 dev/fb1 none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/fb2 dev/fb2 none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_TTYAMA0_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/ttyAMA0 dev/ttyAMA0 none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_HI_CA_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/hi_ca dev/hi_ca none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_JPEG_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/jpeg dev/jpeg none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi
    echo "" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /dev/tc_ns_client dev/tc_ns_client none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /dev/mmz_userdev dev/mmz_userdev none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /dev/mem dev/mem none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /dev/null dev/null none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    echo "lxc.mount.entry = /dev/urandom dev/urandom none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE

    if [[ $LXC_DEV_WATCHDOG_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/watchdog dev/watchdog none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_FUSE_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/fuse dev/fuse none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_BINDER == y* ]]; then
        echo "lxc.mount.entry = /dev/binder dev/binder none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_USB_ENABLE == y* ]]; then
        echo "lxc.mount.entry = /dev/sda dev/sda none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/sda1 dev/sda1 none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/sda2 dev/sda2 none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
        echo "lxc.mount.entry = /dev/sda3 dev/sda3 none bind,optional,create=file 0 0" >> $LXC_CONFIGURE_FILE
    fi

    if [[ $LXC_DEV_ETHERNET_ENABLE == y* ]]; then
        echo "#config physical eth0" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.type = phys" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.flags = up" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.link = eth0" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.ipv4 = 10.6.2.2/24" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.name = eth0" >> $LXC_CONFIGURE_FILE

        echo "#config virtual eth1" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.type = veth" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.flags = up" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.link = br1" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.hwaddr = 4a:49:43:49:79:bf" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.ipv4 = 192.168.1.3/24" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.name = eth1" >> $LXC_CONFIGURE_FILE

        echo "#config virtual eth2" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.type = veth" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.flags = up" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.link = br2" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.hwaddr = 4a:4c:4a:fe:79:bc" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.ipv4 = 192.168.2.3/24" >> $LXC_CONFIGURE_FILE
        echo "lxc.network.name = eth2" >> $LXC_CONFIGURE_FILE

        echo "#config devcies access" >> $LXC_CONFIGURE_FILE
        echo "lxc.cgroup.devices.deny = a" >> $LXC_CONFIGURE_FILE
    fi
        echo "lxc.cgroup.devices.allow = c 204:* rwm" >> $LXC_CONFIGURE_FILE
    echo "# /dev/null and zero" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 1:3 rwm" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 1:5 rwm" >> $LXC_CONFIGURE_FILE
    echo "# consoles" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 5:1 rwm" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 5:0 rwm" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 4:0 rwm" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 4:1 rwm" >> $LXC_CONFIGURE_FILE
    echo "# /dev/{,u}random" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 1:9 rwm" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 1:8 rwm" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 136:* rwm" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 5:2 rwm" >> $LXC_CONFIGURE_FILE
    echo "# hi_*" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 218:* rwm" >> $LXC_CONFIGURE_FILE
    echo "# fb8" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 29:* rwm" >> $LXC_CONFIGURE_FILE
    echo "# others" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 10:* rwm" >> $LXC_CONFIGURE_FILE
    echo "" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = b 31:* rwm" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = c 90:* rwm" >> $LXC_CONFIGURE_FILE
    echo "" >> $LXC_CONFIGURE_FILE
    echo "lxc.cgroup.devices.allow = b 8:* rwm" >> $LXC_CONFIGURE_FILE


    chmod 644 $PREFIX/usr/var/lib/lxc/$name/config

    cat <<EOF > $PREFIX/$lxc_config_dir/fstab
proc            /home/$name/proc           proc    defaults        0       0
sysfs           /home/$name/sys            sysfs   defaults        0       0
tmp             /home/$name/tmp            tmpfs   nosuid,noexec,nodev,mode=1770        0       0
dev             /home/$name/dev            tmpfs   nosuid,noexec,nodev,gid=1000,mode=0770        0       0
EOF
    chmod 644 $PREFIX/$lxc_config_dir/fstab

}

#===========function: delete not used libraries===========================
function delete_files()
{
     echo "=======remove unused libraries==================="
#    file_to_del+=" $PREFIX/$lxc_rootfs_dir/usr/lib/higo-adp/ "
#    file_to_del+=" $PREFIX/$lxc_rootfs_dir/usr/lib/libcrypto* "
#    file_to_del+=" $PREFIX/$lxc_rootfs_dir/usr/lib/libfreetype* "
#    file_to_del+=" $PREFIX/$lxc_rootfs_dir/usr/lib/libHA* "
#    file_to_del+=" $PREFIX/$lxc_rootfs_dir/usr/lib/libhigo* "
#    file_to_del+=" $PREFIX/$lxc_rootfs_dir/usr/lib/libz* "

#    for ff in $file_to_del ; do
#        rm  -rf $ff
#    done
}

########################################  main entrance ##########################################
lxc_config_dir=/usr/var/lib/lxc/$name
lxc_config_file=$lxc_config_dir/config
lxc_rootfs_dir=/home/$name

configure_main_app
install_fs_dir
install_busybox
install_app
copy_app_libs
install_firewall
delete_files
install_lxc_config

if [ $LXC_MODE == "DEBUG" ]; then
    install_dbg_fs_scripts
else
    install_rel_fs_scripts
fi

