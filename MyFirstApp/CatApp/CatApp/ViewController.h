//
//  ViewController.h
//  CatApp
//
//  Created by zhangxuyang on 2019/5/20.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController {
    
    SystemSoundID soundID;
}

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *catButton;
- (IBAction)theCat:(id)sender;

@end

