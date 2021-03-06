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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/amazon/otter/otter-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/amazon/otter/overlay

# Copy over the custom reboot scripts and their binary counterparts for
# recovery (courtesy of DoomLoRD), the new fff and postmode changes to
# the board config should make these unncessary but I want to keep them
# for now for compat with FFFe (for dualboot).
PRODUCT_COPY_FILES += \
    device/amazon/otter/recovery/root/sbin/fbmode:recovery/root/sbin/fbmode \
    device/amazon/otter/recovery/root/sbin/nbmode:recovery/root/sbin/nbmode \
    device/amazon/otter/recovery/root/sbin/rcmode:recovery/root/sbin/rcmode \
    device/amazon/otter/recovery/root/sbin/reboot_fastboot:recovery/root/sbin/reboot_fastboot \
    device/amazon/otter/recovery/root/sbin/reboot_recovery:recovery/root/sbin/reboot_recovery \
    device/amazon/otter/recovery/root/sbin/reboot_system:recovery/root/sbin/reboot_system

PRODUCT_COPY_FILES += \
    device/amazon/otter/root/init.rc:root/init.rc \
    device/amazon/otter/root/init.omap4430.rc:root/init.omap4430.rc \
    device/amazon/otter/root/ueventd.omap4430.rc:root/ueventd.omap4430.rc \
    device/amazon/otter/root/ueventd.rc:root/ueventd.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/misc/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/misc/media_profiles.xml:system/etc/media_profiles.xml

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

FRAMEWORKS_BASE_SUBDIRS += \
            $(addsuffix /java, \
            omapmmlib \
         )

PRODUCT_PACKAGES += \
    librs_jni \
    tiwlan.ini \
    dspexec \
    libbridge \
    wlan_cu \
    libtiOsLib \
    wlan_loader \
    libCustomWifi \
    alsa.omap4 \
    wpa_supplicant.conf \
    dhcpcd.conf \
    libLCML \
    libVendor_ti_omx \
    Usb

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/amazon/otter/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=true \
	ro.ril.hsxpa=1 \
	ro.ril.gprsclass=10 \
	ro.config.notification_sound=ro.config.alarm_alert=Alarm_Classic.ogg \
	net.bt.name=Android \
	dalvik.vm.stack-trace-file=/data/anr/traces.txt

$(call inherit-product, build/target/product/full_base.mk)

# Set mdpi locale after inheritting base.mk (corrects default language loading as MD)
PRODUCT_LOCALES += mdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_otter
PRODUCT_DEVICE := otter
