//
//  QBSettingViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/8.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "QBSettingViewController.h"

@interface QBSettingViewController ()

@end

@implementation QBSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"闪购设置";
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
