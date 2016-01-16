# Include GSM stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

# Inherit device configuration for p500.
$(call inherit-product, device/lge/p500/p500.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

# Include FM-Radio stuff
$(call inherit-product, vendor/altair/products/bcm_fm_radio.mk)

PRODUCT_NAME := altair_p500
PRODUCT_BRAND := lge
PRODUCT_DEVICE := p500
PRODUCT_MODEL := LG-P500
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_ID=GRI40 \
    PRIVATE_BUILD_DESC="thunderg-user 2.3.3 GRI40 LG-P500-V20h.19D34B612E release-keys" \
    BUILD_FINGERPRINT=lge/thunderg/thunderg:2.3.3/GRI40/LG-P500-V20h.19D34B612E:user/release-keys

# Release name and versioning
PRODUCT_RELEASE_NAME := OptimusOne
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
