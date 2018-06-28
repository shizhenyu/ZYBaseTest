//
//  TextFieldPlaceholderViewController.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "TextFieldPlaceholderViewController.h"

@interface TextFieldPlaceholderViewController ()<UITextFieldDelegate>

@end

@implementation TextFieldPlaceholderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
    
    [self initMBProgressHUDVC];
    
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"TF的placeholder不居中";
}

- (void)setupUI
{
    UITextField *textField = [[UITextField alloc]init];
    
    textField.delegate = self;
    
    textField.backgroundColor = [UIColor orangeColor];
    
    textField.font = [UIFont systemFontOfSize:25];
    
    textField.textColor = [UIColor redColor];
    
    textField.textAlignment = NSTextAlignmentLeft;
    
    
    // 段落样式
    NSMutableParagraphStyle *style = [textField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    
    // minimumLineHeight 最小行高
    style.minimumLineHeight = textField.font.lineHeight - (textField.font.lineHeight - kFont(10).lineHeight)/2.0;
    
    style.lineSpacing = 10; // 字体的行间距
    
    style.firstLineHeadIndent = 15.f; //首行缩进
    
    NSString *text = @"可提现金额300元";
    
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc]initWithString:text];
    
    [titleStr addAttributes:@{NSFontAttributeName:kFont(10), NSParagraphStyleAttributeName:style} range:NSMakeRange(0, titleStr.length)];
    
    textField.attributedPlaceholder = titleStr;
    
    [self.view addSubview:textField];
    
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(kHeight(20));
        
        make.width.equalTo(self.view.mas_width).multipliedBy(200/375.0);
        
        make.height.equalTo(self.view.mas_height).multipliedBy(60/667.0);
        
    }];
    
}

#pragma mark - 自定义MBProgress
- (void)initMBProgressHUDVC
{
    UIButton *btn = [UIButton textButtonWithTitle:@"MBProgress" fontSize:15 titleColor:[UIColor blackColor] backgroundImage:[UIImage imageWithColor:[UIColor cyanColor]] forState:UIControlStateNormal stateTitleColor:[UIColor blackColor]];
    
    [btn addTargetForControlEvents:UIControlEventTouchUpInside action:^(id sender) {
        
        UIViewController *MBVC = [NSClassFromString(@"MBProgressHUDViewController") new];
        
        [self.navigationController pushViewController:MBVC animated:YES];
    }];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(kHeight(85));
        
        make.width.mas_equalTo(100);
        
        make.height.mas_equalTo(30);
        
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
