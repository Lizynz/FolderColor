include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FolderColor
FolderColor_FILES = FolderColorRootListController.m FolderColorCell.m
FolderColor_INSTALL_PATH = /Library/PreferenceBundles
FolderColor_FRAMEWORKS = UIKit Foundation
FolderColor_PRIVATE_FRAMEWORKS = Preferences
FolderColor_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FolderColor.plist$(ECHO_END)
