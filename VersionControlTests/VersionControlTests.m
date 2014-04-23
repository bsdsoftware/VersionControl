//
//  VersionControlTests.m
//  VersionControlTests
//
//  Created by Simone Fantini on 23/04/14.
//  Copyright (c) 2014 BSDSoftware. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VersionControl.h"

@interface VersionControlTests : XCTestCase

@property (nonatomic, strong) VersionControl *versionControl;

@end

@implementation VersionControlTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
	self.versionControl = [[VersionControl alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
	self.versionControl = nil;
}

- (void)testCurrentVersionIsCorrect {
	XCTAssert([self.versionControl.currentVersion isEqualToString:@"1.0.0"], @"Valore di versione non letto correttamente");
}

@end
