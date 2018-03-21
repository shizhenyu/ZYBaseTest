//
//  SettingViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/21.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "SettingViewController.h"
#import <JPUSHService.h>

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];

}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
}

- (void)setupUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor cyanColor];
    
    [btn addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        BOOL isSuccess = [ZYUserManager deleteLocalUser];
        
        if (isSuccess) {
            
            [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
                
            } seq:0];
            
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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 70, 120, 30)];
    label.text = @"开启语音播报";
    label.font = kFont(15);
    [self.view addSubview:label];
    
    UISwitch *swith = [[UISwitch alloc] initWithFrame:CGRectMake(150, 70, 100, 30)];
    [swith addTarget:self action:@selector(openVoiceSpeak:) forControlEvents:UIControlEventTouchUpInside];
    [swith setOn:[ZYUserDefault boolForKey:UserIsCloseVoice] animated:YES];
    [self.view addSubview:swith];
}

#pragma mark - 开启语音播报
- (void)openVoiceSpeak:(UISwitch *)swith {
    
    [ZYUserDefault setBool:swith.isOn forKey:UserIsCloseVoice];
    [ZYUserDefault synchronize];
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
