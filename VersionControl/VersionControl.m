//
//  VersionControl.m
//  VersionControl
//
//  Created by Simone Fantini on 23/04/14.
//  Copyright (c) 2014 BSDSoftware. All rights reserved.
//

#import "VersionControl.h"
#import <objc/runtime.h>

@interface VersionControl ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation VersionControl

NSString *const VersionControlVersionKey = @"VersionControlVersionKey";

- (id)init {
	self = [super init];
	if (self) {
		self.userDefaults = [NSUserDefaults standardUserDefaults];
		_currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
#if DEBUG
		NSLog(@"VersionControl: versione %@", _currentVersion);
#endif
	}
	return self;
}

- (void)executeBlock:(VersionBlock)block forVersion:(NSString *)version {
	if ([self shouldExecuteBlockForVersion:version]) {
		block();
		[self.userDefaults setObject:_currentVersion forKey:VersionControlVersionKey];
		[self.userDefaults synchronize];
	}
}

- (BOOL)shouldExecuteBlockForVersion:(NSString *)version {
	BOOL versionCheck = [_currentVersion isEqualToString:version];
	BOOL notExecutedYet = !([[self.userDefaults objectForKey:VersionControlVersionKey] isEqualToString:_currentVersion]);
	return versionCheck && notExecutedYet;
}

- (void)reset {
	[self.userDefaults setObject:nil forKey:VersionControlVersionKey];
	[self.userDefaults synchronize];
}

@end
