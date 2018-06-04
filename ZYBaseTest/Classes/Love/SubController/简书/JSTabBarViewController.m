//
//  JSTabBarViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/31.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "JSTabBarViewController.h"
#import "ZyNavigationController.h"
#import "JSTabBar.h"
#import "MBProgressTool.h"

#import "JSHomeViewController.h"
#import "JSLoveViewController.h"
#import "JSPublishViewController.h"
#import "JSMessageViewController.h"
#import "JSMineViewController.h"

@interface JSTabBarViewController ()<UITabBarControllerDelegate, JSTabBarDelegate>

@end

@implementation JSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupChildViewController];
    
    self.delegate = self;
    
    JSTabBar *tabBar = [[JSTabBar alloc] init];
    tabBar.tabBarDelegate = self;
    tabBar.tintColor = [UIColor zy_colorWithHex:0x2699DD];
    tabBar.centerButtonIconName = @"sendPlus";
    tabBar.centerButtonTitle = @"发表";
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self configTabBar:tabBar];
}

- (void)setupChildViewController {
    
    [self addChildVC:[[JSHomeViewController alloc] init] title:@"首页" imageName:@"home"];
    [self addChildVC:[[JSLoveViewController alloc] init] title:@"订阅" imageName:@"love"];
    [self addChildVC:[[JSMessageViewController alloc] init] title:@"消息" imageName:@"message"];
    [self addChildVC:[[JSMineViewController alloc] init] title:@"我的" imageName:@"mine"];
}

- (void)addChildVC:(UIViewController *)viewController title:(NSString *)vcTitle imageName:(NSString *)imageName {
    
    viewController.title = vcTitle;
    
    viewController.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]];
    
    ZyNavigationController *nav = [[ZyNavigationController alloc] initWithRootViewController:viewController];
    
    [self addChildViewController:nav];
}

- (void)configTabBar:(JSTabBar *)tabBar {
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
    //自定义分割线颜色
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(self.tabBar.bounds.origin.x-0.5, self.tabBar.bounds.origin.y, self.tabBar.bounds.size.width+1, self.tabBar.bounds.size.height+2)];
    bgView.layer.borderColor = [UIColor zy_colorWithHex:0xdddddd].CGColor;
    bgView.layer.borderWidth = 0.5;
    [tabBar insertSubview:bgView atIndex:0];
    tabBar.opaque = YES;
}

#pragma mark - JSTabBarDelegate
- (void)tabBar:(JSTabBar *)tabBar clickCenterButton:(UIButton *)sender {
        
    JSPublishViewController *publicVC = [[JSPublishViewController alloc] init];
    
    ZyNavigationController *nav = [[ZyNavigationController alloc] initWithRootViewController:publicVC];
    
    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:nav animated:YES completion:nil];
}
#pragma mark - UITabBarController Delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    UITabBar *tabBar = tabBarController.tabBar;
    
    NSArray *subViews = tabBar.subviews;
    
    UIButton *touchBtn = [subViews objectAtIndex:tabBarController.selectedIndex + 4];
    
    touchBtn = [touchBtn.subviews objectAtIndex:0];
    
    [UIView animateWithDuration:0.1 animations:^{
        
        touchBtn.transform = CGAffineTransformMakeScale(1.1, 1.1);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            touchBtn.transform = CGAffineTransformIdentity;
            
        } completion:nil];
        
    }];
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
