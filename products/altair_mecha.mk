# Inherit device configuration for mecha.
$(call inherit-product, device/htc/mecha/device_mecha.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_mecha
PRODUCT_BRAND := verizon_wwe
PRODUCT_DEVICE := mecha
PRODUCT_MODEL := ADR6400L
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_mecha BUILD_ID=FRG83D BUILD_FINGERPRINT=verizon_wwe/htc_mecha/mecha/mecha:2.2.1/FRG83D/343953:user/release-keys PRIVATE_BUILD_DESC="1.70.605.0 CL343953 release-keys"

# Extra Mecha overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/mecha

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Broadcom FM radio
$(call inherit-product, vendor/altair/products/bcm_fm_radio.mk)

# SIM Toolkit
PRODUCT_PACKAGES += Stk

# Release name and versioning
PRODUCT_RELEASE_NAME := Thunderbolt
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
