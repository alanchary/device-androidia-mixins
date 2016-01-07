BOARD_KERNEL_CMDLINE += thermal.off=1

BOARD_SEPOLICY_M4DEFS += module_thermal=true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/thermal

# Most of the mixin config is symlinked back to thermal/daemon
# init scripts and such. Thus ituxd shared the policy of
# thermal/daemon, but extends it with its own init.rc.1 files.
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/thermal/daemon

# ituxd includes the itux package
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/thermal/itux
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/thermal/ituxd
