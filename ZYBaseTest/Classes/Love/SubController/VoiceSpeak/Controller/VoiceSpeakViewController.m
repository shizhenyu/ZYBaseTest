//
//  VoiceSpeakViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "VoiceSpeakViewController.h"
#import "ZYSpeechSynthesizer.h"

@interface VoiceSpeakViewController ()

@end

@implementation VoiceSpeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"语音播报";
}

- (void)setupUI {
    
    UIButton *simpleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [simpleButton setTitle:@"收款成功" forState:UIControlStateNormal];
    simpleButton.backgroundColor = [UIColor orangeColor];
    [simpleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:simpleButton];
    
    UIButton *completeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [completeButton setTitle:@"你好，支付宝成功收款0.01元" forState:UIControlStateNormal];
    completeButton.backgroundColor = [UIColor orangeColor];
    [completeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completeButton];
    
    [simpleButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(30);
        
        make.width.mas_equalTo(320);
        
        make.height.mas_equalTo(40);
        
    }];
    
    [completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.centerX.equalTo(simpleButton.mas_centerX);
        
        make.top.equalTo(simpleButton.mas_bottom).offset(20);
        
        make.width.height.equalTo(simpleButton);
        
    }];
}

- (void)buttonClick:(UIButton *)sender {
    
    [[ZYSpeechSynthesizer sharedSpeechSynthesizer] speakString:sender.titleLabel.text];
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
