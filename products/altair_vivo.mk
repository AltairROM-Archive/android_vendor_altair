# Inherit device configuration for vivo.
$(call inherit-product, device/htc/vivo/vivo.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_vivo
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := vivo
PRODUCT_MODEL := Incredible S
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vivo BUILD_ID=GRI40 BUILD_FINGERPRINT=htc_wwe/htc_vivo/vivo:2.3.3/GRI40/88716:user/release-keys PRIVATE_BUILD_DESC="2.30.405.1 CL88716 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=altair_vivo_defconfig

# Extra vivo overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/vivo

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Broadcom FM radio
$(call inherit-product, vendor/altair/products/bcm_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := IncS
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
