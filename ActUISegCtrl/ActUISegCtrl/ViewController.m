//
//  ViewController.m
//  ActUISegCtrl
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
    self.label.text = @"Segment1";
}


- (IBAction)segContro:(id)sender {
    
    switch (self.segControl.selectedSegmentIndex){
        case 0:
            self.label.text = @"Segment1";
            break;
        case 1:
            self.label.text = @"Segment2";
            break;
        case 2:
            self.label.text = @"Segment3";
            break;
        case 3:
            self.label.text = @"Segment4";
            break;
        default:
            break;
    }
}
@end
