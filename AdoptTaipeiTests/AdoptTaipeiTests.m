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
#import "ATParse.h"
#import "ATLike.h"

@interface AdoptTaipeiTests : XCTestCase

@end

@implementation AdoptTaipeiTests

- (void)testATAnimalInit
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

- (void)testATParseInit
{
    NSDictionary *dict = [NSDictionary dictionaryWithJSONFile:@"devConfig"];
    NSError *e = nil;
    ATParse *parse = [[ATParse alloc] initWithDictionary:dict error:&e];
    
    XCTAssertNil(e);
    XCTAssertNotNil(parse);
    XCTAssertNotNil(parse.applicationId);
    XCTAssertNotNil(parse.clientKey);
}

- (void)testATLikeInit
{
    ATLike *like = [ATLike object];
    like.userId = @"TestId";
    like.animalId = @"ABC";

    XCTestExpectation *exp = [self expectationWithDescription:@"API timeout"];
    [like saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Saved.");
        } else {
            NSLog(@"%@", error);
        }
        [exp fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

@end
