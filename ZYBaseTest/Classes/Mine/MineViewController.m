//
//  MineViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor cyanColor];
    
    [btn addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        BOOL isSuccess = [ZYUserManager deleteLocalUser];
        
        if (isSuccess) {
            
            ViewController *vc = [[ViewController alloc] init];
            
            [vc Action_toLoginViewController];
        }
        
    }];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.mas_equalTo(0);
        
        make.width.mas_equalTo(80);
        
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
