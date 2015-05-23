//
//  ATSwipeToChooseViewController.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/23.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATTinderViewController.h"
#import "MDCSwipeToChoose.h"
#import "ATAnimal.h"
#import "UIImage+WebP.h"
#import "UIImageView+WebCache.h"
#import "ATLike.h"

static CGFloat const kPadding = 8;
static CGFloat const k2Padding = 16;
static CGFloat const kNaviBarHeight = 64;

@interface ATTinderViewController () <MDCSwipeToChooseDelegate>
@property (strong, nonatomic) ATAnimal *animal;
@property (strong, nonatomic) MDCSwipeToChooseView *cardView;
@property (assign, nonatomic) CGRect cardFrame;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) NSMutableArray *likes;
@end

@implementation ATTinderViewController

- (instancetype)init
{
    return 	[self initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        NSDictionary *dict = [NSDictionary dictionaryWithJSONFile:@"data"];
        NSDictionary *result = dict[@"result"];
        NSArray *results = result[@"results"];
        NSError *e = nil;
        
        self.animals = [MTLJSONAdapter modelsOfClass:[ATAnimal class] fromJSONArray:results error:&e];
        //TODO: random animal
        self.likes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.title = @"Choose";
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    self.cardFrame = CGRectMake(kPadding, kNaviBarHeight + kPadding, CGRectGetWidth(screenBounds) - k2Padding, CGRectGetWidth(screenBounds) - k2Padding);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _nextCard];
}

- (void)_nextCard
{
    int r = arc4random_uniform((int)self.animals.count);
    ATAnimal *animal = self.animals[r];
    [self _newCardWithAnimal:animal];
    self.animal = animal;
}

- (void)_newCardWithAnimal:(ATAnimal *)animal
{
    // You can customize MDCSwipeToChooseView using MDCSwipeToChooseViewOptions.
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Keep";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"Delete";
    options.onPan = ^(MDCPanState *state){
//        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
//            NSLog(@"Let go now to delete the photo!");
//        }
    };
    
    self.cardView = [[MDCSwipeToChooseView alloc] initWithFrame:self.cardFrame options:options];
    [self.cardView.imageView sd_setImageWithURL:[NSURL URLWithString:animal.imageUrl]];
    [self.view addSubview:self.cardView];
}

#pragma mark - <MDCSwipeToChooseDelegate>
// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view
{
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction
{
    return YES;
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction
{
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"NO");
    } else {
        NSLog(@"YES");
        [ATLike likeAnimalInBackgroud:self.animal.Id];
    }
    [self _nextCard];
}

#pragma mark - IBAtions
- (IBAction)yesAction:(id)sender
{
    [self.cardView mdc_swipe:MDCSwipeDirectionRight];
}

- (IBAction)noAction:(id)sender
{
    [self.cardView mdc_swipe:MDCSwipeDirectionLeft];
}

@end
