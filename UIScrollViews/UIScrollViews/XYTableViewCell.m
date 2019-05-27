//
//  XYTableViewCell.m
//  UIScrollViews
//
//  Created by zhangxuyang on 2019/5/27.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYTableViewCell.h"

@interface XYTableViewCell ()
@property (nonatomic, strong) UIImageView *bookImageView;
// 书名,      需要注意: 不要和父类的textLabel和DetailTextLable属性冲突
@property (nonatomic, strong) UILabel *nameLabel;
// 价格


@end

@implementation XYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化视图对象
        // 图片
        _bookImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
        // 添加到父视图
        // 自定义cell的时候, 所有视图都添加到cell的contentView中
        [self.contentView addSubview:_bookImageView];
        
        // 书名
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 200, 20)];
        [self.contentView addSubview:_nameLabel];
        
    }
    return self;
}

//- (void)config:(BookModel *)model
//{
//    self.bookImageView.image = [UIImage imageNamed:model.icon];
//    self.nameLabel.text = model.name;
//    self.prcieLabel.text = model.price;
//    self.descLabel.text = model.detail;
//}

- (void) config: (NSInteger ) digit{
    self.bookImageView.image = [UIImage imageNamed:@"cat.png"];
    self.nameLabel.text = @"cat";
}

@end
