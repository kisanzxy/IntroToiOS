//
//  ViewController.m
//  CatApp
//
//  Created by zhangxuyang on 2019/5/20.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.catButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.label.hidden = YES;
    
    // soundURL refer to CAt.wav
    NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Cat" ofType:@"wav"]];
    // link soundURL to systemSoundID that we created
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
    
    
}


- (IBAction)theCat:(id)sender {
    self.label.hidden = NO;
    
    AudioServicesPlaySystemSound(soundID);
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(catDelay) userInfo:nil repeats:NO];
}

- (void) catDelay{
    
    self.label.hidden = YES;
    
}

@end
