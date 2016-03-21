LOCAL_PATH:= $(call my-dir)

commonFlags := -Wall -Wno-nonnull -O2 -DPTHREAD_BIONIC -DVERSION=0.96 -D_GNU_SOURCE

include $(CLEAR_VARS)
LOCAL_MODULE := librttest
LOCAL_MODULE_TAGS := eng
FILE_LIST := $(wildcard $(LOCAL_PATH)/src/lib/*.c)
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)
LOCAL_CFLAGS += $(commonFlags)
LOCAL_LDLIBS += -ldl
LOCAL_LDFLAGS += -pie
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/include
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := cyclictest
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := librttest
FILE_LIST := $(wildcard $(LOCAL_PATH)/src/cyclictest/*.c)
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)
LOCAL_CFLAGS += $(commonFlags)
LOCAL_LDLIBS += -ldl
LOCAL_LDFLAGS += -pie
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/include
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := hackbench
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := librttest
FILE_LIST := $(wildcard $(LOCAL_PATH)/src/hackbench/*.c)
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)
LOCAL_CFLAGS += $(commonFlags)
LOCAL_LDLIBS += -ldl
LOCAL_LDFLAGS += -pie
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/include
include $(BUILD_EXECUTABLE)
