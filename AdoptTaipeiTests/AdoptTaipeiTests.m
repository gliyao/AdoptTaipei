//
//  AdoptTaipeiTests.m
//  AdoptTaipeiTests
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NSDictionary+JSON.h"
#import "ATAnimal.h"

@interface AdoptTaipeiTests : XCTestCase

@end

@implementation AdoptTaipeiTests

- (void)testExample
{
    NSDictionary *dict = [NSDictionary dictionaryWithJSONFile:@"data"];
    NSDictionary *result = dict[@"result"];
    NSArray *results = result[@"results"];
    
    XCTAssertNotNil(results);
    NSError *e = nil;
    
    NSArray *animals = [MTLJSONAdapter modelsOfClass:[ATAnimal class] fromJSONArray:results error:&e];
    XCTAssertNil(e);
    XCTAssertNotNil(animals);
    NSLog(@"%@", animals[0]);
}

@end
