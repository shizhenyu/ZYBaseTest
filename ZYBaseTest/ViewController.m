//
//  ViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ViewController.h"
#import "ZyTabBarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self Action_toRootViewController];
}

#pragma mark - 进入tabbar界面
- (void)Action_toRootViewController
{
    ZyTabBarController *tabBarVC = [ZyTabBarController new];
    
    [tabBarVC configTabBarWithPlist:@"TabBarConfig"];
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    window.rootViewController = tabBarVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
