//
//  UIButton+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZYKit)

+ (instancetype)buttonWithTitle:(NSString *)title
                          image:(NSString *)imageName
                     titleColor:(UIColor *)titleColor
                  titleFontSize:(CGFloat)fontSize
                       forState:(UIControlState)state
                     stateImage:(NSString *)stateImageName
                stateTitleColor:(UIColor *)stateTitleColor;

+ (instancetype)textButtonWithTitle:(NSString *)title
                           fontSize:(CGFloat)fontSize
                         titleColor:(UIColor *)titleColor
                    backgroundImage:(UIImage *)backgroundImageName
                           forState:(UIControlState)state
                    stateTitleColor:(UIColor *)stateTitleColor;

+ (instancetype)imageButtonWithImage:(NSString *)imageName
                     backgroundImage:(NSString *)backgroundImageName
                            forState:(UIControlState)state
                          stateImage:(NSString *)stateImageName;

@end
