# Inherit device configuration for mimmi.
$(call inherit-product, device/semc/mimmi/device_mimmi.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full_no_themes.mk)

# Include GSM stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_mimmi
PRODUCT_BRAND := SEMC
PRODUCT_DEVICE := mimmi
PRODUCT_MODEL := U20i
PRODUCT_MANUFACTURER := Sony Ericsson
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_DEVICE=U20i PRODUCT_NAME=U20i BUILD_ID=3.0.1.A.0.145 BUILD_FINGERPRINT=SEMC/LT15i_1247-1073/LT15i:2.3.3/3.0.1.A.0.145/bn_p:user/release-keys PRIVATE_BUILD_DESC="LT15i-user 2.3.3 3.0.1.A.0.145 bn_P test-keys"

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Add LDPI assets, in addition to MDPI
PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/ldpi

# Ti FM radio
#$(call inherit-product, vendor/altair/products/ti_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := X10MiniPro
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy MDPI specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/ldpi/media/bootanimation.zip:system/media/bootanimation.zip