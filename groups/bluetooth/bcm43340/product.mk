PRODUCT_PACKAGES += \
    hciattach \
    audio.a2dp.default \
    BCM43341B0_002.001.014.0122.0150.hcd

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:vendor/etc/permissions/android.hardware.bluetooth.xml \
		frameworks/native/data/etc/android.hardware.bluetooth_le.xml:vendor/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PROPERTY_OVERRIDES += bluetooth.hwcfg=stop \
                bluetooth.rfkill=1

# Bluetooth eng / userdebug
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
	hciconfig \
	btmon \
	hcitool
endif
