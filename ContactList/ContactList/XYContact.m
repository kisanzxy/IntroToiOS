//
//  XYContact.m
//  ContactList
//
//  Created by zhangxuyang on 2019/5/21.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#import "XYContact.h"
#import <Foundation/Foundation.h>

@implementation XYContact

- (XYContact *)initWithFirstName: (NSString *)firstName andLastName: (NSString *)lastName andPhoneNumber: (NSString *)phoneNumber{
    
    if(self = [super init]){
        self.firstName = firstName;
        self.lastName =lastName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

- (NSString *)getName{
    return [NSString stringWithFormat:@"%@ %@", _lastName, _firstName];
}


+ (XYContact *)initWithFirstName: (NSString *)firstName andLastName: (NSString *)lastName andPhoneNumber: (NSString *)phoneNumber{
    XYContact *contactl = [[XYContact alloc]initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    return contactl;
}

@end


