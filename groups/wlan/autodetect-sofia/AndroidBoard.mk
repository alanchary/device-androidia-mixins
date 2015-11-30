
ifeq ($(HAL_BIND_MOUNT), true)

# Create symbolic links of various configuration files in /system/etc/
# pointing to bind-mounted or fused files through hald.
#
# AUTODETECT_LINK_PAIRS contains a list of link:target pairs:
#       path/to/symlink1:../../relative/path/to/link_target1 \
#       path/to/symlink2:../relative/path/to/link_target2 \
#       ...
#
# AUTODETECT_LINKS contains the symbolic link files extracted from
# AUTODETECT_LINK_PAIRS
#
# Then a rule for all symbolic links creates them. This rule also creates a
# fake target file (using touch) so the link, that points to its target using
# a relative path, is valid in both the device tree and the build tree (so the
# link is not created again by subsequent make invocations). These fake files
# get overridden by bind-mount or fuse.

AUTODETECT_LINKS := \
	$(foreach item, $(AUTODETECT_LINK_PAIRS), $(call word-colon, 1, $(item)))

$(AUTODETECT_LINKS):
	$(hide) echo "Creating symbolic link on $(notdir $@)"
	$(eval PRV_TARGET := $(call word-colon, 2, $(filter $@:%, $(AUTODETECT_LINK_PAIRS))))
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(dir $@)$(PRV_TARGET))
	$(hide) touch $(dir $@)$(PRV_TARGET)
	$(hide) ln -sf $(PRV_TARGET) $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUTODETECT_LINKS)

endif

copy_modules: iwlwifi
