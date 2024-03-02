#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from device makefile.
$(call inherit-product, device/lenovo/tb8185p3_64/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_tb8185p3_64
PRODUCT_DEVICE := tb8185p3_64
PRODUCT_MANUFACTURER := LENOVO
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Lenovo TB-J616F

PRODUCT_GMS_CLIENTID_BASE := android-lenovo
