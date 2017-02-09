# Inherit AOSP device configuration for buzz
$(call inherit-product, device/htc/buzz/buzz.mk)

# Inherit some common Altair stuff
$(call inherit-product, vendor/altair/products/common_full_no_themes.mk)

# Include GSM stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

#
# Setup device specific product configuration
#
PRODUCT_NAME := altair_buzz
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := buzz
PRODUCT_MODEL := HTC Wildfire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_buzz BUILD_ID=GRI40 BUILD_FINGERPRINT=google/passion/passion:2.3.3/GRI40/102588:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.3 GRI40 102588 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/altair/prelink-linux-arm-msm722x.map

# Add LDPI assets, in addition to MDPI
PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/ldpi

# Broadcom FM radio
$(call inherit-product, vendor/altair/products/bcm_fm_radio.mk)

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Copy bootanimation
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/ldpi/media/bootanimation.zip:system/media/bootanimation.zip

# Release name and versioning
PRODUCT_RELEASE_NAME := buzz
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk