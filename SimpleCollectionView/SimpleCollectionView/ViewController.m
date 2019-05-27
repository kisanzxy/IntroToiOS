//
//  ViewController.m
//  SimpleCollectionView
//
//  Created by zhangxuyang on 2019/5/24.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewContoller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CustomCollectionViewController *simpleDisplayViewController =[ [CustomCollectionViewController alloc] init];
    UINavigationController *navViewController = [[UINavigationController alloc] initWithRootViewController:simpleDisplayViewController];
    [self presentViewController:navViewController animated:YES completion:nil];
}
    



@end
