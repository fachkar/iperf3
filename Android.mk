
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
   cjson.c \
   iperf_api.c \
   iperf_error.c \
   iperf_client_api.c \
   iperf_server_api.c \
   iperf_tcp.c \
   iperf_udp.c \
   iperf_util.c \
   locale.c \
   net.c \
   tcp_info.c \
   tcp_window_size.c \
   timer.c \
   units.c     

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CFLAGS := -O2 -W -Wall -DHAVE_CONFIG_H
# LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libiperf
LOCAL_MODULE_TAGS := eng

include $(BUILD_STATIC_LIBRARY)

#########################
# Build the iperf binary

iperf_src_files :=  \
   main.c

iperf_cflags := -O2 -W -Wall \
   -DHAVE_CONFIG_H

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(iperf_src_files)
# LOCAL_C_INCLUDES := $(iperf_c_includes)
LOCAL_CFLAGS := $(iperf_cflags)
# LOCAL_SYSTEM_SHARED_LIBRARIES := $(e2fsck_system_shared_libraries)
LOCAL_STATIC_LIBRARIES := libiperf
LOCAL_MODULE := iperf
LOCAL_MODULE_TAGS := eng
include $(BUILD_EXECUTABLE)
