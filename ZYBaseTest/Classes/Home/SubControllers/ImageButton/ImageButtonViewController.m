//
//  ImageButtonViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ImageButtonViewController.h"
#import "ImageLeftTitleRightButton.h"
#import "ImageRightTitleLeftButton.h"
#import "ImageTopTitleBottomButton.h"

@interface ImageButtonViewController ()

@end

@implementation ImageButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    [self setupUI];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"不同image位置的button";
}

- (void)setupUI
{
    ImageLeftTitleRightButton *button1 = [ImageLeftTitleRightButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:kImage(@"设置图标") forState:UIControlStateNormal];
    [button1 setTitle:@"设置" forState:UIControlStateNormal];
    button1.titleLabel.font = kFont(15);
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:button1];
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(50);
        
        make.centerX.mas_equalTo(0);
        
        make.width.mas_equalTo(60);
        
        make.height.mas_equalTo(40);
        
    }];
    
    ImageRightTitleLeftButton *button2 = [ImageRightTitleLeftButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:kImage(@"设置图标") forState:UIControlStateNormal];
    [button2 setTitle:@"设置" forState:UIControlStateNormal];
    button2.titleLabel.font = kFont(15);
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:button2];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(100);
        
        make.centerX.mas_equalTo(0);
        
        make.width.mas_equalTo(60);
        
        make.height.mas_equalTo(40);
        
    }];
    
    ImageTopTitleBottomButton *button3 = [ImageTopTitleBottomButton buttonWithType:UIButtonTypeCustom];
    [button3 setImage:kImage(@"设置图标") forState:UIControlStateNormal];
    [button3 setTitle:@"设置" forState:UIControlStateNormal];
    button3.titleLabel.font = kFont(15);
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:button3];
    
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(150);
        
        make.centerX.mas_equalTo(0);
        
        make.width.mas_equalTo(60);
        
        make.height.mas_equalTo(40);
        
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
