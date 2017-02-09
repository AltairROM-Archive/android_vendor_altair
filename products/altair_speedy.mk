# Inherit AOSP device configuration for speedy.
$(call inherit-product, device/htc/speedy/speedy.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

# Inherit WiMAX stuff
$(call inherit-product, vendor/altair/products/wimax.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_speedy
PRODUCT_BRAND := sprint
PRODUCT_DEVICE := speedy
PRODUCT_MODEL := PG06100
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRJ22 PRODUCT_NAME=htc_speedy BUILD_FINGERPRINT=sprint/htc_speedy/speedy:2.3.4/GRJ22/259408.3:user/release-keys PRIVATE_BUILD_DESC="2.77.651.3 CL259408 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=altair_speedy_defconfig

# Extra Supersonic overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/speedy

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Broadcom FM radio
$(call inherit-product, vendor/altair/products/bcm_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := Speedy
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip