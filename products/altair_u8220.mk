# Inherit AOSP device configuration for dream_sapphire.
$(call inherit-product, device/huawei/u8220/device_u8220.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common.mk)

# Include GSM-only stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_u8220
PRODUCT_BRAND := huawei
PRODUCT_DEVICE := u8220
PRODUCT_MODEL := U8220/U8230
PRODUCT_MANUFACTURER := Huawei
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=u8220 BUILD_ID=GRJ22 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := U8220
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy DS specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip