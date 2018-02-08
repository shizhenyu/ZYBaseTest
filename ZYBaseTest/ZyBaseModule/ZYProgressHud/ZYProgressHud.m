//
//  ZYProgressHud.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ZYProgressHud.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation ZYProgressHud

+ (void)load
{
}

void ShowMaskStatus(UIView *toView, NSString *status)
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:toView animated:YES];
    
    hud.mode = MBProgressHUDModeIndeterminate;
    
    hud.animationType = MBProgressHUDAnimationZoomOut;
    
    hud.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    hud.contentColor = [UIColor whiteColor];
    
    hud.label.text = status;
    
}

void ShowMessage(UIView *toView, NSString *status)
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:toView animated:YES];
    
    hud.mode = MBProgressHUDModeText;
    
    hud.animationType = MBProgressHUDAnimationFade;
    
    hud.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    hud.contentColor = [UIColor whiteColor];
    
    hud.label.text = status;
    
    [hud hideAnimated:YES afterDelay:1.5];
}

void DismissHud(UIView *toView)
{
    [MBProgressHUD hideHUDForView:toView animated:YES];
}

@end
