//
//  KVOViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "KVOViewController.h"
#import "Children.h"

@interface KVOViewController ()

@property (nonatomic, strong) Children *child;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.child = [[Children alloc] init];
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"KVC&&KVO";
}

- (void)setupUI {
    
    UIButton *button = [UIButton new];
    button.frame = CGRectMake(30, 50, 50, 50);
    button.backgroundColor = [UIColor cyanColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)sender {
    
    NSInteger age = arc4random()%100;
    CGFloat height = arc4random()%500000/100.0;
    
    [self.child setValue:@(age) forKeyPath:@"age"];
    [self.child setValue:@(height) forKeyPath:@"height"];
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
