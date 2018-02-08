//
//  MBProgressHUDViewController.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MBProgressHUDViewController.h"

@interface MBProgressHUDViewController ()

@end

@implementation MBProgressHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupButton];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"封装MBProgressHUD";
}

- (void)setupButton
{
    UIButton *btn = [UIButton new];
    
    btn.frame = CGRectMake(50, 50, 80, 30);
    
    [btn setTitle:@"加载" forState:UIControlStateNormal];
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    btn.backgroundColor = [UIColor orangeColor];
    
    [btn addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        ShowMaskStatus(self.view, @"正在加载...");
        
        [self hide];
    }];
    
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [UIButton new];
    
    btn2.frame = CGRectMake(50, 90, 80, 30);
    
    btn2.backgroundColor = [UIColor cyanColor];
    
    [btn2 setTitle:@"提示" forState:UIControlStateNormal];
    
    [btn2 addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        ShowMessage(self.navigationController.view, @"加载完成");
        
    }];
    
    [self.view addSubview:btn2];
}

- (void)hide
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        DismissHud(self.view);
        
    });
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
