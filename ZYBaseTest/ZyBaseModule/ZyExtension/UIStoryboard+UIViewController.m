//
//  UIStoryboard+UIViewController.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UIStoryboard+UIViewController.h"

@implementation UIStoryboard (UIViewController)

+ (__kindof UIViewController *)loadViewController {
    
    UIStoryboard *storyboard = [self storyboardWithName:NSStringFromClass(self) bundle:nil];
    
    if (storyboard) {
        
        UIViewController *viewController = [storyboard instantiateInitialViewController];
        
        return viewController;
    }
    return nil;
}

@end
