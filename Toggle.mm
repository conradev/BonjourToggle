#include <notify.h>

// Required
extern "C" BOOL isCapable() {
	return YES;
}

// Required
extern "C" BOOL isEnabled() {
	NSDictionary *mDNSDict = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"];
    if (mDNSDict) {
        NSArray *args = [mDNSDict objectForKey:@"ProgramArguments"];
        for (NSString *arg in args) {
            if ([arg isEqualToString:@"-NoMulticastAdvertisements"]) {
                return NO;   
            }
        }
        return YES;
    }
    return NO;
}

// Required
extern "C" void setState(BOOL enabled) {
    if (enabled)
        notify_post("com.conradkramer.bonjourtoggle.enable");
    else
        notify_post("com.conradkramer.bonjourtoggle.disable");

    notify_post("com.conradkramer.bonjourtoggle.reload");
}

// Required
// How long the toggle takes to toggle, in seconds.
extern "C" float getDelayTime() {
	return 0.3f;
}

// vim:ft=objc
