//
//  AppDelegate+PressTouch.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/26.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AppDelegate+PressTouch.h"
#import "ZyNavigationController.h"

static NSString *const kPressTouchOrderList = @"kPressTouchOrderList";
static NSString *const kPressTouchGoodComent = @"kPressTouchGoodComent";
static NSString *const kPressTouchPhoneSetting = @"kPressTouchPhoneSetting";

@implementation AppDelegate (PressTouch)

- (void)setup3DTouch:(UIApplication *)application {
    
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:kPressTouchOrderList localizedTitle:@"订单列表" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeDate] userInfo:nil];
    
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:kPressTouchGoodComent localizedTitle:@"商品评论" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
    
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc]initWithType:kPressTouchPhoneSetting localizedTitle:@"个人中心" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"设置图标"] userInfo:nil];
    
    application.shortcutItems = @[item1, item2, item3];
}

- (BOOL)pressTouch_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
     如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO
     
     防止调用application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
     */
    
    UIApplicationShortcutItem *shortCutItem = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey];
    
    if (shortCutItem) {
        
        ViewController *mainVC = [[ViewController alloc] init];
        
        if ([shortCutItem.type isEqualToString:kPressTouchOrderList]) {  // 进入订单列表
            
            [mainVC Action_toPressTouchViewControllerIdentifier:@"OrderListViewController"];
            
        }else if ([shortCutItem.type isEqualToString:kPressTouchGoodComent]) {  // 进入商品评论列表
            
            [mainVC Action_toPressTouchViewControllerIdentifier:@"GoodCommentListViewController"];
            
        }else {  // 进入设置界面
            
            [mainVC Action_toPressTouchViewControllerIdentifier:@"SettingViewController"];
        }
        
        return NO;
    }
    
    return YES;
}

- (void)pressTouch_application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    if ([shortcutItem.type isEqualToString:kPressTouchOrderList]) { // 进入订单列表
        
        NSDictionary *infoDic = @{@"VCName":@"OrderListViewController"};
        
        [ZYNotification postNotificationName:kUserPressTouch object:nil userInfo:infoDic];
        
    }else if ([shortcutItem.type isEqualToString:kPressTouchGoodComent]) {  // 进入商品评论列表
        
        NSDictionary *infoDic = @{@"VCName":@"GoodCommentListViewController"};
        
        [ZYNotification postNotificationName:kUserPressTouch object:nil userInfo:infoDic];
        
    }else {  // 进入设置界面
        
        NSDictionary *infoDic = @{@"VCName":@"SettingViewController"};
        
        [ZYNotification postNotificationName:kUserPressTouch object:nil userInfo:infoDic];
    }
    
    if (completionHandler) {
        
        completionHandler(YES);
    }
}

@end
