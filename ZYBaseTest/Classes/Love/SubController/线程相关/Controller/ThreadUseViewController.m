//
//  ThreadUseViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/4/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ThreadUseViewController.h"

@interface ThreadUseViewController ()

@end

@implementation ThreadUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"二维码扫描";
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
