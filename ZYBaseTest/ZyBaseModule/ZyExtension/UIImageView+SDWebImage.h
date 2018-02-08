//
//  UIImageView+SDWebImage.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SDWebImage)

/**
 在SDWebImage的基础上添加了淡出淡入的动画，并将图片缩放到控件尺寸
 
 @param url 图片链接
 @param placeholder 占位图
 */
- (void)zy_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

/**
 在SDWebImage的基础上添加了淡出淡入的动画，并将图片缩放到控件尺寸,设置图片圆角
 
 @param url 图片链接
 @param placeholder 占位图
 @param radius 圆角半径
 */
- (void)zy_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder cornerRadius:(CGFloat)radius;

@end
