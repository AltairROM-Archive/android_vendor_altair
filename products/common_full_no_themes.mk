# Inherit common Altair stuff
$(call inherit-product, vendor/altair/products/common.mk)

# Altair specific product packages
#PRODUCT_PACKAGES += \
#    CMWallpapers

# Bring in all audio files
include frameworks/base/data/sounds/AllAudio.mk

# Include extra dictionaries for LatinIME
PRODUCT_PACKAGE_OVERLAYS += vendor/altair/overlay/dictionaries

# Default Ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Playa.ogg \
    ro.config.notification_sound=regulus.ogg \
    ro.config.alarm_alert=Alarm_Beep_03.ogg
