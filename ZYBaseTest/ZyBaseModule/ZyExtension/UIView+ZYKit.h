//
//  UIView+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZYKit)


/**
 加载xib视图，xib命名必须和视图命名保持一致
 
 @return 视图的实例对象
 */
+ (instancetype)loadFromXib;


/**
 获取最贴合控件的尺寸
 
 @param maxWidth 最大宽度
 @return 完美尺寸
 */
- (CGSize)sizeFitsWithMaxWidth:(CGFloat)maxWidth;

/**
 获取最贴合控件的尺寸
 
 @param maxHeight 最大高度
 @return 完美尺寸
 */
- (CGSize)sizeFitsWithMaxHeight:(CGFloat)maxHeight;

/**
 获取当前View的快照，并生成一个UIImage对象
 
 @return UIImage对象
 */
- (UIImage *)snapshortCurrentView;

@end
