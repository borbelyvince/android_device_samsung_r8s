#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := exynos990
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)

# Kernel
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_KERNEL_CMDLINE := \
    androidboot.hardware=exynos990 \
    loop.max_part=7

BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := \
    --dtb $(DEVICE_PATH)/prebuilt/dtb.img \
    --ramdisk_offset 0x01000000 \
    --dtb_offset 0 \
    --os_version 14.0.0 \
    --tags_offset 0x00000100 \
    --header_version 2

BOARD_ROOT_EXTRA_FOLDERS := \
    carrier \
    data_mirror \
    efs \
    keydata \
    keyrefuge \
    omr \
    optics \
    prism \
    spu

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 56623104
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic partitions
BOARD_SUPER_PARTITION_SIZE := 9437184000
BOARD_SUPER_PARTITION_GROUPS := group_basic
BOARD_GROUP_BASIC_SIZE := 9432989696
BOARD_GROUP_BASIC_PARTITION_LIST := system odm product vendor

BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_GROUP_BASIC_PARTITION_LIST))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

# Encryption
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
RECOVERY_SDCARD_ON_DATA := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# TWRP specific build flags
TW_DEVICE_VERSION := ExtremeXT_v2
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 486
TW_DEFAULT_BRIGHTNESS := 243
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone7/temp"
TW_Y_OFFSET := 100
TW_H_OFFSET := -100
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_BACKUP_EXCLUSIONS := /data/fonts/files
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_APEX := true
TW_NO_EXFAT_FUSE := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_ENABLE_FS_COMPRESSION := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
