//
//  AppDelegate+PressTouch.h
//  ZYBaseTest
//
//  Created by youyun on 2018/2/26.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (PressTouch)

/**
 初始化3DTouch

 @param application application
 */
- (void)setup3DTouch:(UIApplication *)application;

/**
 首次启动应用时调用的方法

 @param application application
 @param launchOptions launchOptions
 */
- (BOOL)pressTouch_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/**
 如果APP没被杀死，还存在后台，点开Touch会调用该代理方法

 @param application application
 @param shortcutItem shortcutItem
 @param completionHandler 点击回调
 */
- (void)pressTouch_application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler;

@end
