//
//  AppDelegate+ThirdService.m
//  ZYBaseTest
//
//  Created by youyun on 2018/4/13.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AppDelegate+ThirdService.h"

@implementation AppDelegate (ThirdService)

- (void)setupThirdService {
    
    // 关闭设置为NO， 默认为NO
    [IQKeyboardManager sharedManager].enable = YES;
    
    // 点击背景收起键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    // 当产品需要支持内联编辑(Inline Editing), 这就需要隐藏键盘上的工具条(默认打开)
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

@end
