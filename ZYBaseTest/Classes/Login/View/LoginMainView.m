//
//  LoginMainView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/29.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "LoginMainView.h"
#import "LoginTextField.h"
#import "PasswordButton.h"

@interface LoginMainView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) LoginTextField *userNameTextF;

@property (nonatomic, strong) LoginTextField *userPasswordTextF;

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation LoginMainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubViewConstraints];
        
    }
    return self;
}

#pragma makr - Add SubView Constraints
- (void)addSubViewConstraints {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(kWidth(50));
        
        make.height.mas_equalTo(30);
        
    }];
    
    [self.userNameTextF mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(0);
        
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kWidth(70));
        
        make.width.mas_equalTo(kScreenWidth - kWidth(70));
       
        make.height.mas_equalTo(kWidth(50));
        
    }];
    
    [self.userPasswordTextF mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.userNameTextF.mas_centerX);
        
        make.top.equalTo(self.userNameTextF.mas_bottom).offset(kWidth(20));
        
        make.width.equalTo(self.userNameTextF.mas_width);
        
        make.height.equalTo(self.userNameTextF.mas_height);
        
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.mas_centerX);
        
        make.top.equalTo(self.userPasswordTextF.mas_bottom).offset(kWidth(50));
        
        make.width.mas_equalTo(kScreenWidth - kWidth(100));
        
        make.height.mas_equalTo(kWidth(40));
        
    }];
}

#pragma mark - 点击登录按钮
- (void)loginBtnClick {
    
    if (self.userNameTextF.text.length == 0 || [self.userNameTextF.text isEqualToString:@""]) {
        
        [[MBProgressTool sharedMBTool] showMessageInWindowMiddle:@"请输入用户名"];
        
        return ;
    }
    
    if (self.userPasswordTextF.text.length == 0 || [self.userPasswordTextF.text isEqualToString:@""]) {
        
        [[MBProgressTool sharedMBTool] showMessageInWindowMiddle:@"请输入密码"];
        
        return ;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(confirmLoginWithUserName:userPassword:)]) {
        
        [self.delegate confirmLoginWithUserName:self.userNameTextF.text userPassword:self.userPasswordTextF.text];
    }
}

#pragma mark - 更改密码是否可读
- (void)changePasswordIsSeeEnable:(PasswordButton *)sender {
    
    sender.selected = !sender.selected;
    
    self.userPasswordTextF.secureTextEntry = YES;
    
    if (sender.selected) {
        
        self.userPasswordTextF.secureTextEntry = NO;
    }
}

#pragma mark - Setter && Getter
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = @"当支付遇见科技";
        
        _titleLabel.textColor = [UIColor zy_colorWithRed:42 green:131 blue:255];
        
        [_titleLabel sizeToFit];
        
        _titleLabel.font = kFont(30);
        
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (LoginTextField *)userNameTextF {
    
    if (!_userNameTextF) {
        
        _userNameTextF = [[LoginTextField alloc] init];
        
        _userNameTextF.font = kFont(17);
                
        _userNameTextF.layer.cornerRadius = kWidth(25);
        
        _userNameTextF.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        _userNameTextF.layer.borderWidth = 1;
        
        _userNameTextF.layer.masksToBounds = YES;
        
        _userNameTextF.floatingLabelXPadding = kWidth(5);
        
        _userNameTextF.placeholderYPadding = -17 * 0.7;
        
        [_userNameTextF setPlaceholder:@"请输入用户名" floatingTitle:@"用户名"];
        
        _userNameTextF.floatingLabelActiveTextColor = [UIColor zy_colorWithHex:0xfe6246];
        
        [self addSubview:_userNameTextF];
    }
    
    return _userNameTextF;
}

- (LoginTextField *)userPasswordTextF {
    
    if (!_userPasswordTextF) {
        
        _userPasswordTextF = [[LoginTextField alloc] init];
        
        _userPasswordTextF.secureTextEntry = YES;
        
        _userPasswordTextF.layer.cornerRadius = kWidth(25);
        
        _userPasswordTextF.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        _userPasswordTextF.layer.borderWidth = 1;
        
        _userPasswordTextF.layer.masksToBounds = YES;
        
        _userPasswordTextF.placeholderYPadding = -17 * 0.7;
        
        [_userPasswordTextF setPlaceholder:@"请输入密码" floatingTitle:@"密码"];
        
        _userPasswordTextF.floatingLabelActiveTextColor = [UIColor zy_colorWithHex:0xfe6246];
        
        PasswordButton *psdBtn = [PasswordButton new];
        
        psdBtn.frame = CGRectMake(0, 0, kWidth(20), kWidth(15));
        
        [psdBtn setImage:kImage(@"隐藏-MC") forState:UIControlStateNormal];
        
        [psdBtn setImage:kImage(@"显示-MC") forState:UIControlStateSelected];
        
        [psdBtn addTarget:self action:@selector(changePasswordIsSeeEnable:) forControlEvents:UIControlEventTouchUpInside];
        
        _userPasswordTextF.rightView = psdBtn;
        
        _userPasswordTextF.rightViewMode = UITextFieldViewModeWhileEditing;
        
        [self addSubview:_userPasswordTextF];
    }
    
    return _userPasswordTextF;
}

- (UIButton *)loginButton {
    
    if (!_loginButton) {
        
        _loginButton = [UIButton new];
        
        _loginButton.backgroundColor = [UIColor zy_colorWithRed:42 green:131 blue:255];
        
        [_loginButton setTitle:@"登  录" forState:UIControlStateNormal];
        
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _loginButton.layer.cornerRadius = kWidth(20);
        
        _loginButton.layer.masksToBounds = YES;
        
        [_loginButton addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_loginButton];
    }
    
    return _loginButton;
}

@end
