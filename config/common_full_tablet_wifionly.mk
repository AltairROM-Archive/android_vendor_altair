# Inherit common Altair stuff
$(call inherit-product, vendor/altair/config/common_full.mk)

# Required Altair packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Altair LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/dictionaries

ifeq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
    PRODUCT_COPY_FILES += \
        vendor/altair/prebuilt/common/bootanimation/800.zip:system/media/bootanimation.zip
endif
