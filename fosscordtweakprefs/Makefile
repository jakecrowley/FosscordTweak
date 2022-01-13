TARGET = iphone:latest:13.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = fosscordtweakprefs

fosscordtweakprefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
fosscordtweakprefs_FILES = GSPRootListController.m
fosscordtweakprefs_FRAMEWORKS = UIKit
fosscordtweakprefs_PRIVATE_FRAMEWORKS = Preferences
fosscordtweakprefs_INSTALL_PATH = /Library/PreferenceBundles
fosscordtweakprefs_CFLAGS = -fobjc-arc -Wdeprecated-declarations -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/bundle.mk
