//
//  ViewController.m
//  Actions
//
//  Created by zhangxuyang on 2019/5/21.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)actionOne:(id)sender {
    
    self.label.text = @"action1";
}

- (IBAction)actionTwo:(id)sender {
    self.label.text = @"action2";
}

- (IBAction)actionThree:(id)sender {
    [self triggerAction];
}

- (IBAction)switchButton:(id)sender {
    if (self.switchButton.on){

        self.button2.enabled = YES;
        
    }
    else{
        self.button2.enabled = NO;
    }
}

- (void) triggerAction{
    self.label.text = @"action3";
}
@end
