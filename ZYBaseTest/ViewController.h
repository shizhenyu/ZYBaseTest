//
//  ViewController.h
//  ZYBaseTest
//
//  Created by youyun on 2018/2/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/**
 进入主界面
 */
- (void)Action_toRootViewController;

/**
 进入tabBar 界面
 */
- (void)Action_toLoginViewController;

/**
 通过3D Touch进去的界面

 @param viewControllerIdentifier 目标界面的identifier
 */
- (void)Action_toPressTouchController:(NSString *)viewControllerIdentifier;

@end

