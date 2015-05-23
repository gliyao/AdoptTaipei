//
//  ATAnimalListViewController.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATAnimalListViewController.h"
#import "ATAnimalViewCell.h"
#import "NSDictionary+JSON.h"
#import "ATAnimal.h"
#import "UIImageView+WebCache.h"
#import "ATAnimalDetailViewController.h"
#import "ATTinderViewController.h"
#import "ATHelloViewController.h"


@interface ATAnimalListViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) NSArray *animals;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ATAnimalListViewController

static NSString * const kATAnimalViewCell = @"ATAnimalViewCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *dict = [NSDictionary dictionaryWithJSONFile:@"data"];
    NSDictionary *result = dict[@"result"];
    NSArray *results = result[@"results"];
    NSError *e = nil;
    
    self.animals = [MTLJSONAdapter modelsOfClass:[ATAnimal class] fromJSONArray:results error:&e];
    
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.collectionView registerNib:[UINib nibWithNibName:kATAnimalViewCell bundle:nil] forCellWithReuseIdentifier:kATAnimalViewCell];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // Setup collectionViewLayout
    CGFloat padding = 6;
    NSInteger numberOfItems = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)? 3: 2;
    self.collectionView.contentInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width =	(CGRectGetWidth([UIScreen mainScreen].bounds) - (numberOfItems + 1) * padding)/numberOfItems;
    layout.itemSize = CGSizeMake(width, width+57);
    layout.minimumInteritemSpacing = padding;
    layout.minimumLineSpacing = padding;

    
    self.collectionView.collectionViewLayout = layout;
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.animals.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ATAnimalViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kATAnimalViewCell forIndexPath:indexPath];
    ATAnimal *animal = [self _animaltIndexPath:indexPath];
    
    cell.titleLabel.text = animal.name;
    cell.subTitleLabel.text = animal.age;
    [cell.animalImageView sd_setImageWithURL:[NSURL URLWithString:animal.imageUrl]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ATAnimal *animal = [self _animaltIndexPath:indexPath];
    [self performSegueWithIdentifier:@"openDetailVC" sender:animal];
}

#pragma mark - Private methods
- (ATAnimal *)_animaltIndexPath:(NSIndexPath *)indexPath
{
    //TODO: protect range when access array
    return self.animals[indexPath.row];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"openDetailVC"]){
        ATAnimalDetailViewController *mvc = segue.destinationViewController;
        mvc.animal = sender;
    }
}

#pragma mark - IBActions
- (IBAction)openSwipeVC:(id)sender
{
    ATTinderViewController *mvc = [[ATTinderViewController alloc] init];
    [self.navigationController pushViewController:mvc animated:YES];
}


@end
