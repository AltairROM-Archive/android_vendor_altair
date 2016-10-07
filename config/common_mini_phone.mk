$(call inherit-product, vendor/altair/config/common_mini.mk)

# Required Altair packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/altair/config/telephony.mk)
