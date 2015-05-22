//
//  ATAnimalViewCell.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATAnimalViewCell.h"

@implementation ATAnimalViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.masksToBounds = YES;
}

@end
