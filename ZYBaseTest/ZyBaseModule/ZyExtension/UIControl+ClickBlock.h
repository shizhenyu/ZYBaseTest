//
//  UIControl+ClickBlock.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ClickBlock)

/**
 addTarget的block形式
 
 @param events UIControlEvents事件
 @param block 回调block
 */
- (void)addTargetForControlEvents:(UIControlEvents )events action:(void(^)(id sender))block;

@end
