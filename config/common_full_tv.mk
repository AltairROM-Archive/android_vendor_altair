# Inherit common CM stuff
$(call inherit-product, vendor/altair/config/common_full.mk)

PRODUCT_PACKAGES += AppDrawer

DEVICE_PACKAGE_OVERLAYS += vendor/cm/overlay/tv
