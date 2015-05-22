//
//  ATAnimalViewCell.h
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATAnimalViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@end
