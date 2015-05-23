//
//  ATAnimal.h
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"


typedef NS_ENUM(NSInteger, ATAnimalType) {
    ATAnimalTypeDog = 0,
    ATAnimalTypeCat = 1,
    ATAnimalTypeOther = 2,
};

typedef NS_ENUM(NSInteger, ATReasonType) {
    ATReasonTypeNone = 0,
    ATReasonType1 = 1, //動物救援
    ATReasonType2 = 2, //"民眾不擬續養"
    ATReasonType3 = 3 //"民眾拾獲"
};

@interface ATAnimal : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sex; // 性別
@property (strong, nonatomic) NSString *type; // 動物種類
@property (strong, nonatomic) NSString *build; // 體型
@property (strong, nonatomic) NSString *age; // 年齡
@property (strong, nonatomic) NSString *variety; // 品種
@property (strong, nonatomic) NSString *reason; // 收容原因
@property (strong, nonatomic) NSString *acceptNum; // 收容編號
@property (strong, nonatomic) NSString *chipNum; // 晶片號碼
@property (strong, nonatomic) NSString *isSterilization; // 是否絕育
@property (strong, nonatomic) NSString *hairType; //毛色
@property (strong, nonatomic) NSString *note; //描述
@property (strong, nonatomic) NSString *resettlement; //位置
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *canChildreAnlong; // 可否與其他孩童相處
@property (strong, nonatomic) NSString *canAnimalAnlong; // 可否與其他動物相處
@property (strong, nonatomic) NSString *wieght; // 體重
@property (strong, nonatomic) NSString *imageUrl; // 照片

//@property (strong, nonatomic) NSString *Id;
//@property (strong, nonatomic) NSString *name;
//@property (assign, nonatomic) BOOL sex; // 性別
//@property (assign, nonatomic) ATAnimalType type; // 動物種類
//@property (strong, nonatomic) NSString *build; // 體型
//@property (strong, nonatomic) NSString *age; // 年齡
//@property (strong, nonatomic) NSString *variety; // 品種
//@property (strong, nonatomic) NSString *reason; // 收容原因
//@property (strong, nonatomic) NSString *acceptNum; // 收容編號
//@property (strong, nonatomic) NSString *chipNum; // 晶片號碼
//@property (assign, nonatomic) BOOL isSterilization; // 是否絕育
//@property (strong, nonatomic) NSString *hairType; //毛色
//@property (strong, nonatomic) NSString *note; //描述
//@property (strong, nonatomic) NSString *resettlement; //位置
//@property (strong, nonatomic) NSString *phone;
//@property (strong, nonatomic) NSString *email;
//@property (strong, nonatomic) NSString *canChildreAnlong; // 可否與其他孩童相處
//@property (strong, nonatomic) NSString *canAnimalAnlong; // 可否與其他動物相處
//@property (strong, nonatomic) NSString *wieght; // 體重
//@property (strong, nonatomic) NSString *imageUrl; // 照片


@end
