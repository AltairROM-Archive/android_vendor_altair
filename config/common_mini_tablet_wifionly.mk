# Inherit common CM stuff
$(call inherit-product, vendor/altair/config/common_mini.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME
