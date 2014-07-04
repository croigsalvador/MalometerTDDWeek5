//
//  IHAgentEditViewController.m
//  MalometerTDDWeek5
//
//  Created by Carlos Roig Salvador on 04/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "IHAgentEditViewController.h"
#import "Agent+Model.h"

NSString * const kAgentEditViewControllerID             = @"AgentEditViewController";

@interface IHAgentEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@end

@implementation IHAgentEditViewController


- (void)viewDidLoad {
    self.title = @"Pepito";
    self.nameTextField.text = self.agent.name;
    self.nameTextField.text = @"Pepito";
    
}
@end
