TARGET =: clang
ARCHS = armv7 armv7s arm64
DEBUG = 0
GO_EASY_ON_ME = 1

THEOS_PACKAGE_DIR_NAME = debs
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libkarenlocalizer
libkarenlocalizer_FILES = $(wildcard *.m)

include $(THEOS_MAKE_PATH)/library.mk

setup:: all
	@cp -v .theos/$(THEOS_OBJ_DIR_NAME)/libkarenlocalizer.dylib $(THEOS)/lib/
	@mkdir -p $(THEOS)/include/KarenLocalizer/
	@cp -v *.h $(THEOS)/include/KarenLocalizer/
