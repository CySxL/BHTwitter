ARCHS = arm64
TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = Twitter
LDFLAGS += -F$(THEOS)/sdks/iPhoneOS16.5.sdk/System/Library/PrivateFrameworks

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BHTwitter

BHTwitter_FILES = Tweak.x $(wildcard *.m BHDownload/*.m BHTBundle/*.m Colours/*.m JGProgressHUD/*.m SAMKeychain/*.m AppIcon/*.m CustomTabBar/*.m ThemeColor/*.m)
BHTwitter_FRAMEWORKS = UIKit Foundation AVFoundation AVKit CoreMotion GameController VideoToolbox Accelerate CoreMedia CoreImage CoreGraphics ImageIO Photos CoreServices SystemConfiguration SafariServices Security QuartzCore WebKit SceneKit MobileCoreServices
BHTwitter_PRIVATE_FRAMEWORKS = Preferences
BHTwitter_EXTRA_FRAMEWORKS = Cephei CepheiPrefs CepheiUI
BHTwitter_OBJ_FILES = $(shell find lib -name '*.a')
BHTwitter_LIBRARIES = sqlite3 bz2 c++ iconv z
BHTwitter_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-nullability-completeness -Wno-unused-function -Wno-unused-property-ivar -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk

ifdef SIDELOADED
SUBPROJECTS += libflex keychainfix
else
SUBPROJECTS += libflex
endif

include $(THEOS_MAKE_PATH)/aggregate.mk
