//
//  AQSKeychainServiceTests.m
//  AQSUserCredentialStoreService
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "AQSKeychainService.h"

@interface AQSKeychainServiceTests : XCTestCase

@property AQSKeychainService *service;

@end

@implementation AQSKeychainServiceTests

- (void)setUp {
    [super setUp];
    
    _service = [AQSKeychainService service];
}

- (void)tearDown {
    [_service deleteAll];
    
    [super tearDown];
}

- (void)testItReturnsSetString {
    [_service setString:@"whoa" forKey:@"key"];
    
    XCTAssertTrue([[_service stringForKey:@"key"] isEqualToString:@"whoa"]);
}

- (void)testItReturnsRewriteString {
    [_service setString:@"1" forKey:@"key"];
    [_service setString:@"2" forKey:@"key"];
    
    XCTAssertTrue([[_service stringForKey:@"key"] isEqualToString:@"2"]);
}

- (void)testItReturnsStringCorrespondToGivenKey {
    [_service setString:@"1" forKey:@"1"];
    [_service setString:@"2" forKey:@"2"];
    
    XCTAssertTrue([[_service stringForKey:@"1"] isEqualToString:@"1"]);
}

- (void)testItDeleteAllKey {
    [_service setString:@"1" forKey:@"1"];
    [_service setString:@"2" forKey:@"2"];
    
    [_service deleteAll];
    
    XCTAssertNil([_service stringForKey:@"1"]);
    XCTAssertNil([_service stringForKey:@"2"]);
}

@end
