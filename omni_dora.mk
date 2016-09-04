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

# Inherit device configurations
$(call inherit-product, device/sony/dora/device.mk)

# Device identification
PRODUCT_DEVICE := dora
PRODUCT_NAME := omni_dora
PRODUCT_RELEASE_NAME := dora
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := F8131

# Prebuilt kernel
LOCAL_KERNEL := device/sony/dora/prebuilts/kernel
