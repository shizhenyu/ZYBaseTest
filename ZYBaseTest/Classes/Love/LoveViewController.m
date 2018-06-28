//
//  LoveViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "LoveViewController.h"
#import "QuickBuyTabBarViewController.h"
#import "JSTabBarViewController.h"

@interface LoveViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *titleArr;

@property (nonatomic, strong) NSMutableArray *viewControllerArr;

@end

@implementation LoveViewController

#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

#pragma mark - Init UI
- (void)setupUI
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}
#pragma mark - tableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 7) {
        
        QuickBuyTabBarViewController *tabBarVC = [[QuickBuyTabBarViewController alloc] init];
                
        [self.navigationController.navigationBar setHidden:YES];
        
        [self.tabBarController.tabBar setHidden:YES];
        
        [self.navigationController pushViewController:tabBarVC animated:YES];
        
    }else if (indexPath.row == 11) {
        
        JSTabBarViewController *jsTabBarVC = [[JSTabBarViewController alloc] init];
        
        [self.navigationController.navigationBar setHidden:YES];
        
        [self.tabBarController.tabBar setHidden:YES];
        
        [self.navigationController pushViewController:jsTabBarVC animated:YES];

    }else {
        
        NSString *className = [self.viewControllerArr objectAtIndex:indexPath.row];
        
        UIViewController *classVC = [NSClassFromString(className) new];
        
        [self.navigationController pushViewController:classVC animated:YES];
    }
}

#pragma mark - Lazy Load
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

- (NSMutableArray *)titleArr {
    
    if (!_titleArr) {
        
        _titleArr = [[NSMutableArray alloc] initWithObjects:@"照片选择器",
                     @"支付宝饼状图",
                     @"滚动轮播图",
                     @"下拉列表",
                     @"个人信息",
                     @"二维码扫描",
                     @"PerformSelector",
                     @"闪购小程序And Try Catch",
                     @"支付宝首页",
                     @"不规则标签集合",
                     @"语音播报",
                     @"简书APP",
                     @"YYText", nil];
    }
    
    return _titleArr;
}

- (NSMutableArray *)viewControllerArr {
    
    if (!_viewControllerArr) {
        
        _viewControllerArr = [[NSMutableArray alloc] initWithObjects:@"PhotoPickerHomeViewController",
                              @"AliPayPieChartViewController",
                              @"ScrollingViewController",
                              @"DownMenuViewController",
                              @"PersonInfoViewController",
                              @"ThreadUseViewController",
                              @"NoDataViewController",
                              @"",
                              @"AliPayHomeViewController",
                              @"TipGatherViewController",
                              @"VoiceSpeakViewController",
                              @"JSTabBarController",
                              @"YYTextViewController",  nil];
    }
    
    return _viewControllerArr;
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
