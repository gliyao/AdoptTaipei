//
//  ATAnimal.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATAnimal.h"

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

@end
