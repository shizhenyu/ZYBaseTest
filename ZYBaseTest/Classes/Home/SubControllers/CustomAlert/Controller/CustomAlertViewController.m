//
//  CustomAlertViewController.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/5.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "CustomAlertViewController.h"
#import "AnimateAlertView.h"

@interface CustomAlertViewController ()

@end

@implementation CustomAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];

    UIButton *btn1 = [UIButton textButtonWithTitle:@"系统弹框" fontSize:15 titleColor:[UIColor blackColor] backgroundImage:[UIImage imageWithColor:[UIColor cyanColor]] forState:UIControlStateNormal stateTitleColor:[UIColor redColor]];
    [btn1 addTarget:self action:@selector(showSystemAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(100);
        
        make.width.mas_equalTo(80);
        
        make.height.mas_equalTo(40);
        
    }];
    
    UIButton *btn2 = [UIButton textButtonWithTitle:@"自定义弹框" fontSize:15 titleColor:[UIColor blackColor] backgroundImage:[UIImage imageWithColor:[UIColor cyanColor]] forState:UIControlStateNormal stateTitleColor:[UIColor redColor]];
    [btn2 addTarget:self action:@selector(showCustomAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.mas_equalTo(0);
        
        make.width.mas_equalTo(80);
        
        make.height.mas_equalTo(40);
        
    }];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"自定义弹框";
}

- (void)showSystemAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定要删除该收银员?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击了删除");
        
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)showCustomAlert
{
    AnimateAlertView *alertView = [AnimateAlertView shareAlertView];
    
    alertView.title = @"温馨提示";
    
    alertView.message = @"确定要删除该收银员?";
    
    alertView.confirmTitle = @"删除";
    
    alertView.countDownTime = 3;
    
    alertView.cancelBlock = ^{
        NSLog(@"你点击了取消");
    };
    
    alertView.confirmBlock = ^{
        NSLog(@"你点击了确认");
    };
    
    [alertView show];
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
