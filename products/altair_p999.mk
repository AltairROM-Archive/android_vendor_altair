# Inherit device configuration for p999.
$(call inherit-product, device/lge/p999/p999.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_p999
PRODUCT_BRAND := lge
PRODUCT_DEVICE := p999
PRODUCT_MODEL := LG-P999
PRODUCT_MANUFACTURER := lge
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lge_lge_star BUILD_ID=GRI40 BUILD_FINGERPRINT=lge/lge_lge_star/p999:2.3.3/GRI40/lgp999-V21e.41fdc8a2:user/release-keys PRIVATE_BUILD_DESC="lge_star-user 2.3.3 GRI40 41fdc8a2 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=altair_vision_defconfig

# Extra Star overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/star

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Build GanOptimizer
PRODUCT_PACKAGES += GanOptimizer

# Broadcom FM radio
#$(call inherit-product, vendor/altair/products/bcm_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := G2x
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy hdpi specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
