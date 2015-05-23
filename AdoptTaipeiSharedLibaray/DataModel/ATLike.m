//
//  ATLike.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/23.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATLike.h"

@implementation ATLike
@dynamic userId;
@dynamic animalId;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return NSStringFromClass([self class]);
}

+ (void)likeAnimalInBackgroud:(NSString *)animalId
{
    ATLike *like = [ATLike object];
    like.animalId = animalId;
    like.userId = [PFUser currentUser].objectId;
    [like saveInBackground];
}

@end
