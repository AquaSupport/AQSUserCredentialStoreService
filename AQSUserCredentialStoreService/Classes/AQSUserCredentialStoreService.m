//
//  AQSUserCredentialStoreService.m
//  AQSUserCredentialStoreService
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQSUserCredentialStoreService.h"

#import "AQSKeychainService.h"
#import <AQMSecureRandom.h>
#import "NSString+RandomUUID.h"

NSString *const kAQSUserCredentialStoreServiceUserTokenKey = @"AQSUserCredentialStoreServiceUserToken";
NSString *const kAQSUserCredentialStoreServiceUserSecretKeyKey = @"AQSUserCredentialStoreServiceUserSecretKey";
NSString *const kAQSUserCredentialStoreServiceDeviceTokenKey = @"AQSUserCredentialStoreServiceDeviceToken";
NSString *const kAQSUserCredentialStoreServiceDeviceSecretKeyKey = @"AQSUserCredentialStoreServiceDeviceSecretKey";
int const kAQSUserCredentialStoreServiceSecretKeyLength = 128;

@interface AQSUserCredentialStoreService ()

//{@dependencies
@property (nonatomic, strong) AQSKeychainService *keychainService;
//}

@end

@implementation AQSUserCredentialStoreService

+ (instancetype)service {
    return [self serviceWithKeychainServiceDependency:[AQSKeychainService service]];
}

+ (instancetype)serviceWithKeychainServiceDependency:(AQSKeychainService *)keychainService {
    AQSUserCredentialStoreService *service = [[AQSUserCredentialStoreService alloc] init];
    service.keychainService = keychainService;
    return service;
}

# pragma mark - User Credentials

- (NSString *)userToken {
    NSString *userToken = [_keychainService stringForKey:kAQSUserCredentialStoreServiceUserTokenKey];
    if (userToken == nil) {
        userToken = [NSString aqs_lowerAndHyphenStrippedUUID];
        [_keychainService setString:userToken forKey:kAQSUserCredentialStoreServiceUserTokenKey];
    }
    return userToken;
}

- (void)setUserToken:(NSString *)userToken {
    [_keychainService setString:userToken forKey:kAQSUserCredentialStoreServiceUserTokenKey];
}

- (NSString *)userSecretKey {
    NSString *userSecretKey = [_keychainService stringForKey:kAQSUserCredentialStoreServiceUserSecretKeyKey];
    if (userSecretKey == nil) {
        userSecretKey = [self helper_secretKey];
        [_keychainService setString:userSecretKey forKey:kAQSUserCredentialStoreServiceUserSecretKeyKey];
    }
    return userSecretKey;
}

- (void)setUserSecretKey:(NSString *)userSecretKey {
    [_keychainService setString:userSecretKey forKey:kAQSUserCredentialStoreServiceUserSecretKeyKey];
}

# pragma mark - Device Credentials

- (NSString *)deviceToken {
    NSString *deviceToken = [_keychainService stringForKey:kAQSUserCredentialStoreServiceDeviceTokenKey];
    if (deviceToken == nil) {
        deviceToken = [NSString aqs_lowerAndHyphenStrippedUUID];
        [_keychainService setString:deviceToken forKey:kAQSUserCredentialStoreServiceDeviceTokenKey];
    }
    return deviceToken;
}

- (NSString *)deviceSecretKey {
    NSString *deviceSecretKey = [_keychainService stringForKey:kAQSUserCredentialStoreServiceDeviceSecretKeyKey];
    if (deviceSecretKey == nil) {
        deviceSecretKey = [self helper_secretKey];
        [_keychainService setString:deviceSecretKey forKey:kAQSUserCredentialStoreServiceDeviceSecretKeyKey];
    }
    return deviceSecretKey;
}

# pragma mark - Helpers (Secret Key)

- (NSString *)helper_secretKey {
    return [AQMSecureRandom randomString:kAQSUserCredentialStoreServiceSecretKeyLength];
}

@end
