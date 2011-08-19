int main(int argc, char **argv, char **envp) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSMutableDictionary *mDNSDict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"];
    if (mDNSDict) {
        NSMutableArray *args = [NSMutableArray arrayWithArray:[mDNSDict objectForKey:@"ProgramArguments"]];
 
        for (NSString *arg in args) {
            if ([arg isEqualToString:@"-NoMulticastAdvertisements"]) {
                [args removeObject:arg]; 
                break;
            }
        }

        [mDNSDict setObject:args forKey:@"ProgramArguments"];
        [mDNSDict writeToFile:@"/System/Library/LaunchDaemons/com.apple.mDNSResponder.plist" atomically:YES];
    }

    [pool release];
    
    return 0;
}

// vim:ft=objc
