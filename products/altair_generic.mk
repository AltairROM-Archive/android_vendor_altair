# Inherit AOSP device configuration for generic target
$(call inherit-product, build/target/product/full.mk)

# Inherit some common Altair stuff.
$(call inherit-product, vendor/altair/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := altair_generic
PRODUCT_BRAND := altair
PRODUCT_DEVICE := generic
PRODUCT_MODEL := Altair
PRODUCT_MANUFACTURER := Altair

#
# Move dalvik cache to data partition where there is more room to solve startup problems
#
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dexopt-data-only=1

# Generic modversion
ro.modversion=Altair
