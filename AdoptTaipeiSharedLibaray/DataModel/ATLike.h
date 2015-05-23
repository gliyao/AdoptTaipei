//
//  ATLike.h
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/23.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import <Parse/Parse.h>

@interface ATLike : PFObject<PFSubclassing>
+ (NSString *)parseClassName;
@property (retain) NSString *userId;
@property (retain) NSString *animalId;

+ (void)likeAnimalInBackgroud:(NSString *)animalId;
@end
