
//
//  NSString+RandomUUID.m
//  AQSUserCredentialStoreService
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "NSString+RandomUUID.h"

@implementation NSString (RandomUUID)

+ (NSString *)aqs_lowerAndHyphenStrippedUUID {
    return [[[[NSUUID UUID] UUIDString] lowercaseString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

@end
