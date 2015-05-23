//
//  ATHelloViewController.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/23.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "ATHelloViewController.h"
#import "UIImageView+WebCache.h"

@interface ATHelloViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;
@property (weak, nonatomic) IBOutlet UILabel *wordsLabel;
@end

@implementation ATHelloViewController

- (instancetype)init
{
    return [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissAction:)];
    self.wordsLabel.text = self.words;
    [self.animalImageView sd_setImageWithURL:[NSURL URLWithString:self.imageURL]];
}

- (IBAction)dismissAction:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
