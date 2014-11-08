//
//  AQSKeychainService.m
//  AQSUserCredentialStoreService
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQSKeychainService.h"

#import <LUKeychainAccess.h>

@interface AQSKeychainService ()

@property (nonatomic, strong) LUKeychainAccess* access;

@end

@implementation AQSKeychainService

# pragma mark - Inistantiation

+ (instancetype)service {
    return [self serviceWithLUKeychainAccessDependency:[LUKeychainAccess standardKeychainAccess]];
}

+ (instancetype)serviceWithLUKeychainAccessDependency:(LUKeychainAccess *)access {
    AQSKeychainService *service = [[AQSKeychainService alloc] init];
    service.access = access;
    return service;
}

# pragma mark - Setting and Getting data

- (void)setString:(NSString *)aString forKey:(NSString *)key {
    [self.access setString:aString forKey:key];
}

- (NSString *)stringForKey:(NSString *)key {
    return [self.access stringForKey:key];
}

# pragma mark - Deleting All

- (void)deleteAll {
    [self.access deleteAll];
}

@end
