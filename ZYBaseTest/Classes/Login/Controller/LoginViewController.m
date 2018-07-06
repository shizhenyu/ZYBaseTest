//
//  LoginViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginMainView.h"
#import "ViewController.h"
#import <JPUSHService.h>

@interface LoginViewController ()<LoginMainViewDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) LoginMainView *mainView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.delegate = self;
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - LoginMainViewDelegate
- (void)confirmLoginWithUserName:(NSString *)userName userPassword:(NSString *)password {
    
    ZYUser *user = [[ZYUser alloc] init];
    
    user.userName = userName;
    
    user.userPassword = password;
    
    user.userID = [NSString stringWithFormat:@"%@%@",userName, password];
    
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

#pragma mark - 懒加载
- (LoginMainView *)mainView {
    
    if (!_mainView) {
        
        _mainView = [[LoginMainView alloc] init];
        
        _mainView.delegate = self;
        
        [self.view addSubview:_mainView];
    }
    
    return _mainView;
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
