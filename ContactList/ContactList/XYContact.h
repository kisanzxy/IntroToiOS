//
//  XYContact.h
//  ContactList
//
//  Created by zhangxuyang on 2019/5/21.
//  Copyright © 2019 zhangxuyang. All rights reserved.
//

#ifndef XYContact_h
#define XYContact_h


#endif /* XYContact_h */
#import <Foundation/Foundation.h>

@interface XYContact : NSObject

#pragma mark Lastname
@property (nonatomic, copy) NSString *lastName;
#pragma mark Firstname
@property (nonatomic, copy) NSString *firstName;
#pragma mark phoneNumber
@property (nonatomic, copy) NSString *phoneNumber;

#pragma mark constructorWithParam
- (XYContact *)initWithFirstName: (NSString *)firstName andLastName: (NSString *)lastName andPhoneNumber: (NSString *)phoneNumber;


#pragma mark getContactName
- (NSString *)getName;

#pragma mark staticConstructorWithParam
+ (XYContact *)initWithFirstName: (NSString *)firstName andLastName: (NSString *)lastName andPhoneNumber: (NSString *)phoneNumber;


@end
