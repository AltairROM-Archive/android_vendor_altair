# Inherit common Altair stuff
$(call inherit-product, vendor/altair/products/common_full_no_themes.mk)

# Theme packages
include vendor/altair/products/themes.mk
