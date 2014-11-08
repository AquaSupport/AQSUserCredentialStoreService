//
//  AQSUserCredentialStoreService.h
//  AQSUserCredentialStoreService
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AQSKeychainService;

@interface AQSUserCredentialStoreService : NSObject

+ (instancetype)service;
+ (instancetype)serviceWithKeychainServiceDependency:(AQSKeychainService *)keychainService;

/// Returns generated user token.
- (NSString *)userToken;
- (void)setUserToken:(NSString *)userToken;
- (NSString *)userSecretKey;
- (void)setUserSecretKey:(NSString *)userSecretKey

/// Returns generated device token.
- (NSString *)deviceToken;
- (NSString *)deviceSecretKey;

@end
