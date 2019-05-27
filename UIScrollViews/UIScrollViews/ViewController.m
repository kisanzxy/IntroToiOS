//
//  ViewController.m
//  UIScrollViews
//
//  Created by zhangxuyang on 2019/5/27.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import "ViewController.h"
#import "XYTableViewCell.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController
NSArray *dataArray ;
static NSString *ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = @[@[@1,@2], @[@1,@2],@[@1,@1]];
    self.scrollView = [[UIScrollView alloc ] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT/2)];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sakura.jpeg"]];
    
    //self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, SCREEN_WIDTH, 400);
    self.scrollView.contentSize = imgView.bounds.size;
    self.scrollView.bounces = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT/2,  SCREEN_WIDTH, SCREEN_HEIGHT/2) style:UITableViewStyleGrouped];
    [self.tableView registerClass: XYTableViewCell.class forCellReuseIdentifier:ID];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.scrollView addSubview:imgView];
    [self.view addSubview:_scrollView];
    [self.view addSubview:_tableView];
    
                                                                      
    // Do any additional setup after loading the view.
}

#pragma mark data soure delegate methods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XYTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell){
        cell = [[XYTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    [cell config :(int)dataArray[indexPath.section][indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"count (group %i) rows", (int)section);
    return 2;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return dataArray.count;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"return title of the section %i", (int)section);
 //
    return @"default";
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"return footerof the section %i", (int)section);
    //
    return @"default";
    
}
#pragma mark setRowHeight
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat) tableView:(UITableView *)tableView widthForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return SCREEN_WIDTH;
}

- (CGFloat) tableView:(UITableView *)tableView sepa

@end
