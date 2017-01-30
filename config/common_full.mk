# Inherit common Altair stuff
$(call inherit-product, vendor/altair/config/common.mk)

PRODUCT_SIZE := full

# Optional Altair packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    PhotoTable \
    PhotoPhase

# Themes
#PRODUCT_PACKAGES += \
#    HexoLibre
