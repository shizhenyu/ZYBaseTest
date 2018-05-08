//
//  QuickBuyTabBarViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/8.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "QuickBuyTabBarViewController.h"
#import "ZyTabBar.h"
#import "ZyNavigationController.h"

NSString *const kQBItems = @"Items";

NSString *const kQBVCName = @"VCName";

NSString *const kQBItemImageName = @"ImageName";

NSString *const kQBTitleName = @"Title";

@interface QuickBuyTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation QuickBuyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.delegate = self;
    
    ZyTabBar *tabBar = [ZyTabBar new];
    
    tabBar.tintColor = [UIColor zy_colorWithHex:0xfc5a00];
    
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self configTabBarWithPlist:@"QuickBuyTabBarConfig"];
}

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
    
    Class cls = NSClassFromString(param[kQBVCName]);
    
    UIViewController *vc = [cls new];
    
    if ([vc isMemberOfClass:[UIViewController class]]) {
        
        return [UIViewController new];
    }
    
    vc.title = [NSString stringWithFormat:@"%@",param[kQBTitleName]];
    
    vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",param[kQBItemImageName]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",param[kQBItemImageName]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ZyNavigationController *nav = [[ZyNavigationController alloc]initWithRootViewController:vc];
    
    return nav;
}

#pragma mark - Public Method
- (void)configTabBarWithPlist:(NSString *)plistName {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"];
    
    NSDictionary *tabParams = [NSDictionary dictionaryWithContentsOfFile:path];
    
    for (NSDictionary *param in [tabParams objectForKey:kQBItems]) {
        
        UIViewController *vc = [self createChildViewControllerWithParam:param];
        
        [self addChildViewController:vc];
    }
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
