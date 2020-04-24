# Inherit common Lineage stuff
$(call inherit-product, vendor/altair/config/common.mk)

# Inherit Lineage atv device tree
$(call inherit-product, device/lineage/atv/lineage_atv.mk)

# Google source built packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Custom Lineage packages
PRODUCT_PACKAGES += \
    AppDrawer \
    LineageCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/altair/overlay/tv
