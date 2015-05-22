//
//  ATAnimalDetailViewController.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/23.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATAnimalDetailViewController.h"

@interface ATAnimalDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ATAnimalDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = self.animal.name;
}

@end
