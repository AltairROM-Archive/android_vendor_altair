$(call inherit-product, device/malata/smb_a1004/smb_a1004.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_smb_a1004
PRODUCT_BRAND := malata
PRODUCT_DEVICE := smb_a1004
PRODUCT_MODEL := SMB-A1004
PRODUCT_MANUFACTURER := malata
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=smb_a1004 BUILD_ID=GRJ22 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

# Extra overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/altair/overlay/tablet \
    vendor/altair/overlay/smb_a1002

# Release name and versioning
PRODUCT_RELEASE_NAME := SMB-A1004
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/altair/products/common_versions.mk

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/altair/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
