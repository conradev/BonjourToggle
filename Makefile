include theos/makefiles/common.mk

LIBRARY_NAME = Toggle
Toggle_FILES = Toggle.mm
Toggle_INSTALL_PATH = /var/mobile/Library/SBSettings/Toggles/Bonjour

TOOL_NAME = com.conradkramer.bonjourtoggle.enable com.conradkramer.bonjourtoggle.disable
com.conradkramer.bonjourtoggle.enable_FILES = enable.m
com.conradkramer.bonjourtoggle.disable_FILES = disable.m
com.conradkramer.bonjourtoggle.enable_INSTALL_PATH = /var/mobile/Library/SBSettings/Commands
com.conradkramer.bonjourtoggle.disable_INSTALL_PATH = /var/mobile/Library/SBSettings/Commands

include $(THEOS_MAKE_PATH)/tool.mk
include $(THEOS_MAKE_PATH)/library.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/var/mobile/Library/SBSettings/Commands$(ECHO_END)
	$(ECHO_NOTHING)cp reload.sh $(THEOS_STAGING_DIR)/var/mobile/Library/SBSettings/Commands/com.conradkramer.bonjourtoggle.reload$(ECHO_END)
