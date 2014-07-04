//
//  IHAgentEditViewControllerTests.m
//  MalometerTDDWeek5
//
//  Created by Carlos Roig Salvador on 04/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//


#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "IHAgentEditViewController.h"
#import "Agent+Model.h"

static NSString * const kStoryboardName              = @"Malometer_iPhone";
static NSString * const kAgentNameKey                = @"Pepito";
static NSString * const kAgent2NameKey               = @"Flash";

static NSString * const kNametTextFieldKey           = @"nameTextField";


@interface IHAgentEditViewControllerTests : XCTestCase {
    // Core Data stack objects.
    NSManagedObjectModel *model;
    NSPersistentStoreCoordinator *coordinator;
    NSPersistentStore *store;
    NSManagedObjectContext *context;
    // Object to test.
    IHAgentEditViewController *sut;
    Agent *agent, *agent2;
}



@end


@implementation IHAgentEditViewControllerTests

#pragma mark - Set up and tear down

- (void) setUp {
    [super setUp];

   [self createCoreDataStack];
    [self createFixture];
    [self createSut];
}


- (void) createCoreDataStack {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    model = [NSManagedObjectModel mergedModelFromBundles:@[bundle]];
    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    store = [coordinator addPersistentStoreWithType: NSInMemoryStoreType
                                      configuration: nil
                                                URL: nil
                                            options: nil
                                              error: NULL];
    context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = coordinator;
}


- (void) createFixture {
    agent = [self createAgentWithName:kAgentNameKey];
    agent2 = [self createAgentWithName:kAgent2NameKey];
}

- (Agent *)createAgentWithName:(NSString *)name {
    Agent *ag =[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Agent class]) inManagedObjectContext:context];
    ag.name = name;
    return ag;
}


- (void) createSut {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kStoryboardName bundle:nil] ;
    sut = [storyboard instantiateViewControllerWithIdentifier:kAgentEditViewControllerID];
}


- (void) tearDown {
    [self releaseSut];
    [self releaseFixture];
//    [self releaseCoreDataStack];

    [super tearDown];
}


- (void) releaseSut {
    sut = nil;
}


- (void) releaseFixture {

}


- (void) releaseCoreDataStack {
    context = nil;
    store = nil;
    coordinator = nil;
    model = nil;
}


#pragma mark - Basic test

- (void)testNavBarShouldEqualAgentName {

//    id agentMock = [OCMockObject mockForClass:[Agent class]];
//    [[[agentMock stub] andReturn:kAgentNameKey] name];
    sut.agent  = agent;
    [sut view];
    
    XCTAssertEqualObjects(sut.title, kAgentNameKey, @"Controller title should be equal to agent name");
}

- (void)testNameTextFieldOutletIsConnected {
    [sut view];
    XCTAssertNotNil([sut valueForKey:@"nameTextField"], @"TextField is not connected");
}

- (void)testTextFieldShouldBeEqualAgentPepito {
    sut.agent = agent;
    [sut view];
    UITextField *textField = [sut valueForKey:kNametTextFieldKey];
    
    XCTAssertEqualObjects(textField.text, kAgentNameKey, @"TextField should be equal to agent name");
}

- (void)testTextFieldShouldBeEqualAgentName {
    sut.agent = agent2;
    [sut view];
    UITextField *textField = [sut valueForKey:kNametTextFieldKey];
    
    XCTAssertEqualObjects(textField.text, kAgent2NameKey, @"TextField should be equal to agent name");
}

















@end
