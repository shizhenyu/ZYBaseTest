//
//  UIViewController+Storyboard.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (__kindof UIViewController *)loadViewControllerFromStory {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass(self) bundle:nil];
    
    if (storyboard) {
        
        UIViewController *viewController = [storyboard instantiateInitialViewController];
        
        return viewController;
    }
    return nil;
}

@end
