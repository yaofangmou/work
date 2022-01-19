#+++++++++++++++++++++++++++++++++++++
menu "PowerManagement Config"
#+++++++++++++++++++++++++++++++++++++

config HI_DVFS_CPU_SUPPORT
    bool "CPU DVFS Support"
    default y
    depends on !HI3716MV430
    help
        If this option is 'y', the Dynamic Voltage & Frequency Scaling of CPU will be supported.

config HI_AVS_SUPPORT
    bool "AVS Support"
    depends on HI_DVFS_CPU_SUPPORT
    default y
    help
        If this option is 'y', the Adaptive Voltage Scaling of CPU will be supported.

menuconfig HI_PM_IN_BOOT_SUPPORT
    bool "PM in boot Support"
    default n

menuconfig HI_LPMCU_LOAD_IN_BOOT
    bool "load LPMCU in boot"
    depends on HI_PM_IN_BOOT_SUPPORT


# for power up standby
config HI_PM_SUSPEND_WHEN_POWERUP
    bool "Suspend When Powerup"
    depends on HI_LPMCU_LOAD_IN_BOOT
    help
        If this option is 'y', the power-up standby will be supported. The power-up standby refers to a special standby mode
        which enter standby when the board powers up(cold boot), then users can use IR or button to wake up the system to normal.

# for memory standby
config HI_PM_SUSPEND_FROM_MEMORY
    bool "Suspend From Memory"
    depends on HI_PM_IN_BOOT_SUPPORT
    help
        If this option is 'y', the memory standby will be supported. Whether or not the board enters into standby mode when powers
        up(cold boot) depends on the flag stored in flash. If entering into standby mode, users can use IR or button to wake up the
        system to normal.

config HI_PM_SMARTSTANDBY_SUPPORT
    bool "Smart Standby Support"
    default y
    help
        If this option is 'y', smart standby will be supported.

menu "Temperature Control"
    depends on HI_DVFS_CPU_SUPPORT

config HI_TEMP_CTRL_DOWN_THRESHOLD
    hex "Downclock: The CPU will be downclocked to reduce its power"
    default 0x73
    help
        When the temperature of the tsensor exceeds this threshold, the frequency of the CPU will decrease to the lowest one in frequency table.

config HI_TEMP_CTRL_UP_THRESHOLD
    hex "Quit Control: Below the temperature, Control loop stops operation"
    default 0x64
    help
        When the temperature of the tsensor is under this threshold, the temperature control will stop.

config HI_TEMP_CTRL_REBOOT_THRESHOLD
    hex "Shutdown: Shut the system down to protect your CPU"
    default 0x7d
    help
        When the temperature of the tsensor exceeds this threshold, the system will enter standby.
endmenu

config HI_PM_START_MCU_RUNNING
    bool "Start Mcu When Power Up"
    default n
    help
        If this option is 'y', the MCU using for standby will be started during module initialization instead of in standby process.

#+++++++++++++++++++++++++++++++++++++
endmenu
#+++++++++++++++++++++++++++++++++++++
