# Inherit AOSP device configuration for mesmerizemtd.
$(call inherit-product, device/samsung/mesmerizemtd/full_mesmerizemtd.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_mesmerizemtd
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := mesmerizemtd
PRODUCT_MODEL := SCH-I500
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SCH-I500 TARGET_DEVICE=SCH-I500 BUILD_ID=GINGERBREAD BUILD_FINGERPRINT=uscc/SCH-I500/SCH-I500:2.3.4/GINGERBREAD/EH09:user/release-keys PRIVATE_BUILD_DESC="SCH-I500-user 2.3.4 GINGERBREAD EH09 release-keys"

# Extra mesmerizemtd overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/mesmerizemtd

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Release name and versioning
PRODUCT_RELEASE_NAME := Mesmerize
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy galaxys specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
