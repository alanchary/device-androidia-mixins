#WebRTC library and reference app
PRODUCT_PACKAGES += videoP2P \
    libwebrtc-video-p2p-jni \
    libwebrtc_full \
    libjingle_full
PRODUCT_PACKAGES_DEBUG += WebRTCDemo
# cve video
PRODUCT_PACKAGES += \
    libvideocme-server \
    com.intel.ir94.videocme \
    com.intel.ir94.videocme.xml \
    libvideocme-jni \
    com.intel.rcs.vsh.vcme
