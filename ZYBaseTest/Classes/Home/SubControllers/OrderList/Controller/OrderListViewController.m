//
//  OrderListViewController.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/5.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "OrderListViewController.h"
#import "OrderListTableViewCell.h"
#import "OrderListViewModel.h"

@interface OrderListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation OrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
    
    [self createData];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"订单列表";
}

- (void)setupUI
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}
- (void)createData
{
    self.dataSource = [[NSMutableArray alloc]init];
    
    OrderListViewModel *viewModel = [[OrderListViewModel alloc]init];
    
    self.dataSource = [viewModel fetchOrderListData];
    
    [self.tableView reloadData];
}

#pragma mark - TableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderListTableViewCell" forIndexPath:indexPath];
    
    cell.model = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - Lazy Load
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor whiteColor];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.estimatedRowHeight = 50;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[OrderListTableViewCell class] forCellReuseIdentifier:@"OrderListTableViewCell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}
- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc]init];
        
    }
    
    return _dataSource;
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
