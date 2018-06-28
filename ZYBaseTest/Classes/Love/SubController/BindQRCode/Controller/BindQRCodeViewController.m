//
//  BindQRCodeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/10.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "BindQRCodeViewController.h"
#import "BindCodeStatusView.h"

@interface BindQRCodeViewController ()

@end

@implementation BindQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"绑定门店收款码";
}

- (void)setupUI
{
    UIButton *btn1 = [UIButton new];
    
    btn1.backgroundColor = [UIColor orangeColor];
    
    [btn1 addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        BindCodeStatusView *status = [BindCodeStatusView shareStatusViewWithType:StatusTypeBind];
        
        status.confirmBlock = ^{
            NSLog(@"2121");
        };
        
        [status show];
        
    }];
    
    [self.view addSubview:btn1];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(75);
        
        make.width.height.mas_equalTo(40);
        
    }];
    
    
    UIButton *btn2 = [UIButton new];
    
    btn2.backgroundColor = [UIColor orangeColor];
    
    [btn2 addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        BindCodeStatusView *status = [BindCodeStatusView shareStatusViewWithType:StatusTypeUnBind];
        
        [status show];
        
    }];
    
    [self.view addSubview:btn2];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(120);
        
        make.width.height.mas_equalTo(40);
        
    }];
    
    UIButton *btn3 = [UIButton new];
    
    btn3.backgroundColor = [UIColor orangeColor];
    
    [btn3 addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        BindCodeStatusView *status = [BindCodeStatusView shareStatusViewWithType:StatusTypeNoAccess];
        
        [status show];
        
    }];
    
    [self.view addSubview:btn3];
    
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(165);
        
        make.width.height.mas_equalTo(40);
        
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    

    
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
