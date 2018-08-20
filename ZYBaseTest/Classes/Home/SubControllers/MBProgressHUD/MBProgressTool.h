//
//  MBProgressTool.h
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBProgressTool : NSObject

+ (nonnull instancetype)sharedMBTool;

/**
 在指定视图上展示加载视图

 @param message 加载中的文字
 @param view 添加到的父视图
 */
- (void)showProcessingMessage:(nonnull NSString *)message showInView:(nonnull UIView *)view;

/**
 在指定视图上展示"自定义加载图片"的加载视图

 @param message 加载中的文字
 @param view 添加到的父视图
 */
- (void)showProcessingWithCustomIndicatorImageAndMessage:(nonnull NSString *)message showInView:(nonnull UIView *)view;

/**
 在指定视图上展示警告视图
 
 @param message 警告的文字
 @param view 添加到的父视图
 */
- (void)showWarningMessage:(nonnull NSString *)message showInView:(nonnull UIView *)view;

/**
 在指定视图上展示错误视图
 
 @param message 错误的文字
 @param view 添加到的父视图
 */
- (void)showErrorMessage:(nonnull NSString *)message showInView:(nonnull UIView *)view;

/**
 在指定视图上展示完成视图
 
 @param message 完成的文字
 @param view 添加到的父视图
 */
- (void)showOkMessage:(nonnull NSString *)message showInView:(nonnull UIView *)view;

/**
 在指定视图底部展示提示文字

 @param message 提示文字
 @param view 添加到的父视图
 */
- (void)showMessageAboveViewBottom:(nonnull NSString *)message showInView:(nullable UIView *)view;

/**
 在指定视图中间展示提示文字
 
 @param message 提示文字
 @param view 添加到的父视图
 */
- (void)showMessageInViewMiddle:(nonnull NSString *)message showInView:(nullable UIView *)view;

/**
 全屏展示加载视图

 @param message 加载提示文字
 */
- (void)showProcessingMessageInWindow:(nullable NSString *)message;

/**
 全屏展示“自定义加载图片”的加载视图

 @param message 加载提示文字
 */
- (void)showProcessingWithCustomIndicatorImageInWindow:(nullable NSString *)message;

/**
 全屏提示警告视图

 @param message 警告提示文字
 */
- (void)showWarningMessageInWindow:(nullable NSString *)message;

/**
 全屏提示错误视图

 @param message 错误提示文字
 */
- (void)showErrorMessageInWindow:(nullable NSString *)message;

/**
 全屏提示完成视图

 @param message 完成提示文字
 */
- (void)showOkMessageInWindow:(nullable NSString *)message;

/**
 在全屏视图底部展示提示视图

 @param message 提示文字
 */
- (void)showMessageAboveWindowBottom:(nullable NSString *)message;

/**
 在全屏视图中间展示提示视图

 @param message 提示文字
 */
- (void)showMessageInWindowMiddle:(nullable NSString *)message;

/**
 手动取消视图
 */
- (void)hide;

@end
