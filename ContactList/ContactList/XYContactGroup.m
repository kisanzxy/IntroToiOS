//
//  XYContactGroup.m
//  ContactList
//
//  Created by zhangxuyang on 2019/5/21.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import "XYContactGroup.h"

@implementation XYContactGroup

-(XYContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    
    if(self = [super init]){
        self.name = name;
        self.detail = detail;
        self.contacts = [contacts mutableCopy];
    }
    return self;
}

#pragma mark staticConstructorWithParam
+(XYContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    XYContactGroup *groupl = [[XYContactGroup alloc]initWithName:name andDetail:detail andContacts:contacts];
    return groupl;
}

@end
