//
//  AppDelegate.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+JPush.h"
#import "AppDelegate+PressTouch.h"
#import "AppDelegate+ThirdService.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self setup3DTouch:application];
    
    [self initJPushService:launchOptions];
    
    [self setupThirdService];
    
    [self pressTouch_application:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

#pragma mark - 3D Touch快捷进入
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    // //不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法
    [self pressTouch_application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
}

#pragma mark - 注册通知
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [self JPush_application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    [self JPush_application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [self JPush_application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    [self JPush_application:application didReceiveRemoteNotification:userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    [self JPush_cleanApplicationBadge:application];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    self.visualEffectView.alpha = 0;
    
    self.visualEffectView.frame = self.window.frame;
    
    [self.window addSubview:self.visualEffectView];
    
    [UIView animateWithDuration:0.5 animations:^{
       
        self.visualEffectView.alpha = 0.9;
        
    }];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.visualEffectView.alpha = 0;
        
    } completion:^(BOOL finished) {
       
        [self.visualEffectView removeFromSuperview];
        
    }];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
