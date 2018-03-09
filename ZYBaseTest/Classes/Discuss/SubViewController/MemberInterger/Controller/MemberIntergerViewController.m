//
//  MemberIntergerViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MemberIntergerViewController.h"
#import "ImageLeftTitleRightButton.h"
#import "ZyTabBarController.h"

@interface MemberIntergerViewController ()

@end

@implementation MemberIntergerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

#pragma mark - Init Nav
- (void)setupNav {
    
    ImageLeftTitleRightButton *backBtn = [[ImageLeftTitleRightButton alloc] init];
    [backBtn setImage:kImage(@"navigationButtonReturn") forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(-10, 0, 70, 30);
    [backBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    backBtn.titleLabel.font = kFont(15);
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(changeRootViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

#pragma mark - Nav Event Response
- (void)changeRootViewController {

    [[NSNotificationCenter defaultCenter] postNotificationName:PopFromSubTabBar object:nil];
    
    [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Init UI
- (void)setupUI {
    
    UIButton *btn = [UIButton new];
    
    btn.center = self.view.center;
    
    btn.bounds = CGRectMake(0, 0, 50, 50);
    
    btn.backgroundColor = [UIColor cyanColor];
    
    [btn addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        UIViewController *vc = [NSClassFromString(@"IntergerDetailViewController") new];
        [self.navigationController pushViewController:vc animated:YES];
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
