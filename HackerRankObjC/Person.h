//
//  Person.h
//  HackerRankObjC
//
//  Created by anoop on 11/5/17.
//  Copyright © 2017 anoop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(strong) NSString *firstName;
@property(strong) NSString *middleName;

@property(strong) NSString *lastName;
@property(readonly) NSString *fullName;

@end
