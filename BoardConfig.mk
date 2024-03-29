#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lenovo/tb8185p3_64

# A/B
AB_OTA_UPDATER := true
BOARD_USES_RECOVERY_AS_BOOT := true
# BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

AB_OTA_PARTITIONS += \
    system \
    product \
    vendor \
    boot \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    dtbo

BUILD_BROKEN_DUP_RULES := true # ???
BUILD_BROKEN_PREBUILT_ELF_FILES := true # ???
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true # ???

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
BOARD_VENDOR := lenovo
TARGET_BOOTLOADER_BOARD_NAME := tb8185p3_64
TARGET_NO_BOOTLOADER := true

# Boot Image
BOARD_KERNEL_BASE := 0x40000000 # unpack boot.img gives us kernel load addr = base + offset
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00080000
BOARD_RAMDISK_OFFSET := 0x07C80000 
# BOARD_SECOND_OFFSET := 0x0 # seems to be removed? 
BOARD_KERNEL_TAGS_OFFSET := 0x0BC80000 
BOARD_DTB_OFFSET := 0x0BC80000
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 2



# TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
# TARGET_FORCE_PREBUILT_KERNEL := true
# TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
# BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb

BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
# BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
#BOARD_KERNEL_CMDLINE += netconsole=4444@192.168.5.1/usb0,9353@192.168.5.2/
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
#BOARD_KERNEL_CMDLINE += console=ttyGS0,115200
# BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery

# BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)



# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U

# Filesystems
TARGET_USERIMAGES_USE_EXT4 := true # rosemary also has f2fs

# Init tmp remove this in case its causing the issue!
# TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_xiaomi_rosemary
# TARGET_RECOVERY_DEVICE_MODULES := libinit_xiaomi_rosemary

# Kernel
ARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/lenovo/mt6785
TARGET_KERNEL_CONFIG := tb8185p3_64_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r383902
BOARD_KERNEL_SEPARATED_DTBO := true
# BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_IMAGE_NAME := Image.gz

# Platform
TARGET_BOARD_PLATFORM := mt6785
BOARD_HAS_MTK_HARDWARE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096               
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432         # 65536     * 512 (sdc31)
BOARD_DTBOIMG_PARTITION_SIZE := 8388608            # 16384     * 512 (sdc33)

# Partitions - Dynamic
BOARD_SUPER_PARTITION_SIZE := 6441402368 #9122611200           # 12582912   * 512 (sdc60)
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 6441402368 #9122611200 # ??? unknown
BOARD_SUPER_PARTITION_ERROR_LIMIT := 6441402368 # 6442450944 # ??

BOARD_MAIN_PARTITION_LIST := \
    system \
    product \
    vendor

# BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 2147483648
# BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 2147483648

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

BOARD_USES_METADATA_PARTITION := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt8185
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
# EXTRA SHIT I'll add
# TARGET_NO_RECOVERY := false



# Power
TARGET_POWERHAL_AIDL_VERSION := 2
# TARGET_TAP_TO_WAKE_NODE := "/proc/gesture_control" # this will be different if you have himax driver

# Sepolicy
include device/mediatek/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Verified Boot - flag 3 will disable it
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3 # --set_hashtree_disabled_flag


# BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
# BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
# BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
# BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1


BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := product system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 3

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/framework_compatibility_matrix.xml

# VNDK
BOARD_VNDK_VERSION := current

# Wi-Fi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := "STA"
WIFI_DRIVER_FW_PATH_AP := "AP"
WIFI_DRIVER_FW_PATH_P2P := "P2P"
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON := "1"
WIFI_DRIVER_STATE_OFF := "0"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true


# Inherit the proprietary files
include vendor/lenovo/tb8185p3_64/BoardConfigVendor.mk
