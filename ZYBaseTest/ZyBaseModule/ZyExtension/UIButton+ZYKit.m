//
//  UIButton+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UIButton+ZYKit.h"

@implementation UIButton (ZYKit)

+ (instancetype)buttonWithTitle:(NSString *)title
                          image:(NSString *)imageName
                     titleColor:(UIColor *)titleColor
                  titleFontSize:(CGFloat)fontSize
                       forState:(UIControlState)state
                     stateImage:(NSString *)stateImageName
                stateTitleColor:(UIColor *)stateTitleColor {
    
    UIButton *btn = [[UIButton alloc]init];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    [btn setTitleColor:stateTitleColor forState:state];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:stateImageName] forState:state];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [btn sizeToFit];
    
    return btn;
}

+ (instancetype)textButtonWithTitle:(NSString *)title
                           fontSize:(CGFloat)fontSize
                         titleColor:(UIColor *)titleColor
                    backgroundImage:(UIImage *)backgroundImageName
                           forState:(UIControlState)state
                    stateTitleColor:(UIColor *)stateTitleColor {
    
    UIButton *btn = [[UIButton alloc]init];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (state) {
        [btn setTitleColor:stateTitleColor forState:state];
    }
    
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [btn setBackgroundImage:backgroundImageName forState:UIControlStateNormal];
    
    [btn sizeToFit];
    
    return btn;
}

+ (instancetype)imageButtonWithImage:(NSString *)imageName
                     backgroundImage:(NSString *)backgroundImageName
                            forState:(UIControlState)state
                          stateImage:(NSString *)stateImageName {
    
    UIButton *btn = [[UIButton alloc]init];
    
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (backgroundImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    }
    
    if (stateImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    }
    
    [btn sizeToFit];
    
    return btn;
}

@end
