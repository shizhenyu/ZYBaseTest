//
//  ZYPopAnimation.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/26.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ZYPopAnimation.h"

@interface ZYPopAnimation ()

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation ZYPopAnimation

// 这个方法返回动画执行时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.25;
}

// transitionContext可以看作是一个工具，用来获取一系列动画执行相关的对象，并且通知系统动画是否完成等功能。
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 获取动画来自哪个控制器
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 获取转场到哪个控制器
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 转场动画是两个控制器视图之间的动画，需要一个containerView来作为一个“舞台”， 让动画执行
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // 执行动画，让fromVC的视图移动到屏幕最右侧
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        fromViewController.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        
    } completion:^(BOOL finished) {
       
        // 动画执行完成，这个方法必须要调用，否则系统会认为你的其余任何操作都在动画执行过程中
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
}

@end
