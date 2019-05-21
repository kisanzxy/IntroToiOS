//
//  ViewController.h
//  Actions
//
//  Created by zhangxuyang on 2019/5/21.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;

- (IBAction)actionOne:(id)sender;
- (IBAction)actionTwo:(id)sender;

- (IBAction)actionThree:(id)sender;
- (IBAction)switchButton:(id)sender;

@end

