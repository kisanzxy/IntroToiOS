//
//  XYUIImage.m
//  XYUIImage
//
//  Created by zhangxuyang on 2019/5/28.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYUIImage.h"

@interface XYUIImage ()

@end

@implementation XYUIImage

- (UIView *) view{
    if(!_view){
        _view = [[UIView alloc]init];
        UILabel *label = [UILabel new];
        label.text = @"免费";
        CAGradientLayer *gl = [CAGradientLayer layer];
        [_view addSubview:label];
        
        
    
        
        
    }
    return _view;
}

@end
