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
    
    self.view.backgroundColor = [UIColor orangeColor];
    
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

#pragma mark - 通过3DTouch点击启动
- (void)Action_toPressTouchViewControllerIdentifier:(NSString *)viewControllerIdentifier {
    
    if ([ZYUserManager userIsLogin]) {  //如果用户已经登录，则对应的跳转到相应的界面
        
        ZyTabBarController *tabBarVC = [ZyTabBarController new];
        [tabBarVC configTabBarWithPlist:@"TabBarConfig"];
    
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        window.rootViewController = tabBarVC;
        
        if ([viewControllerIdentifier isEqualToString:@"SettingViewController"]) {
            
            // 如果选择的是“我的”中的“设置”
            [tabBarVC setSelectedIndex:3];  //选择tabBar中的mine
            
            // 选择以MineViewController为根视图的nav
            ZyNavigationController *nav = [tabBarVC.viewControllers objectAtIndex:3];
            
            UIViewController *settingVC = [NSClassFromString(@"SettingViewController") new];
            
            [nav pushViewController:settingVC animated:YES];
            
        }else {
            
            //  选择以HomeViewController为根视图的nav
            ZyNavigationController *nav = [tabBarVC.viewControllers firstObject];
            
            // 选择的是其他的VC
            UIViewController *destenVC = [NSClassFromString(viewControllerIdentifier) new];
            
            [nav pushViewController:destenVC animated:YES];
        }
        
    }else {  // 进入登录界面
        
        [self Action_toLoginViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
