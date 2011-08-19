int main(int argc, char **argv, char **envp) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSMutableDictionary *mDNSDict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"];
    if (mDNSDict) {
        NSMutableArray *args = [NSMutableArray arrayWithArray:[mDNSDict objectForKey:@"ProgramArguments"]];
        
        BOOL argExists = NO;
        for (NSString *arg in args) {
            if ([arg isEqualToString:@"-NoMulticastAdvertisements"]) {
                argExists = YES; 
                break;
            }
        }

        if (!argExists)
            [args addObject:@"-NoMulticastAdvertisements"];

        [mDNSDict setObject:args forKey:@"ProgramArguments"];
        [mDNSDict writeToFile:@"/System/Library/LaunchDaemons/com.apple.mDNSResponder.plist" atomically:YES];
    }

    [pool release];
    
    return 0;
}

// vim:ft=objc
