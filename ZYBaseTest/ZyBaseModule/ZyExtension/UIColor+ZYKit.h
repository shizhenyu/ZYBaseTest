//
//  UIColor+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZYKit)

/**
 根据给定Hex生成指定的颜色
 
 @param hex hex值
 @return UIColor对象
 */
+ (instancetype)zy_colorWithHex:(uint32_t)hex;

/**
 随机颜色
 
 @return 生成的的随机颜色
 */
+ (instancetype)zy_randomColor;

/**
 根据RGB值生成颜色
 
 @param red R
 @param green G
 @param blue B
 @return x hex值
 @return UIColor对象
 */
+ (instancetype)zy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

@end
