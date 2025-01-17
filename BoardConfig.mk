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

include device/sony/murray/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := unknown
ifneq (,$(filter %xqcc54,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := XQ-CC54
else
TARGET_BOOTLOADER_BOARD_NAME := XQ-CC54
$(warning Unrecognized value for TARGET_PRODUCT: "$(TARGET_PRODUCT)", using default value: "$(TARGET_BOOTLOADER_BOARD_NAME)")
endif

# Platform
PRODUCT_PLATFORM := murray

# Kernel cmdline
BOARD_KERNEL_CMDLINE += androidboot.hardware=pdx225
BOARD_KERNEL_CMDLINE += androidboot.fstab_suffix=pdx225

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x01800000
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x6000000

BOARD_ODMIMAGE_PARTITION_SIZE := 838860800

BOARD_SUPER_PARTITION_SIZE := 12348030976
BOARD_SUPER_PARTITION_GROUPS := sod_dynamic_partitions

# Set error limit to SUPER_PARTITION_SIZE - 500MiB (524288000)
BOARD_SUPER_PARTITION_ERROR_LIMIT := 11823742976

# DYNAMIC_PARTITIONS_SIZE = (SUPER_PARTITION_SIZE / 2) - 4MiB (4194304)
BOARD_SOD_DYNAMIC_PARTITIONS_SIZE := 6169821184
BOARD_SOD_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    vendor \
    product

# Slightly overprovision dynamic partitions with 50MiB to
# allow on-device file editing
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 52428800

# Reserve space for data encryption (0x0x1A0B9FB000-0x4000)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 111864147968
