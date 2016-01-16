# Inherit device configuration for zeus.
$(call inherit-product, device/semc/zeus/device_zeus.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/altair/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_zeus
PRODUCT_BRAND := SEMC
PRODUCT_DEVICE := zeus
PRODUCT_MODEL := R800i
PRODUCT_MANUFACTURER := Sony Ericsson
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Play BUILD_ID=4.0.2.A.0.42 BUILD_FINGERPRINT=SEMC/R800i_1247-6199/R800i:2.3.4/4.0.2.A.0.42/bn_p:user/release-keys PRIVATE_BUILD_DESC="LT15i-user 2.3.4 4.0.2.A.0.42 bn_P test-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=altair_zeus_defconfig

# Extra zeus overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/zeus

# Add the Torch app
PRODUCT_PACKAGES += Torch


# BCM FM radio
#$(call inherit-product, vendor/altair/products/bcm_fm_radio.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := XperiaPlay-R800i
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
