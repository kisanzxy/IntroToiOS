//
//  SimpleCollectionViewCell.h
//  SimpleCollectionView
//
//  Created by zhangxuyang on 2019/5/24.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#ifndef SimpleCollectionViewCell_h
#define SimpleCollectionViewCell_h


#endif /* SimpleCollectionViewCell_h */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SimpleCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *num;
- (void) refreshData;

@end
