//
//  LoginViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import <JPUSHService.h>

@interface LoginViewController ()<UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.delegate = self;
}

#pragma mark - Login Event Response
- (IBAction)loginBtnClick:(UIButton *)sender {
    
    if (self.userNameTF.text == nil || self.userNameTF.text.length == 0) {
        
        ShowMessage(self.navigationController.view, @"请输入用户名");
        
        return;
    }
    
    if (self.passwordTF.text == nil || self.passwordTF.text.length == 0) {
        
        ShowMessage(self.view, @"请输入密码");
        
        return;
    }
    
    ZYUser *user = [[ZYUser alloc] init];
    
    user.userName = self.userNameTF.text;
    
    user.userPassword = self.passwordTF.text;
    
    user.userID = [NSString stringWithFormat:@"%@%@",self.userNameTF.text, self.passwordTF.text];
    
   BOOL isSuccess = [ZYUserManager saveUserToLocal:user];
    
    if (isSuccess) {
                
        [JPUSHService setAlias:@"99523" completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
            
            // 回调返回对应的参数alias。并返回对应的状态码：0为成功  其他返回码则为错误
            NSLog(@"%ld--%@--%ld", iResCode, iAlias, seq);
            
        } seq:0];
        
        ViewController *mainVC = [[ViewController alloc] init];
        
        [mainVC Action_toRootViewController];
    }
    
}

#pragma mark - UINavigationControllerDelegate
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
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
