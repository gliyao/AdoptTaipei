//
//  NSDictionary+JSON.h
//  Rewards
//
//  Created by Arun on 12/12/13.
//  Copyright (c) 2013 Mobiquest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

+ (NSDictionary *)dictionaryWithJSONFile:(NSString *)fileName;

-(NSString*)jsonString;

@end
