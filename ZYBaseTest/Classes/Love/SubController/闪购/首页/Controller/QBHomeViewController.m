//
//  QBHomeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/8.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "QBHomeViewController.h"

@interface QBHomeViewController ()

@end

@implementation QBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
}

#pragma mark - 设置导航栏
- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton new];
    [backButton setImage:kImage(@"navigationButtonReturn") forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, kWidth(35), kWidth(35));
    [backButton addTarget:self action:@selector(backToRootViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

#pragma mark - 返回主 tabBarController
- (void)backToRootViewController {
    
    [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];
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
