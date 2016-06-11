# Inherit common Altair stuff
$(call inherit-product, vendor/altair/config/common.mk)

PRODUCT_SIZE := mini

# Include Altair audio files
include vendor/altair/config/altair_audio.mk

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Helium.ogg

