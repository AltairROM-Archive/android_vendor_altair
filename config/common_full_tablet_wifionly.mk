# Inherit common Altair stuff
$(call inherit-product, vendor/altair/config/common_full.mk)

# Required Altair packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Altair LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/dictionaries
