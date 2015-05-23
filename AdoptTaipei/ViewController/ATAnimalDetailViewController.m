//
//  ATAnimalDetailViewController.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/23.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATAnimalDetailViewController.h"
#import "UIImageView+WebCache.h"

@interface ATAnimalDetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *imageContainer;
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;

@property (weak, nonatomic) IBOutlet UIView *basicContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *basicContainerHeight;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *acceptNumLable;
@property (weak, nonatomic) IBOutlet UILabel *varietyLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@property (weak, nonatomic) IBOutlet UIView *otherContainer;
@property (weak, nonatomic) IBOutlet UILabel *chipNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *buildLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *hairTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *isSterilizationLabel;
@property (weak, nonatomic) IBOutlet UILabel *childreAnlonLabel;
@property (weak, nonatomic) IBOutlet UILabel *animalAnlonLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyweighLabel;

@property (weak, nonatomic) IBOutlet UIView *adoptContainer;
@property (weak, nonatomic) IBOutlet UILabel *resettIementLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@property (weak, nonatomic) IBOutlet UIButton *adoptButton;

@end

@implementation ATAnimalDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _configAnimal:self.animal];
}

- (void)_configAnimal:(ATAnimal *)animal
{
    self.title = animal.name;
    UIColor *bgColor = [UIColor lightGrayColor];
    self.view.backgroundColor = bgColor;
    self.scrollView.backgroundColor = bgColor;
    self.contentView.backgroundColor = bgColor;
    
    [self _setupCardView:self.basicContainer];
    [self _setupCardView:self.otherContainer];
    [self _setupCardView:self.adoptContainer];
    
    [self.animalImageView sd_setImageWithURL:[NSURL URLWithString:animal.imageUrl]];
    self.nameLabel.text = animal.name;
    self.acceptNumLable.text = animal.acceptNum;
    self.varietyLabel.text = animal.variety;
    self.noteLabel.text = animal.note;

    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat originLabelHeight = CGRectGetHeight(self.noteLabel.frame);
    CGSize size = [self.noteLabel sizeThatFits:CGSizeMake(width - 40, CGFLOAT_MAX)];
    CGFloat deltaHeight = size.height - originLabelHeight;
    
    self.basicContainerHeight.constant = self.basicContainerHeight.constant + deltaHeight;
    
    self.chipNumberLabel.text = animal.chipNum;
    self.buildLabel.text = animal.build;
    self.ageLabel.text = animal.age;
    self.sexLabel.text = animal.sex;
    self.typeLabel.text = animal.type;
    self.hairTypeLabel.text = animal.hairType;
    self.isSterilizationLabel.text = animal.isSterilization;
    self.childreAnlonLabel.text = animal.canAnimalAnlong;
    self.animalAnlonLabel.text = animal.canAnimalAnlong;
    self.bodyweighLabel.text = animal.wieght;


    self.resettIementLabel.text = animal.resettlement;
    self.phoneLabel.text = animal.phone;
    self.emailLabel.text = animal.email;
    
    self.adoptButton.clipsToBounds = YES;
    self.adoptButton.layer.cornerRadius = 4;
    self.adoptButton.backgroundColor = [UIColor colorWithRed:255/255 green:49/255 blue:70/255 alpha:0.79];
}

- (void)_setupCardView:(UIView *)view
{
    [self setView:view borderColor:[UIColor colorWithWhite:0 alpha:0.1] borderWidth:1 cornerRadius:4];
}

- (void)setView:(UIView *)view borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius
{
    view.layer.borderColor = borderColor.CGColor;
    view.layer.borderWidth = borderWidth;
    view.layer.cornerRadius = cornerRadius;
    view.clipsToBounds = YES;
}

@end
