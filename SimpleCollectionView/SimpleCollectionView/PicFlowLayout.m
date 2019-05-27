//
//  PicFlowLayout.m
//  SimpleCollectionView
//
//  Created by zhangxuyang on 2019/5/24.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PicFlowLayout.h"
@implementation PicFlowLayout

- (instancetype)init {
    if(! (self = [super init])){
        return nil;
    }
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(280, 280);
    self.minimumLineSpacing = 30;
    self.headerReferenceSize = CGSizeMake(30, 30);
    return self;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *newArray = [NSMutableArray array];
    float centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width/2;
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        UICollectionViewLayoutAttributes *newAttrs = [attrs copy];
        if (newAttrs.representedElementCategory == UICollectionElementCategorySupplementaryView) {
            continue;
        }
        float offset = 1.5 - fabs(centerX - attrs.center.x)/self.collectionView.frame.size.width;
        newAttrs.transform = CGAffineTransformScale(newAttrs.transform, offset, offset);
        [newArray addObject:newAttrs];
    }
    return newArray;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

//滑动停止时图片在中间

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGRect proposedRect = CGRectMake(proposedContentOffset.x, 0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray *array = [self layoutAttributesForElementsInRect:proposedRect];
    float offset = 1000;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (attrs.representedElementCategory == UICollectionElementCategorySupplementaryView) {
            continue;
        }
        if (fabs(attrs.center.x - (proposedContentOffset.x+self.collectionView.bounds.size.width/2))<fabs(offset)) {
            offset = attrs.center.x - (proposedContentOffset.x+self.collectionView.bounds.size.width/2);
        }
    }
    return CGPointMake(proposedContentOffset.x + offset, proposedContentOffset.y);
}

@end
