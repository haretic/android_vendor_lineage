# Inherit common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_mobile.mk)

PRODUCT_SIZE := full

# Include GoogleSansFlex font, unless the product has type of its own: its fonts, its family
# names (TARGET_FONTS_CUSTOMIZATION_MODULE) and its overlay of the font configs
ifneq ($(TARGET_EXCLUDES_GOOGLE_SANS_FLEX),true)
$(call inherit-product-if-exists, external/google-fonts/google-sans-flex/fonts.mk)
endif

# Apps
PRODUCT_PACKAGES += \
    Camelot \
    Etar \
    Profiles \
    Recorder \
    Seedvault \
    Twelve

ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd

# Fonts
PRODUCT_PACKAGES += \
    fonts_customization.xml
ifneq ($(TARGET_EXCLUDES_GOOGLE_SANS_FLEX),true)
PRODUCT_PACKAGES += \
    FontGoogleSansFlexOverlay
endif

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/lineage/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/lineage/overlay/dictionaries
