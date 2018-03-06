//
//  PushHomeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "PushHomeViewController.h"
#import "PushOneViewController.h"

@interface PushHomeViewController ()

@end

@implementation PushHomeViewController

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
    
    self.navigationItem.title = @"Push的HomeViewController";
}

- (void)setupUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.center = self.view.center;
    
    btn.bounds = CGRectMake(0, 0, 50, 50);
    
    btn.backgroundColor = [UIColor cyanColor];
    
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)buttonClick:(UIButton *)btn {
    
    PushOneViewController *oneVC = [[PushOneViewController alloc] init];
    oneVC.titleStr = @"***PushHomeViewController先出来？？";
    [self.navigationController pushViewController:oneVC animated:YES];
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
