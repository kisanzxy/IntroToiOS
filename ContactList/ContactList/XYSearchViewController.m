//
//  XYSearchViewController.m
//  ContactList
//
//  Created by zhangxuyang on 2019/5/23.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYSearchVIewController.h"
#import <UIKit/UIKit.h>

@interface XYSearchViewController () 

@property(nonatomic, copy) NSMutableArray *array;

@end




@implementation XYSearchViewController
#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.searchResults count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchResultCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.searchResults[indexPath.row];
    
    return cell;
}
@end
