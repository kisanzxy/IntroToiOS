//
//  CustomCollectionViewController.m
//  SimpleCollectionView
//
//  Created by zhangxuyang on 2019/5/24.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomCollectionViewContoller.h"
#import "SimpleCollectionViewCell.h"
#import "PicFlowLayout.h"


static NSString *SIMPLESUPPLEMENTARYIDENTIFIER = @"SuppView";
static NSString *SIMPLECELLIDENTIFIER = @"Cell";
@interface CustomCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,assign) NSUInteger count;

@property (nonatomic,assign) NSUInteger sectionCount;


@end

@implementation CustomCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 30;
    _sectionCount = 5;
    // 设置 flowLayout
    UICollectionViewFlowLayout *flowLayout;

    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //flowLayout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 30);
 
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    // 添加 collectionView，记得要设置 delegate 和 dataSource 的代理对象
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    // 注册 cell
    [_collectionView registerClass:[SimpleCollectionViewCell class] forCellWithReuseIdentifier:SIMPLECELLIDENTIFIER];
 
    
//    self.navigationItem.title = @"Simple display";
//    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
//    self.navigationItem.rightBarButtonItem = btnItem;
}

#pragma mark - Private Methods
- (void)addItem:(id)sender {
    [self.collectionView performBatchUpdates:^{
        //        [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:2 inSection:0]]];
        self.count ++;
        [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:5 inSection:0]]];
    } completion:nil];
}

#pragma mark - CollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    // 获取当前点击的 cell
    SimpleCollectionViewCell *cell = (SimpleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.num = @"be selected";
    [cell refreshData];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"]) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:((SimpleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath]).num];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(10, 10);
    }
    return CGSizeMake(50, 50);
}

#pragma mark - CollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _sectionCount;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SimpleCollectionViewCell *cell = (SimpleCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:SIMPLECELLIDENTIFIER forIndexPath:indexPath];
    cell.num = [NSString stringWithFormat:@"%ld",(long)indexPath.item];
    [cell refreshData];
    return cell;
}

@end



