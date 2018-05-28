//
//  ZYNavigationInteractiveTransition.h
//  ZYBaseTest
//
//  Created by youyun on 2018/5/26.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class UIViewController, UIPercentDrivenInteractiveTransition;
@interface ZYNavigationInteractiveTransition : NSObject<UINavigationControllerDelegate>

- (instancetype)initWithViewController:(UIViewController *)vc;

- (void)handleControllerPop:(UIPanGestureRecognizer *)recognizer;

- (UIPercentDrivenInteractiveTransition *)interactivePopTransition;

@end
