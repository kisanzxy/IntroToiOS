//
//  XYContactGroup.h
//  ContactList
//
//  Created by zhangxuyang on 2019/5/21.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#ifndef XYContactGroup_h
#define XYContactGroup_h


#endif /* XYContactGroup_h */

#import <Foundation/Foundation.h>
#import "XYContact.h"

@interface XYContactGroup : NSObject

#pragma mark groupName
@property (nonatomic, copy) NSString *name;
#pragma mark detail
@property (nonatomic, copy) NSString *detail;
#pragma mark contacts
@property (nonatomic, strong) NSMutableArray *contacts;

#pragma mark constructorWithParam
-(XYContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

#pragma mark staticConstructorWithParam
+(XYContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;
@end
