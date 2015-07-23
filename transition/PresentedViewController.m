//
//  PresentedViewController.m
//  transtion
//
//  Created by account on 15/7/23.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "PresentedViewController.h"
#import "CustomPresentAnimation.h"

@interface PresentedViewController () <UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) CustomPresentAnimation *presentAnimation;
@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate=self;
    self.presentAnimation=[[CustomPresentAnimation alloc] init];
}

- (IBAction)clickDismmissButton:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"clickDismmissButton");
    }];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}
@end
