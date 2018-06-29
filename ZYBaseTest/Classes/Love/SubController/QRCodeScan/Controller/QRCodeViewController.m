//
//  QRCodeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/28.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "QRCodeViewController.h"
#import "QRCodeShowViewController.h"

@interface QRCodeViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
    
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"二维码生成与扫描";
}

- (void)setupUI {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            QRCodeShowViewController *codeShowVC = [[QRCodeShowViewController alloc] init];
            codeShowVC.qrCodeString = @"https://github.com/shizhenyu";
            codeShowVC.isShowLogo = NO;
            [self.navigationController pushViewController:codeShowVC animated:YES];
        }
            break;
        case 1:
        {
            QRCodeShowViewController *codeShowVC = [[QRCodeShowViewController alloc] init];
            codeShowVC.qrCodeString = @"https://github.com/shizhenyu";
            codeShowVC.isShowLogo = YES;
            [self.navigationController pushViewController:codeShowVC animated:YES];
        }
            break;
        case 2:
        {
            UIViewController *qrCodeScanVC = [NSClassFromString(@"QRCodeScanViewController") new];
            [self.navigationController pushViewController:qrCodeScanVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc] initWithObjects:@"普通二维码", @"带logo的二维码", @"二维码扫描", nil];
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
