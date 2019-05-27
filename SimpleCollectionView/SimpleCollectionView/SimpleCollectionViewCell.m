//
//  SimpleCollectionViewCell.m
//  SimpleCollectionView
//
//  Created by zhangxuyang on 2019/5/24.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleCollectionViewCell.h"

@interface SimpleCollectionViewCell()

@property (nonatomic, copy) UILabel *label;

@end

@implementation SimpleCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_label];
    self.backgroundView = [[UIView alloc] init];
    self.backgroundView.backgroundColor = [UIColor lightGrayColor];
    return self;
}

-(void) prepareForReuse{
    [super prepareForReuse];
    self.num = @"";
}

-(void) layoutSubviews{
    [super layoutSubviews];
    [self.label sizeToFit];
    self.label.center = self.contentView.center;
}

-(void)refreshData{
    _label.text = self.num;
    [self setNeedsLayout];
}


@end
