# There is a strong dependency on debug-logs; disable debug-npk if not set
ifeq ($(MIXIN_DEBUG_LOGS),true)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.npk.rc:root/init.npk.rc
PRODUCT_PACKAGES += \
    init.npk.sh \
    logcatext

endif #MIXIN_DEBUG_LOGS
