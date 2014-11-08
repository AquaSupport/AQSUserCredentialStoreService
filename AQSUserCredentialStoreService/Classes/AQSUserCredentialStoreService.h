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

# pragma mark - Instantiation
/** @name Instantiation */

+ (instancetype)service;
+ (instancetype)serviceWithKeychainServiceDependency:(AQSKeychainService *)keychainService;

# pragma mark - User Credentials

/**
 *  At the first time, it returns randomly generated token. Since then, it returns same token.
 *
 *  **The token will not be changed even if the user uninstalled the app.**
 *  The token length is always 32 and a form of lowercased, hyphen-stripped UUID.
 *
 *  You can set the token by `- setUserToken:`
 *
 *  @return The token paired with the device. It is like `f1e2c6a55a8e4ba190072ac30b2b6739`
 */
- (NSString *)userToken;
- (void)setUserToken:(NSString *)userToken;

/**
 *  At the first time, it returns randomly generated key. Since then, it returns same key.
 *
 *  **The token will not be changed even if the user uninstalled the app.**
 *  The key length is always 128.
 *
 *  You can set the token by `- setUserSecretKey:`
 *
 *  @return The token paired with the device. It is 128 length random string.
 */
- (NSString *)userSecretKey;
- (void)setUserSecretKey:(NSString *)userSecretKey;

# pragma mark - Device Credentials

/**
 *  At the first time, it returns randomly generated token. Since then, it returns same token.
 *
 *  **The token will not be changed even if the user uninstalled the app.**
 *  The token length is always 32 and a form of lowercased, hyphen-stripped UUID.
 *
 *  @return The token paired with the device. It is like `f1e2c6a55a8e4ba190072ac30b2b6739`
 */
- (NSString *)deviceToken;

/**
 *  At the first time, it returns randomly generated key. Since then, it returns same key.
 *
 *  **The token will not be changed even if the user uninstalled the app.**
 *  The key length is always 128.
 *
 *  @return The token paired with the device. It is 128 length random string.
 */
- (NSString *)deviceSecretKey;

@end
