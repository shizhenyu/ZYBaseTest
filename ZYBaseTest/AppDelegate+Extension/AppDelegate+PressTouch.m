//
//  AppDelegate+PressTouch.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/26.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AppDelegate+PressTouch.h"
#import "ZyNavigationController.h"

@implementation AppDelegate (PressTouch)

- (void)addShortTouchItem {
    
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"OrderList" localizedTitle:@"订单列表" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeDate] userInfo:nil];
    
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"GoodComment" localizedTitle:@"商品评论" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc]initWithType:@"PhoneSetting" localizedTitle:@"个人中心" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"设置图标"] userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[item1, item2, item3];
}

- (BOOL)pt_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey];
    
    ViewController *vc = [[ViewController alloc] init];
    
    
    /*
     如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO
     
     防止调用application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
     */
    
    if (shortcutItem) {
        
        if ([shortcutItem.type isEqualToString:@"OrderList"]) {
            
            // 进入订单列表界面
            [vc Action_toPressTouchController:@"OrderListViewController"];
            
        }else if ([shortcutItem.type isEqualToString:@"GoodComment"]) {
            
            // 进入商品评论列表
            [vc Action_toPressTouchController:@"GoodCommentListViewController"];
            
        }else {
            
            //进入自定义弹框
            [vc Action_toPressTouchController:@"CustomAlertViewController"];
            
        }
        
        return NO;
    }
    
    return YES;
}

- (void)pt_application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    if ([shortcutItem.type isEqualToString:@"OrderList"]) {
        
        //进入订单列表
        NSDictionary *info = @{@"VCName":@"OrderListViewController"};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:UserPressTouch object:nil userInfo:info];
        
    }else if ([shortcutItem.type isEqualToString:@"GoodComment"]) {
        
        //进入商品评论列表
        NSDictionary *info = @{@"VCName":@"GoodCommentListViewController"};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:UserPressTouch object:nil userInfo:info];
        
    }else {
        
        //进入自定义弹框
        NSDictionary *info = @{@"VCName":@"CustomAlertViewController"};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:UserPressTouch object:nil userInfo:info];
    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
}

@end
