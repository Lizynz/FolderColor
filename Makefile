export ARCHS = arm64 arm64e
DEBUG = 0
export TARGET = iphone:clang:14.2

PACKAGE_VERSION = 2.0-5

export SYSROOT = $(THEOS)/sdks/iPhoneOS14.2.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FolderColor
FolderColor_FILES = Tweak.xm
FolderColor_FRAMEWORKS = UIKit
FolderColor_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += foldercolor
include $(THEOS_MAKE_PATH)/aggregate.mk
