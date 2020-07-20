export ARCHS = arm64 arm64e
export TARGET := iphone::latest:13.0
THEOS_DEVICE_IP = 192.168.0.11

DEBUG = 0

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MusicAlbumScroll
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Music && killall -9 Preferences"
SUBPROJECTS += musicalbumscrollprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

