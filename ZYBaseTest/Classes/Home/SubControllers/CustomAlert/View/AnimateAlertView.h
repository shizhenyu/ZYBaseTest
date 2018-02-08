//
//  AnimateAlertView.h
//  ZYCalculator
//
//  Created by youyun on 2017/12/9.
//  Copyright © 2017年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimateAlertView : UIView

/** alertTitle */
@property (nonatomic, copy) NSString *title;

/** alertMessage */
@property (nonatomic, copy) NSString *message;

/** 弹框倒计时，不写或者为0的话默认不显示倒计时 */
@property (nonatomic, assign) CGFloat countDownTime;

/** 取消标题 */
@property (nonatomic, copy) NSString *cancelTitle;

/** 取消标题的颜色 */
@property (nonatomic, strong) UIColor *cancelTitleColor;

/** 确认的标题 */
@property (nonatomic, copy) NSString *confirmTitle;

/** 确认标题的颜色 */
@property (nonatomic, strong) UIColor *confirmTitleColor;

@property (nonatomic, copy) void(^cancelBlock)(void);

@property (nonatomic, copy) void(^confirmBlock)(void);

/**
 * 实例化初始方法
 */
+ (instancetype)shareAlertView;

/**
 * show方法
 */
- (void)show;

/**
 * hidden方法
 */
- (void)hiden;
@end
