#
# Copyright 2014 The Android Open Source Project
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

# Product common configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Ramdisk fstab files
PRODUCT_COPY_FILES += \
    device/sony/dora/rootdir/fstab.qcom:root/fstab.dora \
    device/sony/dora/rootdir/fstab.qcom:root/fstab.qcom \
    device/sony/dora/rootdir/fstab.qcom:root/fstab.tone

# Ramdisk firmware files
PRODUCT_COPY_FILES += \
    device/sony/dora/rootdir/lib/firmware/emmc/90-484247346132-a5.bin:root/lib/firmware/emmc/90-484247346132-a5.bin \
    device/sony/dora/rootdir/lib/firmware/emmc/90-484347346132-a5.bin:root/lib/firmware/emmc/90-484347346132-a5.bin \
    device/sony/dora/rootdir/lib/firmware/emmc/catalog.txt:root/lib/firmware/emmc/catalog.txt

# Time Zone data for recovery
PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:root/system/usr/share/zoneinfo/tzdata

# Display properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# USB properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.usb.pid_suffix=1D9
