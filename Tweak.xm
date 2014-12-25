
#import "SnowFallView.h"
#import <substrate.h>

//static NSString *const kHBSBPreferencesDomain = @"ninja.haifisch.snowboard";
//static NSString *const kHBSBPreferencesEnabledKey = @"Enabled";

//NSUserDefaults *userDefaults;
//UIView *wallPaperView; 

@interface SBFWallpaperView : UIView
@end

@interface NSUserDefaults (Private)
- (instancetype)_initWithSuiteName:(NSString *)suiteName container:(NSURL *)container;
@end

%hook SBFWallpaperView
-(void)layoutSubviews {
	NSLog(@"[SnowBoard] We're hooked.");
	//wallPaperView = self;
	SnowFallView *sfv = [[SnowFallView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width*2, self.frame.size.height*2)];
	sfv.flakesCount = 20;
	[sfv setAnimationDurationMax:40];
	[sfv setAnimationDurationMin:25];
	[self addSubview:sfv];
	[sfv letItSnow];
	[sfv release];
	
	%orig;
}
%end
/*
void HBSBPreferencesChanged() {
	NSDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:[[[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"Preferences"] stringByAppendingPathComponent:kHBSBPreferencesDomain] stringByAppendingPathExtension:@"plist"]];
	NSLog(@"[SnowBoard] preferencesChanged: %@", [preferences[kHBSBPreferencesEnabledKey] boolValue] ? @"Enabled" : @"Disabled");
	if ([preferences[kHBSBPreferencesEnabledKey] boolValue])
	{
		NSLog(@"[SnowBoard] adding to SpringBoard");
	}else {
		if (sfv)
		{
			NSLog(@"[SnowBoard] removing from SpringBoard");
			[sfv removeFromSuperview];
		}
	}
}

%ctor {
	userDefaults = [[NSUserDefaults alloc] _initWithSuiteName:kHBSBPreferencesDomain container:[NSURL URLWithString:@"/var/mobile"]];

	[userDefaults registerDefaults:@{
	    kHBSBPreferencesEnabledKey: @YES
	}];

	%init;

	HBSBPreferencesChanged();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)HBSBPreferencesChanged, CFSTR("ninja.haifisch.snowboard/ReloadPrefs"), NULL, kNilOptions);
}
*/

