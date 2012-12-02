#
# Copyright (C) 2011 The Android Open-Source Project
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

# inherit from the proprietary version
-include vendor/amazon/otter/BoardConfigVendor.mk

USE_CAMERA_STUB := true
BOARD_USES_GENERIC_AUDIO := false

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap4
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := omap4sdp
TARGET_PROVIDES_INIT_RC := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
NEEDS_ARM_ERRATA_754319_754320 := true
BOARD_NEEDS_CUTILS_LOG := true

BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 mem=463M@0x80000000 init=/init vram=5M omapfb.vram=0:5M
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096

# Graphics
BOARD_EGL_CFG := device/amazon/otter/misc/egl.cfg

# HW Graphics
USE_OPENGL_RENDERER := true

TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/amazon/otter/releasetools/otter_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/amazon/otter/releasetools/otter_ota_from_target_files
TARGET_CUSTOM_RELEASETOOL := ./device/amazon/otter/releasetools/squisher

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_FAKE_GPS := true
BOARD_GPS_LIBRARIES := false
TARGET_NO_RADIOIMAGE := true
#BOARD_USES_UBOOT := true

#BOARD_HAVE_FM_RADIO := true
#BUILD_TI_FM_APPS := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# OMAP
OMAP_ENHANCEMENT := true
ENHANCED_DOMX := true
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
endif

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 90537984
BOARD_FLASH_BLOCK_SIZE := 131072

USE_CAMERA_STUB := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_USES_TI_OMAP_MODEM_AUDIO := false
BOARD_HAS_NO_MISC_PARTITION := true

#Misc stuff
#BUILD_WITH_TI_AUDIO := 1
# XXX: Added for testing of Video
#BUILD_PV_VIDEO_ENCODERS := 1 
#BOARD_HAS_NO_MISC_PARTITION := true

# Add support for FFF 1.4 recovery selection
TARGET_RECOVERY_PRE_COMMAND := "idme postmode 1;"

#TARGET_USE_OMAP_COMPAT := true

# OMX
HARDWARE_OMX := true
ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
  hardware/ti/omx/system/src/openmax_il/omx_core/inc \
  hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
BOARD_CAMERA_LIBRARIES := libcamera
endif

# XXX: CHANGED FROM TRUE
BOARD_USES_TI_CAMERA_HAL := false

TARGET_PREBUILT_KERNEL := device/amazon/otter/kernel
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/amazon/otter/recovery/recovery_ui.c
BOARD_CUSTOM_RECOVERY_POWER_PROFILE := ../../device/amazon/otter/recovery/custom_power.c
RECOVERY_BUILD_IN_LANDSCAPE := true
RECOVERY_DEVICE_DOES_NOT_SUPPORT_SDEXT := true
RECOVERY_DEVICE_HAS_NO_VIBRATE := true
BOARD_TS_MAX_ROWS := 27
DEVICE_RESOLUTION := 1024x600
TARGET_PRODUCT_NAME_IS_NOT_DEVICE := blaze

# Do da wifi
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
HOSTAPD_VERSION             := VER_0_6_X
BOARD_WLAN_DEVICE           := wl1283
BOARD_SOFTAP_DEVICE         := wl1283
#BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_PATH     := "/system/etc/wifi/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/firmware.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/softap/firmware_ap.bin"


#BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
#disable touch boundary cause it locks up on certain devices (landscape primarily)
BOARD_TS_NO_BOUNDARY := true
BOARD_RECOVERY_RELEASE_TYPE := v2.1 REL
