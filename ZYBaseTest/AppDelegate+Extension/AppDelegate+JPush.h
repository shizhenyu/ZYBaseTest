//
//  AppDelegate+JPush.h
//  ZYBaseTest
//
//  Created by youyun on 2018/3/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AppDelegate.h"

// 引 JPush功能所需头 件
#import "JPUSHService.h"

static NSString *appKey = @"de9d47fa26e23738b16ed62f";
static BOOL isProduction = NO;

@interface AppDelegate (JPush)<JPUSHRegisterDelegate>

/**
 注册极光推送
 
 @param launchOptions launchOptions
 */
- (void)initJPushService:(NSDictionary *)launchOptions;

/**
 获取DeviceToken 成功

 @param application application
 @param deviceToken deviceToken
 */
- (void)JPush_application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

/**
 获取DeviceToken 失败

 @param application application
 @param error error
 */
- (void)JPush_application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;


/**
 app收到远程推送

 @param application application
 @param userInfo userInfo
 */
-(void)JPush_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;


/**
 app收到远程推送

 @param application application
 @param userInfo userInfo
 @param completionHandler 完成之后的回调
 */
- (void)JPush_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

- (void)JPush_cleanApplicationBadge:(UIApplication *)application;
@end
