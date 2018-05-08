//
//  DiscussViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "DiscussViewController.h"
#import "DiscussTabBarController.h"

@interface DiscussViewController ()

/** 是否从次级TabBar返回 */
@property (nonatomic, assign) BOOL isFromSubTabBar;

@end

@implementation DiscussViewController

#pragma mark - 生命周期
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if (self.isFromSubTabBar) {
        
        // 如果是从 泡泡模块返回的，则跳转到主tabBar 的首页
        
        self.isFromSubTabBar = NO;
        
        self.tabBarController.selectedIndex = 0;
        
    }else {
        
        // 如果是点击泡泡选项，则跳转到泡泡模块
        DiscussTabBarController *tabBarVC = [[DiscussTabBarController alloc] init];
        
        [self.navigationController.navigationBar setHidden:YES];
        
        [self.tabBarController.tabBar setHidden:YES];
        
        self.isFromSubTabBar = YES;
        
        [self.navigationController pushViewController:tabBarVC animated:YES];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isFromSubTabBar = NO;
    
    // 这个VC主要是作为跳转tabBar 的过渡页，让跳转时不突兀
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
