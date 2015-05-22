//
//  ATAnimal.h
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface ATAnimal : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sex;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *build;
@property (strong, nonatomic) NSString *age;
@property (strong, nonatomic) NSString *variety;
@property (strong, nonatomic) NSString *reason;
@property (strong, nonatomic) NSString *acceptNum;
@property (strong, nonatomic) NSString *chipNum;
@property (strong, nonatomic) NSString *isSterilization;
@property (strong, nonatomic) NSString *hairType;
@property (strong, nonatomic) NSString *note;
@property (strong, nonatomic) NSString *resettlement;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *childreAnlong;
@property (strong, nonatomic) NSString *animalAnlong;
@property (strong, nonatomic) NSString *bodyweight;
@property (strong, nonatomic) NSString *imageName;

@end
