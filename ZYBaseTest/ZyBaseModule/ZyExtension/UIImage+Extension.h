//
//  UIImage+Extension.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 根据颜色，生成UIImage对象
 
 @param color color对象
 @return UIImage 实例对象
 */
+ (instancetype)imageWithColor:(UIColor *)color;

/**
 根据字符串，生成UIImage对象
 
 @param color color对象
 @param name string对象
 @return UIImage 实例对象
 */
+ (instancetype)imageWithColor:(UIColor *)color string:(NSString *)name;

/**
 根据字符串，生成一个背景颜色随机的UIImage对象
 
 @param name string对象
 @return UIImage 实例对象
 */
+ (instancetype)imageWithString:(NSString *)name;

/**
 把图片image对象的size 缩放到控件的实际大小
 
 @param size 控件实际尺寸
 @return 新的image对象
 */
- (instancetype)imageFitWithSize:(CGSize)size;

/**
 把图片image对象，处理成圆角
 
 @param radius 圆角半径
 @param corners 控制圆角的位置
 @param fillColor 被裁减掉区域的颜色
 @param zoomSize 缩放尺寸，应等于控件的尺寸
 @return 新的image对象
 */
- (instancetype)imageCornerWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners fillColor:(UIColor *)fillColor zoomSize:(CGSize)zoomSize;

/**
 设置图片圆角
 
 @param radius 圆角半径
 @param fillColor 被裁减掉区域的颜色
 @param zoomSize 缩放尺寸，应等于控件的尺寸
 @return 新的image对象
 */
- (instancetype)imageCornerWithRadius:(CGFloat)radius fillColor:(UIColor *)fillColor zoomSize:(CGSize)zoomSize;
@end
