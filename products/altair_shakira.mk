# Inherit device configuration for ace.
$(call inherit-product, device/semc/shakira/device_shakira.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_shakira
PRODUCT_BRAND := SEMC
PRODUCT_DEVICE := shakira
PRODUCT_MODEL := E15i
PRODUCT_MANUFACTURER := Sony Ericsson
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_DEVICE=E15i PRODUCT_NAME=E15i BUILD_ID=3.0.1.A.0.145 BUILD_FINGERPRINT=SEMC/LT15i_1247-1073/LT15i:2.3.3/3.0.1.A.0.145/bn_p:user/release-keys PRIVATE_BUILD_DESC="LT15i-user 2.3.3 3.0.1.A.0.145 bn_P test-keys"

# Extra shakira overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/shakira

# Ti FM radio (not implemeted in libaudio)
#$(call inherit-product, vendor/altair/products/ti_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := X8
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy MDPI specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
