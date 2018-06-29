//
//  QRCodeShowViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/28.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "QRCodeShowViewController.h"
#import <SGQRCode/SGQRCode.h>

@interface QRCodeShowViewController ()

@end

@implementation QRCodeShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"二维码生成";
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor orangeColor];
    imageView.center = self.view.center;
    imageView.bounds = CGRectMake(0, 0, kWidth(270), kWidth(270));
    [self.view addSubview:imageView];
    
    imageView.image = [SGQRCodeGenerateManager generateWithDefaultQRCodeData:_qrCodeString imageViewWidth:kWidth(270)];
    
    if (_isShowLogo) {
        
        imageView.image = [SGQRCodeGenerateManager generateWithLogoQRCodeData:_qrCodeString logoImageName:@"personLogo.jpg" logoScaleToSuperView:0.15];
    }
    
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
