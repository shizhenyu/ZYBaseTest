//
//  PushOneViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "PushOneViewController.h"

@interface PushOneViewController ()

@end

@implementation PushOneViewController

#pragma mark - Life Cycle
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    ZYLogLifeFunc(self);
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    ZYLogLifeFunc(self);
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    ZYLogLifeFunc(self);
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    ZYLogLifeFunc(self);
}

- (void)dealloc {
    
    ZYLogLifeFunc(self);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"PushOneViewController";
}

- (void)setupUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.center = self.view.center;
    
    btn.bounds = CGRectMake(0, 0, 50, 50);
    
    btn.backgroundColor = [UIColor cyanColor];
    
    [btn addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        UIViewController *vc = [NSClassFromString(@"PushTwoViewController") new];
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
