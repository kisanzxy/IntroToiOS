//
//  ViewController.h
//  DigitalClock
//
//  Created by zhangxuyang on 2019/5/21.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIView *settingView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegCtrl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *bgColorSegCtrl;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;

- (IBAction)changeClcokColor:(id)sender;
- (IBAction)changeBgColor:(id)sender;

- (IBAction)showSettings:(id)sender;

@end

