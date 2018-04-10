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
                
                NSLog(@"%ld--%@--%ld", iResCode, iAlias, seq);
                
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
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 70, 120, 30)];
    label1.text = @"关闭语音播报";
    label1.font = kFont(15);
    [self.view addSubview:label1];
    
    UISwitch *swith1 = [[UISwitch alloc] initWithFrame:CGRectMake(150, 70, 100, 30)];
    [swith1 addTarget:self action:@selector(openVoiceSpeak:) forControlEvents:UIControlEventValueChanged];
    
    NSUserDefaults *stand = [[NSUserDefaults alloc] initWithSuiteName:kNotificationServiceGroupName];
    
    BOOL isCloseVoice = [stand boolForKey:kUserIsCloseVoiceSpeak];
    
    [swith1 setOn:isCloseVoice animated:YES];
    [self.view addSubview:swith1];
    
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 120, 30)];
    label2.text = @"是否简易播报";
    label2.font = kFont(15);
    [self.view addSubview:label2];
    
    UISwitch *swith2 = [[UISwitch alloc] initWithFrame:CGRectMake(150, 120, 100, 30)];
    [swith2 addTarget:self action:@selector(openSimpleSpeak:) forControlEvents:UIControlEventValueChanged];
    
    BOOL isSimple = [stand boolForKey:kUserIsOpenSimpleVoiceSpeak];
    
    [swith2 setOn:isSimple animated:YES];
    [self.view addSubview:swith2];
}

#pragma mark - 开启语音播报
- (void)openVoiceSpeak:(UISwitch *)swith {
    
    NSUserDefaults *stand = [[NSUserDefaults alloc] initWithSuiteName:kNotificationServiceGroupName];
    
    [stand setBool:swith.isOn forKey:kUserIsCloseVoiceSpeak];
    
    [stand synchronize];
}

#pragma mark - 是否开启简易的语音播报
- (void)openSimpleSpeak:(UISwitch *)swith {
    
    NSUserDefaults *stand = [[NSUserDefaults alloc] initWithSuiteName:kNotificationServiceGroupName];
    
    [stand setBool:swith.isOn forKey:kUserIsOpenSimpleVoiceSpeak];
    
    [stand synchronize];
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
