//
//  StoryboardTests.m
//  MalometerTDDWeek5
//
//  Created by Carlos Roig Salvador on 04/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <XCTest/XCTest.h>

static NSString * const kStoryboardName             = @"Malometer_iPhone";

@interface StoryboardTests : XCTestCase

@end

@implementation StoryboardTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStoryboardExistsAndCanBeLoaded {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kStoryboardName bundle:nil];
    XCTAssertNotNil(storyboard, @"The storyboard must exist and be loadable");
}



@end
