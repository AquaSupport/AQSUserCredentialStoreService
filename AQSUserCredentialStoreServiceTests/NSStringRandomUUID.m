//
//  NSStringRandomUUID.m
//  AQSUserCredentialStoreService
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NSString+RandomUUID.h"

@interface NSStringRandomUUID : XCTestCase

@end

@implementation NSStringRandomUUID

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testItIsLowercased {
    NSString *uuid = [NSString aqs_lowerAndHyphenStrippedUUID];
    
    XCTAssertTrue([uuid isEqualToString:[uuid lowercaseString]]);
}

- (void)testItDoesntIncludeHyphen {
    NSString *uuid = [NSString aqs_lowerAndHyphenStrippedUUID];
    
    XCTAssertTrue([uuid isEqualToString:[uuid stringByReplacingOccurrencesOfString:@"-" withString:@""]]);
}

- (void)testItReturnsDifferentUUID {
    NSString *a = [NSString aqs_lowerAndHyphenStrippedUUID];
    NSString *b = [NSString aqs_lowerAndHyphenStrippedUUID];
    
    XCTAssertFalse([a isEqualToString:b]);
}

- (void)testItReturns32LengthString {
    NSString *uuid = [NSString aqs_lowerAndHyphenStrippedUUID];
    
    XCTAssertEqual(uuid.length, 32);
}

@end
