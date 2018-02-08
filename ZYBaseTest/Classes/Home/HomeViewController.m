//
//  HomeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            UIViewController *TFVC = [NSClassFromString(@"TextFieldPlaceholderViewController") new];
            
            [self.navigationController pushViewController:TFVC animated:YES];
        }
            break;
        case 1:
        {
            UIViewController *goodCommentListVC = [NSClassFromString(@"GoodCommentListViewController") new];
            
            [self.navigationController pushViewController:goodCommentListVC animated:YES];
        }
            break;
        case 2:
        {
            UIViewController *orderListVC = [NSClassFromString(@"OrderListViewController") new];
            
            [self.navigationController pushViewController:orderListVC animated:YES];
        }
            break;
        case 3:
        {
            UIViewController *reportVC = [NSClassFromString(@"ReportViewController") new];
            
            [self.navigationController pushViewController:reportVC animated:YES];
        }
            break;
        case 4:
        {
            UIViewController *customAlertVC = [NSClassFromString(@"CustomAlertViewController") new];
            
            [self.navigationController pushViewController:customAlertVC animated:YES];
        }
            break;
        case 5:
        {
            UIViewController *LandScapeVC = [NSClassFromString(@"LandScapeViewController") new];
            LandScapeVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:LandScapeVC animated:YES];
        }
            break;
        case 6:
        {
            UIViewController *MBProgressVC = [NSClassFromString(@"MBProgressHUDViewController") new];
            
            [self.navigationController pushViewController:MBProgressVC animated:YES];
        }
            break;
            
        case 7:
        {
            UIViewController *timeVC = [NSClassFromString(@"TimeTransformToolViewController") new];
            
            [self.navigationController pushViewController:timeVC animated:YES];
        }
            
        default:
            break;
    }
}

#pragma mark - Lazy Load
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc]initWithObjects:@"TextField的placeholder水印居中", @"商品评论", @"订单列表", @"自定义举报弹框", @"自定义弹框", @"强制横屏", @"封装MBProgressHud", @"日期转换工具", nil];
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
