//
//  JSPublishViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/31.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "JSPublishViewController.h"
#import "MBProgressTool.h"

@interface JSPublishViewController ()

@end

@implementation JSPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
}

#pragma mark - SetupNav
- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"发表文章";
    
    UIButton *backButton = [UIButton new];
    [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 30, 30);
    [backButton addTarget:self action:@selector(backToJSHomeController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIButton *publishButton = [UIButton new];
    [publishButton setTitle:@"发表" forState:UIControlStateNormal];
    [publishButton setTitleColor:[UIColor zy_colorWithHex:0xfe6246] forState:UIControlStateNormal];
    publishButton.frame = CGRectMake(0, 0, 40, 28);
    [publishButton addTarget:self action:@selector(confirmPublishText) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:publishButton];
}

#pragma mark - Nav Event Response
- (void)backToJSHomeController {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmPublishText {
    
    [[MBProgressTool sharedMBTool] showOkMessageInWindow:@"确认发表应用？"];
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
