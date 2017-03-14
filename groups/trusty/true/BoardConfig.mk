TARGET_USE_TRUSTY := true
{{^tos_partition}}
TARGET_USE_MULTIBOOT := true
{{/tos_partition}}
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/trusty
BOARD_SEPOLICY_M4DEFS += module_trusty=true

LKBUILD_TOOLCHAIN_ROOT = $(PWD)/vendor/intel/external/prebuilts/elf/
LKBUILD_X86_TOOLCHAIN = $(LKBUILD_TOOLCHAIN_ROOT)i386-elf-4.9.1-Linux-x86_64/bin
LKBUILD_X64_TOOLCHAIN = $(LKBUILD_TOOLCHAIN_ROOT)x86_64-elf-4.9.1-Linux-x86_64/bin
TRUSTY_BUILDROOT = $(PWD)/$(PRODUCT_OUT)/obj/trusty/

TRUSTY_ENV_VAR += LK_CORE_NUM={{lk_core_num}}
TRUSTY_ENV_VAR += TARGET_PRODUCT=$(TARGET_PRODUCT)

#for trusty lk
TRUSTY_ENV_VAR += BUILDROOT=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += PATH=$(PATH):$(LKBUILD_X86_TOOLCHAIN):$(LKBUILD_X64_TOOLCHAIN)

#for trusty vmm
# use same toolchain as android kernel
TRUSTY_ENV_VAR += COMPILE_TOOLCHAIN=$(YOCTO_CROSSCOMPILE)

# output build dir to android out folder
TRUSTY_ENV_VAR += BUILD_DIR=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += LKBIN_DIR=$(TRUSTY_BUILDROOT)/build-{{{lk_project}}}/

#Workaround CPU lost issue on SIMICS, will remove this line below after PO.
BOARD_KERNEL_CMDLINE += cpu_init_udelay=500000
