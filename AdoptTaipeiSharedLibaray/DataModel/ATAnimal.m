//
//  ATAnimal.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATAnimal.h"

#import "MTLValueTransformer.h"

@implementation ATAnimal

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"Id":@"_id",
             @"name":@"Name",
             @"sex":@"Sex",
             @"type":@"Type",
             @"build":@"Build",
             @"age":@"Age",
             @"variety":@"Variety",
             @"reason":@"Reason",
             @"acceptNum":@"AcceptNum",
             @"chipNum":@"ChipNum",
             @"isSterilization":@"IsSterilization",
             @"hairType":@"HairType",
             @"note":@"Note",
             @"resettlement":@"Resettlement",
             @"phone":@"Phone",
             @"email":@"Email",
             @"canChildreAnlong":@"ChildreAnlong",
             @"canAnimalAnlong":@"AnimalAnlong",
             @"wieght":@"Bodyweight",
             @"imageUrl":@"ImageName",
         };
}

+ (NSValueTransformer *)typeJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError **error) {
        if([value isEqualToString:@"犬"]){
            return @(ATAnimalTypeDog);
        }
        if([value isEqualToString:@"貓"]){
            return @(ATAnimalTypeCat);
        }
        return @(ATAnimalTypeOther);
    }];
};

+ (NSValueTransformer *)sexJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError **error) {
        return @([value isEqualToString:@"雄"]);
    }];
};

+ (NSValueTransformer *)isSterilizationJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError **error) {
        return @([value isEqualToString:@"已絕育"]);
    }];
};


@end
