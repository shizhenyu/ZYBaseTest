//
//  LandScapeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "LandScapeViewController.h"
#import "ZyNavigationController.h"
#import "AppDelegate.h"

@interface LandScapeViewController ()

@end

@implementation LandScapeViewController

#pragma mark - Life Circle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //强制旋转竖屏
    [self forceOrientationLandscape];
    
    ZyNavigationController *navi = (ZyNavigationController *)self.navigationController;
    navi.interfaceOrientation =   UIInterfaceOrientationLandscapeRight;
    navi.interfaceOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
    
    //强制翻转屏幕，Home键在右边。
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //强制旋转竖屏
    [self forceOrientationPortrait];
    
    ZyNavigationController *navi = (ZyNavigationController *)self.navigationController;
    
    navi.interfaceOrientation = UIInterfaceOrientationPortrait;
    
    navi.interfaceOrientationMask = UIInterfaceOrientationMaskPortrait;
    
    //设置屏幕的转向为竖屏
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

#pragma  mark 横屏设置
//强制横屏
- (void)forceOrientationLandscape
{
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    appdelegate.isForceLandscape = YES;
    
    appdelegate.isForcePortrait = NO;
    
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}

//强制竖屏
- (void)forceOrientationPortrait
{
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    appdelegate.isForcePortrait = YES;
    
    appdelegate.isForceLandscape = NO;
    
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"封装MBProgressHUD";
    
    [self setupButton];
}

- (void)setupButton
{
    UIButton *btn = [UIButton new];
    
    btn.frame = CGRectMake(50, 80, 100, 50);
    
    [btn setTitle:@"btn1" forState:UIControlStateNormal];
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    btn.backgroundColor = [UIColor orangeColor];
    
    [btn addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    }];
    
    [self.view addSubview:btn];
    
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
