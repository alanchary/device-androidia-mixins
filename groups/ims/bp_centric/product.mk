# add IMS package (fast track)  only if AOSP dependency is available
ifneq ($(wildcard frameworks/opt/telephony/src/java/com/android/internal/telephony/OemPhoneCreator*),)
PRODUCT_PACKAGES += \
    com.intel.internal.telephony.imsconverged \
    IMSConfigUI \
    ImsService \
    imsstackservice
endif
