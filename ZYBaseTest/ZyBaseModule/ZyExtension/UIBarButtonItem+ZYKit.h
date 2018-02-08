//
//  UIBarButtonItem+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZYKit)

- (instancetype)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style action:(void(^)(id sender))block;


- (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style action:(void(^)(id sender))block;

+ (instancetype)barButtonItemWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style action:(void(^)(id sender))block;

+ (instancetype)barButtonWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style action:(void(^)(id sender))block;


/**
 创建用自定义视图创建barButtonItem
 
 @param customView 自定义视图
 @param events     事件类型
 @param block      自定义视图绑定的点击事件,只在customView是继承自UIControl时生效
 
 @return instance
 */
- (instancetype)initWithCustomView:(UIView *)customView events:(UIControlEvents)events action:(void(^)(id sender))block;

/**
 创建用自定义视图创建barButtonItem
 
 @param customView 自定义视图
 @param events     事件类型
 @param block      自定义视图绑定的点击事件,只在customView是继承自UIControl时生效
 
 @return instance
 */
+ (instancetype)barButtonItemWithCustomView:(UIView *)customView events:(UIControlEvents)events action:(void(^)(id sender))block;

@end
