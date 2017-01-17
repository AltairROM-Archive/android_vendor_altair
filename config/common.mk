PRODUCT_BRAND ?= altair

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Helium.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Copy over the changelog to the device
#PRODUCT_COPY_FILES += \
#    vendor/altair/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/altair/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/altair/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/altair/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh \
    vendor/altair/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/altair/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/altair/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/altair/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/altair/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/altair/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Altair-specific init file
PRODUCT_COPY_FILES += \
    vendor/altair/prebuilt/common/etc/init.local.rc:root/init.cm.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/altair/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is Altair!
PRODUCT_COPY_FILES += \
    vendor/altair/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Include Altair audio files
include vendor/altair/config/altair_audio.mk

# Theme engine
include vendor/altair/config/themes_common.mk

# CMSDK
include vendor/altair/config/cmsdk_common.mk

# Debuggable by default
PRODUCT_PROPERTY_OVERRIDES += \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
	persist.sys.usb.config=adb

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# Required Altair packages
PRODUCT_PACKAGES += \
    CMAudioService \
    Development \
    BluetoothExt \
    Profiles \
    ThemeManagerService \
    WeatherManagerService

# Optional Altair packages
PRODUCT_PACKAGES += \
    libemoji \
    Terminal \
    LiveWallpapersPicker

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# Custom Altair packages
PRODUCT_PACKAGES += \
    Trebuchet \
    AudioFX \
    CMFileManager \
    Eleven \
    LockClock \
    CyanogenSetupWizard \
    CMSettingsProvider \
    ExactCalculator \
    LiveLockScreenService \
    WeatherProvider \
    DataUsageProvider \
    WallpaperPicker \
    SoundRecorder \
    Screencast

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in Altair
PRODUCT_PACKAGES += \
    libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz \
    7z \
    lib7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Custom off-mode charger
ifneq ($(WITH_CM_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank

# Conditionally build in su
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

DEVICE_PACKAGE_OVERLAYS += vendor/altair/overlay/common

PRODUCT_VERSION_MAJOR = 6.0
PRODUCT_VERSION_MINOR = 1
PRODUCT_VERSION_MAINTENANCE := 5

ifeq ($(TARGET_VENDOR_SHOW_MAINTENANCE_VERSION),true)
    CM_VERSION_MAINTENANCE := $(PRODUCT_VERSION_MAINTENANCE)
else
    CM_VERSION_MAINTENANCE := 0
endif

ifdef ALTAIR_NIGHTLY
    ALTAIR_BUILDTYPE := NIGHTLY
endif
ifdef ALTAIR_EXPERIMENTAL
    ALTAIR_BUILDTYPE := EXPERIMENTAL
endif
ifdef ALTAIR_RELEASE
    ALTAIR_BUILDTYPE := RELEASE
endif
ifndef ALTAIR_BUILDTYPE
    # if ALTAIR_BUILDTYPE is not defined, set to UNOFFICIAL
    ALTAIR_BUILDTYPE := UNOFFICIAL
endif

ifeq ($(ALTAIR_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        ALTAIR_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

PRODUCT_FULL_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(ALTAIR_BUILDTYPE)-$(shell date +%Y%m%d)
ALTAIR_VERSION := Altair-$(PRODUCT_FULL_VERSION)-$(ALTAIR_BUILD)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.version=$(PRODUCT_FULL_VERSION) \
  ro.cm.releasetype=$(ALTAIR_BUILDTYPE) \
  ro.modversion=$(ALTAIR_VERSION) \
  ro.cmlegal.url=https://lineageos.org/legal

-include vendor/cm-priv/keys/keys.mk

ALTAIR_DISPLAY_VERSION := $(PRODUCT_FULL_VERSION)

ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),)
ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),build/target/product/security/testkey)
  ifneq ($(ALTAIR_BUILDTYPE), UNOFFICIAL)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
      ifneq ($(ALTAIR_EXTRAVERSION),)
        # Remove leading dash from ALTAIR_EXTRAVERSION
        ALTAIR_EXTRAVERSION := $(shell echo $(ALTAIR_EXTRAVERSION) | sed 's/-//')
        TARGET_VENDOR_RELEASE_BUILD_ID := $(ALTAIR_EXTRAVERSION)
      else
        TARGET_VENDOR_RELEASE_BUILD_ID := $(shell date -u +%Y%m%d)
      endif
    else
      TARGET_VENDOR_RELEASE_BUILD_ID := $(TARGET_VENDOR_RELEASE_BUILD_ID)
    endif
    ALTAIR_DISPLAY_VERSION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)
  endif
endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.display.version=$(PRODUCT_FULL_VERSION)

-include $(WORKSPACE)/build_env/image-auto-bits.mk

-include vendor/cyngn/product.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
