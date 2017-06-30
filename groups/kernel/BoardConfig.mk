# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := device/intel/common/{{{src_path}}}/kernel-headers

ifneq ($(TARGET_BUILD_VARIANT),user)
KERNEL_LOGLEVEL ?= {{{loglevel}}}
else
KERNEL_LOGLEVEL ?= {{{user_loglevel}}}
endif

BOARD_KERNEL_CMDLINE += \
        loglevel=$(KERNEL_LOGLEVEL) \
        androidboot.hardware=$(TARGET_DEVICE)\
        firmware_class.path={{{firmware_path}}}
{{#boot_boost}}

BOARD_KERNEL_CMDLINE += \
        bootboost=1
{{/boot_boost}}

{{#pmsuspend_debug}}
BOARD_KERNEL_CMDLINE += \
        pm_suspend_debug=1
{{/pmsuspend_debug}}
{{#memory_hole}}
BOARD_KERNEL_CMDLINE += \
        memmap=4M\$$0x5c400000
{{/memory_hole}}
{{#interactive_governor}}
BOARD_KERNEL_CMDLINE += \
	intel_pstate=disable
{{/interactive_governor}}
{{#relative_sleepstates}}

BOARD_KERNEL_CMDLINE += \
        relative_sleep_states=1
{{/relative_sleepstates}}

BOARD_SEPOLICY_M4DEFS += module_kernel=true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/kernel
