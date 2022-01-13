#include "GSPRootListController.h"

@implementation GSPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:1.0f green:0.81f blue:0.86f alpha:1];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];
        self.hb_appearanceSettings = appearanceSettings;

		self.applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" 
                                    style:UIBarButtonItemStylePlain
                                    target:self 
                                    action:@selector(apply:)];
        self.applyButton.tintColor = [UIColor colorWithRed:1.0f green:0.81f blue:0.86f alpha:1];
		self.navigationItem.rightBarButtonItem = self.applyButton;
    }
    return self;
}

-(void)github {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/jakecrowley/FosscordTweak"]];
}

- (void)apply:(id)sender {
	pid_t pid;
	const char *args[] = {"sh", "-c", "killall Discord", NULL};
	posix_spawn(&pid, "/bin/sh", NULL, NULL, (char *const *)args, NULL);
}
@end
