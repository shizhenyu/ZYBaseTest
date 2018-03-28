//
//  DownMenuViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "DownMenuViewController.h"
#import "TopMenuView.h"

@interface DownMenuViewController ()<UITableViewDelegate, UITableViewDataSource, TopMenuViewDelegate>

@property (nonatomic, strong) TopMenuView *menuView;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DownMenuViewController

#pragma mark - 生命周期
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [self.menuView hide];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor zy_colorWithRed:245 green:245 blue:249];
    
    self.navigationItem.title = @"下拉列表";
}

- (void)setupUI
{
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.top.trailing.mas_equalTo(0);
        
        make.height.mas_equalTo(kHeight(44));
        
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.trailing.mas_equalTo(0);
        
        make.top.equalTo(self.menuView.mas_bottom).offset(kHeight(30));
        
        make.bottom.mas_equalTo(0);
        
    }];
}

- (void)topMenuViewDidSelectedIndex:(NSInteger)index selectedTitle:(NSString *)selectTitle
{
    NSLog(@"你选中的是:%ld--%@", index, selectTitle);
}

#pragma mark - TableView Delegate && DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"今天转翻了哦";
    
    return cell;
}

#pragma mark - 懒加载
- (TopMenuView *)menuView {
    
    if (!_menuView) {
        
        _menuView = [[TopMenuView alloc] init];
        
        _menuView.titleArr1 = [[NSMutableArray alloc] initWithObjects:@"近三个月", @"2018年2月", @"2018年1月", @"2017年12月", @"2017年11月", nil];
        
        _menuView.titleArr2 = [[NSMutableArray alloc] initWithObjects:@"全部", @"转入", @"转出", @"亏损", @"收益", nil];
        
        _menuView.delegate = self;
        
        [self.view addSubview:_menuView];
    }
    
    return _menuView;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        
        [self.view addSubview:_tableView];
        
    }
    
    return _tableView;
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
