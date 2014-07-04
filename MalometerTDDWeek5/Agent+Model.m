//
//  Agent+Model.m
//  MalometerTDDWeek5
//
//  Created by Carlos Roig Salvador on 02/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "Agent+Model.h"

@implementation Agent (Model)

+ (Agent *)createAgentWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context {
    Agent *ag =[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Agent class]) inManagedObjectContext:context];
    ag.name = name;
    return ag;
}

@end
