//
//  BossHomeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/30.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "BossHomeViewController.h"
#import "BossHomeMainView.h"
#import "BossOrderListViewController.h"

@interface BossHomeViewController ()

@property (nonatomic, strong) BossHomeMainView *mainView;

@end

@implementation BossHomeViewController

#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor zy_colorWithRed:24 green:47 blue:93]] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor zy_colorWithRed:239 green:245 blue:249]] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor zy_colorWithHex:0x333434]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
    
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"杭州有云科技公司";
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightButtonClick)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)rightButtonClick {
    
    BossOrderListViewController *orderListVC = [[BossOrderListViewController alloc] init];
        
    [self.navigationController pushViewController:orderListVC animated:YES];
}

- (void)setupUI {
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - 懒加载
- (BossHomeMainView *)mainView {
    
    if (!_mainView) {
        
        _mainView = [[BossHomeMainView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
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
