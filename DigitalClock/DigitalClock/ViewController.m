//
//  ViewController.m
//  DigitalClock
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
    [self updateTime];

    // Do any additional setup after loading the view.
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    self.settingView.hidden = YES;
    self.settingButton.alpha = 0.25;
    [self.settingButton setTitle: @"Show Settings" forState:UIControlStateNormal];
}

- (void) updateTime {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm:ss"];
    self.label.text = [formatter stringFromDate:[NSDate date]];
}

- (IBAction)changeClcokColor:(id)sender {
    if(self.colorSegCtrl.selectedSegmentIndex == 0){
        self.label.textColor = [UIColor whiteColor];
        
    }else {
        self.label.textColor = [UIColor blackColor];

    }
}

- (IBAction)changeBgColor:(id)sender {
    if(self.bgColorSegCtrl.selectedSegmentIndex == 0){
        self.background.backgroundColor = [UIColor darkGrayColor];
        
    }else {
        self.background.backgroundColor = [UIColor whiteColor];
        
    }
}

- (IBAction)showSettings:(id)sender {
    if (self.settingView.hidden == YES){
        self.settingView.hidden = NO;
        self.settingButton.alpha = 1.0;
        [self.settingButton setTitle: @"Hide Settings" forState:UIControlStateNormal];
    }else{
        self.settingView.hidden = YES;
        self.settingButton.alpha = 0.25;
        [self.settingButton setTitle: @"Show Settings" forState:UIControlStateNormal];
        
    }
}
@end
