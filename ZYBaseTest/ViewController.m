//
//  ViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ViewController.h"
#import "ZyTabBarController.h"
#import "ZyNavigationController.h"
#import "HomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([ZYUserManager userIsLogin]) {
        
        // 用户已经登录
        [self Action_toRootViewController];
        
    }else {
        
        // 用户尚未登录
        [self Action_toLoginViewController];
    }
}

#pragma mark - 进入tabbar界面
- (void)Action_toRootViewController
{
    ZyTabBarController *tabBarVC = [ZyTabBarController new];
    
    [tabBarVC configTabBarWithPlist:@"TabBarConfig"];
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    window.rootViewController = tabBarVC;
}

#pragma mark - 进入登录界面
- (void)Action_toLoginViewController
{
    UIViewController *loginVC = [NSClassFromString(@"LoginViewController") new];
    
    ZyNavigationController *nav = [[ZyNavigationController alloc] initWithRootViewController:loginVC];
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    window.rootViewController = nav;
}

- (void)Action_toPressTouchController:(NSString *)viewControllerIdentifier
{
    if ([ZYUserManager userIsLogin]) {
        
        // 如果用户已经登录的话，展示tabBar界面
        ZyTabBarController *tabBarVC = [ZyTabBarController new];
        
        [tabBarVC configTabBarWithPlist:@"TabBarConfig"];
        
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        
        window.rootViewController = tabBarVC;
        
        
        // 取出tabBar中的第一个界面，也就是HomeViewController
        ZyNavigationController *nav = [tabBarVC.viewControllers objectAtIndex:0];
        
        UIViewController *destenVC = [NSClassFromString(viewControllerIdentifier) new];
        [nav pushViewController:destenVC animated:YES];
        
    }else {
        
        UIViewController *loginVC = [NSClassFromString(@"LoginViewController") new];
        
        ZyNavigationController *nav = [[ZyNavigationController alloc] initWithRootViewController:loginVC];
        
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        
        window.rootViewController = nav;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
