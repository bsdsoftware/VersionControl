//
//  AppDelegate.h
//  TestApp
//
//  Created by Simone Fantini on 23/04/14.
//  Copyright (c) 2014 BSDSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VersionControl.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) VersionControl *versionControl;

@end
