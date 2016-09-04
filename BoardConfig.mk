#
# Copyright 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Board device path
DEVICE_PATH := device/sony/dora

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := F8131

# Platform
TARGET_BOARD_PLATFORM := msm8996
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530
TARGET_POWERHAL_VARIANT := qcom
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := false

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

# Second architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel properties
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_MODULES := true

# Kernel files
#TARGET_KERNEL_CONFIG :=
#TARGET_KERNEL_SOURCE :=
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel

# Kernel configurations
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Kernel cmdline
BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += user_debug=31 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y
BOARD_KERNEL_CMDLINE += coherent_pool=8M
BOARD_KERNEL_CMDLINE += androidboot.hardware=dora
BOARD_KERNEL_CMDLINE += enforcing=0

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5513412608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57436708864
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS := true

# 64 bits elements
TARGET_USES_64_BIT_BINDER := true

# TWRP configurations
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_SKIP_SETEXECCON_VOLD_CHECK := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone4/temp
TW_DEFAULT_BRIGHTNESS := 1023
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_IGNORE_ABS_MT_TRACKING_ID := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NEW_ION_HEAP := true
TW_THEME := portrait_hdpi

# Recovery blobs
TARGET_RECOVERY_DEVICE_MODULES := libbinder libgui libui libEGL libGLES_trace libGLESv2 libprotobuf-cpp-lite libsync
TW_RECOVERY_ADDITIONAL_RELINK_FILES := $(OUT)/system/lib64/libbinder.so $(OUT)/system/lib64/libgui.so $(OUT)/system/lib64/libui.so $(OUT)/system/lib64/libEGL.so $(OUT)/system/lib64/libGLES_trace.so $(OUT)/system/lib64/libGLESv2.so $(OUT)/system/lib64/libprotobuf-cpp-lite.so $(OUT)/system/lib64/libsync.so
