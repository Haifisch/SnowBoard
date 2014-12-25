include theos/makefiles/common.mk
THEOS_BUILD_DIR = debs
TWEAK_NAME = SnowBoard
SnowBoard_FILES = Tweak.xm SnowFallView.m
SnowBoard_FRAMEWORKS = UIKit QuartzCore CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk
internal-stage::
	cp snowflake.png $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/SnowBoardFlake.png

after-install::
	install.exec "killall -9 SpringBoard"
#SUBPROJECTS += snowboardprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
