//
//  CustomPresentAnimation.m
//  transtion
//
//  Created by account on 15/7/23.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "CustomPresentAnimation.h"
#import "PresentedViewController.h"

@implementation CustomPresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //使用transitionContext可以得到参与切换的两个ViewController的信息
    UIViewController *toVC= [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //将控制器视图初始位置设置到屏幕下边缘，从而从屏幕下方出现
    CGRect finalRect=[transitionContext finalFrameForViewController:toVC];
    toVC.view.frame=CGRectOffset(finalRect, 0, [[UIScreen mainScreen] bounds].size.height);
    
    //所有的动画视图都必须放在transitionContext的containerView里
    [[transitionContext containerView] addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toVC.view.frame=finalRect;
    } completion:^(BOOL finished) {
        //动画完成或者取消之后必须得调用的方法，系统接收到这个消息后将对控制器的状态进行维护
        [transitionContext completeTransition:YES];
    }];
}
@end
