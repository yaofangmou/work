#+++++++++++++++++++++++++++++++++++++
menu "SCI Config"
#+++++++++++++++++++++++++++++++++++++

config HI_SCI_SUPPORT
    bool "SCI Support"
    depends on !(HI3798MV100 || HI3798MV300H || HI3798MV310)
    default y

config HI_SCI_SUPPORT_PPS
    bool "SCI PPS Negotiation Support"
    depends on HI_SCI_SUPPORT
    default n
    help
        when enable, SCI support PPS negotiation
        when disable, SCI not support PPS negotiation.

config HI_SCI_VCC_AUTO_MATCH_SUPPORT
    bool "Vcc Auto-Match Support"
    depends on (HI_SCI_SUPPORT && HI3716MV430)
    default y
    help
        when enable, SCI support Vcc Auto-Match
        when disable, SCI support external 8024 and no 8024

choice
    prompt "Vcc Auto-Match Support"
    depends on (HI_SCI_SUPPORT && HI_SCI_VCC_AUTO_MATCH_SUPPORT)
    default HI_SCI_VCC_SELECT_3V

config  HI_SCI_VCC_SELECT_3V
    bool "SCI Vcc Select 3V"

config  HI_SCI_VCC_SELECT_5V
    bool "SCI Vcc Select 5V"

config HI_SCI_VCC_SELECT_AUTO
    bool "SCI Vcc Select Auto"

endchoice

#+++++++++++++++++++++++++++++++++++++
endmenu
#+++++++++++++++++++++++++++++++++++++
