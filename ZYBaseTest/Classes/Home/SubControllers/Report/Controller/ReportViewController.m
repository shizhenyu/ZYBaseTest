//
//  ReportViewController.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ReportViewController.h"
#import "ReportView.h"

@interface ReportViewController ()

@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
    
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"弹框提示";
}

- (void)setupUI
{
    UIButton *btn = [UIButton textButtonWithTitle:@"弹框" fontSize:16 titleColor:[UIColor blackColor] backgroundImage:[UIImage imageWithColor:[UIColor cyanColor]] forState:UIControlStateNormal stateTitleColor:[UIColor blackColor]];
    
    [btn addTarget:self action:@selector(showReportView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(580);
        
        make.width.mas_equalTo(100);
        
        make.height.mas_equalTo(30);
        
    }];
}

#pragma mark - ButtonEvent Response
- (void)showReportView:(UIButton *)button
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    CGRect frame = [button convertRect:button.bounds toView:window];
    
    [ReportView showViewWithContainerViewFrame:frame];
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
