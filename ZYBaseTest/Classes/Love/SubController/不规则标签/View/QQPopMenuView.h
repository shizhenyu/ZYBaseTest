//
//  QQPopMenuView.h
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QQPopMenuView : UIView

@property (nonatomic, copy) void(^hideHandle)(void);

/**
 实例化 初始化方法

 @param array items，包含字典 里面字典格式@{@"icon":@"", @"title":@""}
 @param width 宽度
 @param point 三角的顶角坐标（基于window）
 @param action 点击回调
 @return QQPopMenuView的实例对象
 */
- (instancetype)initWithItems:(NSArray <NSDictionary *>*)array
                        width:(CGFloat)width trianglePoint:(CGPoint)point
                       action:(void (^)(NSInteger index))action;


/**
 类 初始化方法

 @param array items，包含字典 里面字典格式@{@"icon":@"", @"title":@""}
 @param width 宽度
 @param point 三角的顶角坐标（基于window）
 @param action 点击回调
 */
+ (void)initWithItems:(NSArray <NSDictionary *>*)array
                width:(CGFloat)width trianglePoint:(CGPoint)point
               action:(void (^)(NSInteger index))action;


/**
 show 方法
 */
- (void)show;


/**
 hide方法
 */
- (void)hide;

@end
