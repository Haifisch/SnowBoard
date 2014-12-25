include theos/makefiles/common.mk

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SnowBoardPrefs.plist$(ECHO_END)
	$(ECHO_NOTHING)cp Resources/snowflake.png $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SnowBoardFlake.png$(ECHO_END)
