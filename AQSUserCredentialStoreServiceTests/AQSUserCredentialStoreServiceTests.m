//
//  AQSUserCredentialStoreServiceTests.m
//  AQSUserCredentialStoreServiceTests
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "AQSUserCredentialStoreService.h"

@interface AQSUserCredentialStoreServiceTests : XCTestCase

@property AQSUserCredentialStoreService *service;

@end

@implementation AQSUserCredentialStoreServiceTests

- (void)setUp {
    [super setUp];
    
    _service = [AQSUserCredentialStoreService service];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testItReturnsLowercaseHyphenStrippedUUIDForUserToken {
    NSString *uuid = [_service userToken];
    XCTAssertTrue([uuid isEqualToString:[uuid lowercaseString]]);
    XCTAssertTrue([uuid isEqualToString:[uuid stringByReplacingOccurrencesOfString:@"-" withString:@""]]);
    XCTAssertEqual(uuid.length, 32);
}

- (void)testItReturnsSameUserToken {
    NSString *a = [_service userToken];
    NSString *b = [_service userToken];
    
    XCTAssertTrue([a isEqualToString:b]);
}

- (void)testItReturns128LengthUserSecretKey {
    NSString *secret = [_service userSecretKey];
    
    XCTAssertEqual(secret.length, 128);
}

- (void)testItReturnsSameUserSecretKey {
    NSString *a = [_service userSecretKey];
    NSString *b = [_service userSecretKey];
    
    XCTAssertTrue([a isEqualToString:b]);
}

- (void)testItReturnsSetUserToken {
    [_service setUserToken:@"token"];
    
    XCTAssertTrue([[_service userToken] isEqualToString:@"token"]);
}

- (void)testItReturnsSetUserSecretKey {
    [_service setUserSecretKey:@"key"];
    
    XCTAssertTrue([[_service userSecretKey] isEqualToString:@"key"]);
}

- (void)testItReturnsLowercasedHyphenStrippedDeviceToken {
    NSString *uuid = [_service deviceToken];
    XCTAssertTrue([uuid isEqualToString:[uuid lowercaseString]]);
    XCTAssertTrue([uuid isEqualToString:[uuid stringByReplacingOccurrencesOfString:@"-" withString:@""]]);
    XCTAssertEqual(uuid.length, 32);
}

- (void)testItReturnsSameDeviceToken {
    NSString *a = [_service deviceToken];
    NSString *b = [_service deviceToken];
    
    XCTAssertTrue([a isEqualToString:b]);
}

- (void)testItReturns128LengthDeviceSecretKey {
    NSString *key = [_service deviceSecretKey];
    
    XCTAssertEqual(key.length, 128);
}

- (void)testItReturnsSameDeviceSecretKey {
    NSString *a = [_service deviceSecretKey];
    NSString *b = [_service deviceSecretKey];
    
    XCTAssertTrue([a isEqualToString:b]);
}

@end
