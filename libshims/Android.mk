# Copyright (C) 2015 The CyanogenMod Project
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

LOCAL_PATH := $(call my-dir)

# liblog.so
include $(CLEAR_VARS)
LOCAL_SRC_FILES   := htc_log.c
LOCAL_MODULE      := libshim_log
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)


# libqc-opt.so
include $(CLEAR_VARS)
LOCAL_SRC_FILES        := icu53.c
LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE           := libshim_qcopt
LOCAL_MODULE_TAGS      := optional
include $(BUILD_SHARED_LIBRARY)


# camera.vendor.msm8960.so
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    gui/SensorManager.cpp \
    ui/GraphicBuffer.cpp \
    ui/GraphicBufferAllocator.cpp \
    ui/GraphicBufferMapper.cpp \
    MemoryHeapPmem.cpp \
    MemoryBase.c \
    SharedBuffer.cpp \
    VectorImpl.cpp

LOCAL_SHARED_LIBRARIES := liblog libcutils libhardware libui libgui libbinder libutils libsync libshim_sensors
LOCAL_MODULE := libshim_camera
LOCAL_C_INCLUDES += external/safe-iop/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_MODULE_TAGS      := optional
include $(BUILD_SHARED_LIBRARY)


# sensors.default.so
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    sensors.c \
    SharedBuffer.cpp \
    VectorImpl.cpp

LOCAL_SHARED_LIBRARIES := liblog
LOCAL_C_INCLUDES  += external/safe-iop/include
LOCAL_MODULE      := libshim_sensors
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
