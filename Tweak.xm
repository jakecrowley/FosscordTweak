#include <Cephei/HBPreferences.h>
#include <mach-o/dyld.h>
#include "headers.h"

HBPreferences *preferences;
BOOL tweakEnabled;
NSString *fosscordURL;

%hook NSURLRequest
+(NSURLRequest *) requestWithURL: (NSURL *)url {
	if(tweakEnabled){
		NSString *newURL = url.absoluteString;
		newURL = [newURL stringByReplacingOccurrencesOfString:@"discord.com" withString:fosscordURL];
		newURL = [newURL stringByReplacingOccurrencesOfString:@"gateway.discord.gg" withString:fosscordURL];
		newURL = [newURL stringByReplacingOccurrencesOfString:@"cdn.discordapp.com" withString:fosscordURL];

		url = [NSURL URLWithString:newURL];
	}
	return %orig;
}
%end

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.jakecrowley.fosscordtweakprefs"];
	[preferences registerBool:&tweakEnabled default:NO forKey:@"tweakEnabled"];
	[preferences registerObject:&fosscordURL default:@"" forKey:@"fosscordURL"];
}
