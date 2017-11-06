//
//  Person.m
//  HackerRankObjC
//
//  Created by anoop on 11/5/17.
//  Copyright © 2017 anoop. All rights reserved.
//

#import "Person.h"

@interface Person()

@property(nonatomic, readwrite) NSString *fullName;

@end

@implementation Person

-(NSString*) fullName{
    
    NSString* fullNameStr = [NSString stringWithFormat:@"%@%@%@", self.firstName.length > 0 ? self.firstName: @"", self.middleName.length > 0 ? [NSString stringWithFormat:@" %@",self.middleName]: @"", self.lastName.length > 0 ? [NSString stringWithFormat:@" %@",self.lastName] : @"" ];
    return [NSString stringWithFormat:@"fullName = %@", [fullNameStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
}

@end
