//
//  AQSKeychainService.h
//  AQSUserCredentialStoreService
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LUKeychainAccess;

@interface AQSKeychainService : NSObject

# pragma mark - Instantiation
/** @name Instantiation */

/**
 *  @return Instantiated service with singleton `LUKeychainAccess` dependency.
 */
+ (instancetype)service;

/**
 *  @return Instantiated service with given dependency
 */
+ (instancetype)serviceWithLUKeychainAccessDependency:(LUKeychainAccess *)access;

# pragma mark - Setting and Getting Data
/** @name Setting and Getting Data */

/**
 *  Set given string to given key.
 *
 *  @param aString A string you want to store
 *  @param key     A key you want to store to
 */
- (void)setString:(NSString *)aString forKey:(NSString *)key;

/**
 *  Get given string from given key.
 *
 *  @param key A key you want to get value from
 *
 *  @return Obtained string
 */
- (NSString *)stringForKey:(NSString *)key;

# pragma mark - Deleting All Data
/** @name Deleting All Data */

/**
 *  Delete all values.
 */
- (void)deleteAll;

@end
