# Inherit common Altair stuff
$(call inherit-product, vendor/altair/config/common_mini.mk)

# Required Altair packages
PRODUCT_PACKAGES += \
    LatinIME
