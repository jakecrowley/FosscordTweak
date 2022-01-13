TARGET = iphone:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FosscordTweak

FosscordTweak_FILES = Tweak.xm
FosscordTweak_CFLAGS = -fobjc-arc
FosscordTweak_EXTRA_FRAMEWORKS += Cephei


include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += fosscordtweakprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
