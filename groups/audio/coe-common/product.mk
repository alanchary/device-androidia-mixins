# Tinyalsa
PRODUCT_PACKAGES_DEBUG += \
    tinymix \
    tinyplay \
    tinycap \
    tinypcminfo \
    tinyprobe

# PFW Client Simulator
PRODUCT_PACKAGES_DEBUG += \
    audio_correlation_tool \
    test-platform

# Audio HALs
PRODUCT_PACKAGES += meta.package.audio

{{#wov}}
# Sound Trigger HAL
PRODUCT_PACKAGES += \
       sound_trigger.primary.$(TARGET_BOARD_PLATFORM)
{{/wov}}

{{#aware}}
# Aware HAL
PRODUCT_PACKAGES += \
    libaware_client \
    aware.primary.$(TARGET_BOARD_PLATFORM)
{{/aware}}

{{#treble}}
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.broadcastradio@1.0-impl
{{/treble}}
