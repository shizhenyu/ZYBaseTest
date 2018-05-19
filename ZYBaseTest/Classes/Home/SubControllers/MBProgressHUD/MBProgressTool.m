//
//  MBProgressTool.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MBProgressTool.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation MBProgressTool{
    
    MBProgressHUD *_hud;
}

+(instancetype)sharedMBTool {
    
    static MBProgressTool *instance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[MBProgressTool alloc] init];
    });
    
    return instance;
}

- (void)showProcessingMessage:(nonnull NSString *)message showInView:(nonnull UIView *)view {
    
    [self hide];
    
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.removeFromSuperViewOnHide = YES;
    _hud.label.text = message;
}

- (void)showWarningMessage:(nonnull NSString *)message showInView:(nonnull UIView *)view {
    
    [self hide];
    
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    _hud.mode = MBProgressHUDModeCustomView;
    
    // 始终根据Tint Color绘制图片，忽略图片的颜色信息
    UIImage *image = [[UIImage imageNamed:@"mainWarning"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _hud.customView = [[UIImageView alloc] initWithImage:image];
    
    _hud.label.text = message;
    _hud.removeFromSuperViewOnHide = YES;
    [_hud hideAnimated:YES afterDelay:2];
    
}

- (void)showErrorMessage:(NSString *)message showInView:(UIView *)view {
    
    [self hide];
    
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    _hud.mode = MBProgressHUDModeCustomView;
    
    UIImage *image = [[UIImage imageNamed:@"mainError"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _hud.customView = [[UIImageView alloc] initWithImage:image];
    
    _hud.label.text = message;
    _hud.removeFromSuperViewOnHide = YES;
    [_hud hideAnimated:YES afterDelay:2.f];
}

- (void)showOkMessage:(NSString *)message showInView:(UIView *)view {
    
    [self hide];
    
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    _hud.mode = MBProgressHUDModeCustomView;
    
    UIImage *image = [[UIImage imageNamed:@"mainDone"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _hud.customView = [[UIImageView alloc] initWithImage:image];
    
    _hud.label.text = message;
    _hud.removeFromSuperViewOnHide = YES;
    [_hud hideAnimated:YES afterDelay:2.f];
}

- (void)showMessageAboveViewBottom:(NSString *)message showInView:(UIView *)view {
    
    [self hide];
    
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    _hud.mode = MBProgressHUDModeText;
    _hud.label.text = message;
    _hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    _hud.removeFromSuperViewOnHide = YES;
    [_hud hideAnimated:YES afterDelay:2.f];
}

- (void)showMessageInViewMiddle:(NSString *)message showInView:(UIView *)view {
    
    [self hide];
    
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.mode = MBProgressHUDModeText;
    _hud.label.text = message;
    _hud.offset = CGPointMake(0.f, 0);
    
    _hud.removeFromSuperViewOnHide = YES;
    [_hud hideAnimated:YES afterDelay:2.f];
}

- (void)showProcessingMessageInWindow:(NSString *)message {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showProcessingMessage:message showInView:window];
}

- (void)showWarningMessageInWindow:(NSString *)message {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showWarningMessage:message showInView:window];
}

- (void)showErrorMessageInWindow:(NSString *)message {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showErrorMessage:message showInView:window];
}

- (void)showOkMessageInWindow:(NSString *)message {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showOkMessage:message showInView:window];
}

- (void)showMessageAboveWindowBottom:(NSString *)message {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showMessageAboveViewBottom:message showInView:window];
}

- (void)showMessageInWindowMiddle:(NSString *)message {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showMessageInViewMiddle:message showInView:window];
}

- (void)hide {
    
    if (_hud) {
        
        [_hud hideAnimated:YES];
    }
}

@end
