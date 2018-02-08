//
//  ZyTabBarController.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "ZyTabBarController.h"
#import "ZyTabBar.h"
#import "ZyNavigationController.h"

NSString *const kItems = @"Items";

NSString *const kVCName = @"VCName";

NSString *const kItemImageName = @"ImageName";

NSString *const kTitleName = @"Title";

NSString *const kTabBar = @"tabBar";

@interface ZyTabBarController ()<UITabBarControllerDelegate>

@end

@implementation ZyTabBarController

#pragma mark - LifeCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.delegate = self;
    
    ZyTabBar *tabBar = [ZyTabBar new];
    
    tabBar.tintColor = [UIColor zy_colorWithHex:0xfc5a00];
    
    [self setValue:tabBar forKey:@"tabBar"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - orientation

#pragma mark - 是否支持转屏
- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}

#pragma mark - 返回nav栈中的最后一个对象支持的旋转方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}

#pragma mark - 返回nav栈中最后一个对象,坚持旋转的方向

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

#pragma mark - UITabBarControllerDelegate

// 处理 tabBar上的动画
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    UITabBar *tabBar = tabBarController.tabBar;
    
    NSArray *subViews = tabBar.subviews;
    
    
    UIButton *touchBtn = [subViews objectAtIndex:tabBarController.selectedIndex + 2];
    
    touchBtn = [touchBtn.subviews objectAtIndex:0];

        [UIView animateWithDuration:0.1 animations:^{
    
            touchBtn.transform = CGAffineTransformMakeScale(1.1, 1.1);
    
        } completion:^(BOOL finished) {
    
            [UIView animateWithDuration:0.1 animations:^{
                
               touchBtn.transform = CGAffineTransformIdentity;
                
            }];
            
        }];
    
}

#pragma mark - Private Method
- (UIViewController *)createChildViewControllerWithParam:(NSDictionary *)param {
    
    Class cls = NSClassFromString(param[kVCName]);
    
    UIViewController *vc = [cls new];
    
    if ([vc isMemberOfClass:[UIViewController class]]) {
        
        return [UIViewController new];
    }
    
    vc.title = [NSString stringWithFormat:@"%@",param[kTitleName]];
    
    vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",param[kItemImageName]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",param[kItemImageName]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ZyNavigationController *nav = [[ZyNavigationController alloc]initWithRootViewController:vc];
    
    return nav;
    
}

#pragma mark - Public Method

- (void)configTabBarWithPlist:(NSString *)plistName {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"];
    
    NSDictionary *tabParams = [NSDictionary dictionaryWithContentsOfFile:path];

    for (NSDictionary *param in [tabParams objectForKey:kItems]) {
        
        UIViewController *vc = [self createChildViewControllerWithParam:param];
        
        [self addChildViewController:vc];
        
    }
    
}

@end
