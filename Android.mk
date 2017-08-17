LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libbackup
LOCAL_MODULE_TAGS := optional
LOCAL_SDK_VERSION := current

EXCLUDE_BACKUP_LIB_SRCS := $(call all-java-files-under, src/com/google/android/libraries/backup/shadow/)

LOCAL_SRC_FILES := $(call all-java-files-under,.)
LOCAL_SRC_FILES := $(filter-out $(EXCLUDE_BACKUP_LIB_SRCS),$(LOCAL_SRC_FILES))

LOCAL_STATIC_ANDROID_LIBRARIES := android-support-v4 \

LOCAL_STATIC_JAVA_LIBRARIES := libbackup-guava

include $(BUILD_STATIC_JAVA_LIBRARY)

EXCLUDE_BACKUP_LIB_SRCS :=

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := libbackup-guava
LOCAL_SDK_VERSION := current
LOCAL_SRC_FILES := ../../prebuilts/tools/common/m2/repository/com/google/guava/guava/20.0/guava-20.0$(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_UNINSTALLABLE_MODULE := true

include $(BUILD_PREBUILT)
