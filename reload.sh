#!/bin/sh
launchctl unload /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
launchctl load   /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
