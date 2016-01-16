# Inherit device configuration for olympus.
$(call inherit-product, device/motorola/olympus/olympus.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_olympus
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := olympus
PRODUCT_MODEL := MB860
PRODUCT_MANUFACTURER := motorola
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_BRAND=MOTO PRODUCT_NAME=olyatt BUILD_ID=4.5.141 BUILD_PRODUCT=olyatt BUILD_FINGERPRINT=MOTO/olyatt/olympus:2.3.6/4.5.141/111212:user/release-keys PRIVATE_BUILD_DESC="olympus-user 2.3.6 4.5.141 111212 release-keys"

# Extra Olympus overlay
PRODUCT_PACKAGE_OVERLAYS += \
	vendor/altair/overlay/olympus \
#	vendor/altair/overlay/qhd

PRODUCT_RELEASE_NAME := Olympus
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy hdpi specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
