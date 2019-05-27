//
//  ViewController.m
//  ContactList
//
//  Created by zhangxuyang on 2019/5/21.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import "XYMainViewController.h"
#import "XYContact.h"
#import "XYContactGroup.h"
#import <UIKit/UIKit.h>
#import "XYSearchVIewController.h"
#define XYContactToolbarHeight 44
#define XYContactSearchbarHeight 60

@interface XYMainViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating>{
    
    //UITableView *_tableView;
    //UISearchBar *_searchBar;
    NSMutableArray *_contacts; //contacts model
    NSMutableArray *_searchResults;
    NSMutableArray *_searchContacts;
    NSIndexPath *_selectedIndexPath;
    UISearchController *_searchController;
    
    UIToolbar *_toolbar;
    BOOL _isInsert;
    BOOL _isSearching;
}
@end

@implementation XYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    //_tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
   // _tableView.contentInset = UIEdgeInsetsMake(XYContactToolbarHeight, 0, 0, 0);
    
    UINavigationController *searchResultsController = [[self storyboard] instantiateViewControllerWithIdentifier:@"TableSearchResultsNavController"];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    
    _searchController.searchResultsUpdater = self;
    
    
    [self addToolbar];
    [self addSearchBar];
    //[self addSearchBar];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
}

#pragma mark loadData
-(void) initData{
    _contacts=[[NSMutableArray alloc]init];
    
    XYContact *contact1=[XYContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    XYContact *contact2=[XYContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    XYContactGroup *group1=[XYContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];
    
    
    
    XYContact *contact3=[XYContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    XYContact *contact4=[XYContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    XYContact *contact5=[XYContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    XYContactGroup *group2=[XYContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];
    
    
    
    XYContact *contact6=[XYContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    XYContact *contact7=[XYContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];
    
    XYContactGroup *group3=[XYContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    [_contacts addObject:group3];
    
    
    XYContact *contact8=[XYContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    XYContact *contact9=[XYContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    XYContact *contact10=[XYContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    XYContact *contact11=[XYContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    XYContact *contact12=[XYContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    XYContactGroup *group4=[XYContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];
    
    
    XYContact *contact13=[XYContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    XYContact *contact14=[XYContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    XYContact *contact15=[XYContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    XYContactGroup *group5=[XYContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];
}


#pragma mark dataSourceMethods

#pragma mark returnNumberOfGroups
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{

    return _contacts.count;
    
}

#pragma mark returnCellInRow
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *contactCell = @"contactCell";
    NSLog(@"cell (group %i, row %i)", (int)indexPath.section, (int)indexPath.row);
    XYContactGroup *group = _contacts[indexPath.section];
    XYContact *contact = group.contacts[indexPath.row];

    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:contactCell];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:contactCell];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    cell.textLabel.text = [contact getName];
    NSLog(@"add phone number");
    cell.detailTextLabel.text = contact.phoneNumber;
    return cell;
}

#pragma mark returnNumberofRowsInSection
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"count (group %i) rows", (int)section);

    XYContactGroup *groupl = _contacts[section];
    return groupl.contacts.count;
}

#pragma mark returnGroupTitle

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
     NSLog(@"return title of the section %i", (int)section);
    XYContactGroup *group = _contacts[section];
    return group.name;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"return footerof the section %i", (int)section);
    XYContactGroup *group = _contacts[section];
    return group.detail;
    
}

#pragma mark returnGroupIndex
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"generate index");
    NSMutableArray *indexes = [[NSMutableArray alloc]init];
    for (XYContactGroup *group in _contacts){
        [indexes addObject:group.name];
    }
    return indexes;
}



#pragma mark delegateMethods
#pragma mark setTitleHeight
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 50;
    }
    return 40;
}

#pragma mark setRowHeight
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 45;
}

#pragma mark setFooterHeight
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 40;
}

#pragma mark clickRow
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    _selectedIndexPath = indexPath;
    XYContactGroup *group = _contacts[indexPath.section];
    XYContact *contact = group.contacts[indexPath.row];
    
    //prompt a window
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[contact getName] message:@"editing contact info" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"editing contact %@ at group %i row %i", [contact getName], (int)indexPath.section, (int)indexPath.row);
        UITextField *textField = [[alert textFields]objectAtIndex:0];
        contact.phoneNumber = textField.text;
        NSArray *indexPaths = @[self->_selectedIndexPath];
        [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"action cancelled");
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = contact.phoneNumber;
    }];
    
    [alert addAction:confirmAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
#pragma mark overrideStatusStyleMethod
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma mark retrieve current operation ststus, change button accordingly
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isInsert) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

#pragma mark addToolBar
- (void) addToolbar{
    CGRect frame = self.view.frame;
    _toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, frame.size.height-XYContactToolbarHeight, frame.size.width, XYContactToolbarHeight)];
    UIBarButtonItem *removeButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(remove)];
    UIBarButtonItem *flexibleButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAdd:)];
    NSArray *buttons = [NSArray arrayWithObjects:removeButton, flexibleButton, addButton, nil];
    _toolbar.items = buttons;
    self.tableView.tableFooterView = _toolbar;
}

#pragma mark addSearchBar
- (void) addSearchBar{
    CGRect frame = self.view.frame;
    _searchController.searchBar.frame = CGRectMake(0, 0, frame.size.width, XYContactSearchbarHeight);
    self.tableView.tableHeaderView = _searchController.searchBar;
}

- (void)clickAdd:(UIButton *)sender {
    _isInsert = YES;
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

#pragma mark remove
- (void) remove{
    _isInsert = NO;
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

#pragma mark delete and insert
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    XYContactGroup *group = _contacts[indexPath.section];
    XYContact *contact = group.contacts[indexPath.row];
    //delete
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [group.contacts removeObject:contact];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        if(group.contacts.count == 0){
            [_contacts removeObject:group];
            [tableView reloadData];
        }
    }
    
    //insert
    if(editingStyle == UITableViewCellEditingStyleInsert){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"New Contact" message:@"fill in the following info" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *firstNameField = [[alert textFields]objectAtIndex:0];
            UITextField *lastNameField = [[alert textFields]objectAtIndex:1];
            UITextField *pnField = [[alert textFields]objectAtIndex:2];
            XYContact *newContact = [XYContact initWithFirstName:firstNameField.text andLastName:lastNameField.text andPhoneNumber:pnField.text];
            [group.contacts insertObject:newContact atIndex:indexPath.row];
            [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"action cancelled");
        }];
        
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"First Name";
        }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"Last Name";
        }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"phone number";
        }];
        
        
        [alert addAction:confirmAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

#pragma mark sort
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    XYContactGroup *sourceGroup = _contacts[sourceIndexPath.section];
    XYContact *sourceContact = sourceGroup.contacts[sourceIndexPath.row];
    XYContactGroup *destinationGroup =_contacts[destinationIndexPath.section];
    
    [sourceGroup.contacts removeObject:sourceContact];
    [destinationGroup.contacts insertObject:sourceContact atIndex:destinationIndexPath.row];
    if(sourceGroup.contacts.count == 0){
        [_contacts removeObject:sourceGroup];
        [tableView reloadData];
    }
}

#pragma mark - UISearchControllerDelegate & UISearchResultsDelegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    NSString *searchString = searchController.searchBar.text;
    [self searchDataWithKeyWord:searchString];
    if(_searchController.searchResultsController){
        UINavigationController *navController = (UINavigationController *)_searchController.searchResultsController;
        XYSearchViewController *vc =(XYSearchViewController *)navController.topViewController;
        vc.searchResults = _searchResults;
        [vc.tableView reloadData];
    }
}

-(void)searchDataWithKeyWord:(NSString *)keyWord{
    _isSearching=YES;
    _searchResults=[NSMutableArray array];
    [_contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XYContactGroup *group=obj;
        [group.contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            XYContact *contact=obj;
            if ([contact.firstName.uppercaseString containsString:keyWord.uppercaseString]||[contact.lastName.uppercaseString containsString:keyWord.uppercaseString]||[contact.phoneNumber containsString:keyWord]) {
                [self->_searchResults addObject:contact];
            }
        }];
    }];
}
@end
