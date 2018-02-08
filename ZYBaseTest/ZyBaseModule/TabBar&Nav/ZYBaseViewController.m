//
//  ZYBaseViewController.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "ZYBaseViewController.h"

@interface ZYBaseViewController ()

@end

@implementation ZYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - #pragma mark - 设置当前控制器的标题

- (void)setCurrentVCTitle:(NSString *)currentTitle {
    
    self.navigationItem.title = currentTitle;
}

#pragma mark - 设置左侧返回按钮的标题

- (void)setLeftBarButtonItemTitle:(NSString *)leftBarButtonItemTitle {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:leftBarButtonItemTitle style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClick:)];
    
}

#pragma mark - 设置左侧返回按钮的图片

- (void)setLeftBarButtonItemImageName:(NSString *)leftBarButtonItemImageName {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:leftBarButtonItemImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClick:)];
}

#pragma mark - 左侧按钮的点击事件

- (void)leftBarButtonItemClick:(UIButton *)button {
    
    if (self.presentingViewController) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 设置右侧按钮的标题

- (void)setRightBarButtonItemTitle:(NSString *)rightBarButtonItemTitle {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:rightBarButtonItemTitle style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
}

#pragma mark - 设置右侧按钮的图片
- (void)setRightBarButtonItemImageName:(NSString *)rightBarButtonItemImageName {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:rightBarButtonItemImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
}

#pragma mark - 右侧按钮的点击事件
- (void)rightBarButtonItemClick:(UIButton *)button {
    
    
}

- (void)setLeftBarButtonView:(UIView *)leftBarButtonView {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBarButtonView];
}

- (void)setRightBarButtonView:(UIView *)rightBarButtonView {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButtonView];
}
@end
