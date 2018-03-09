//
//  PieChartViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "PieChartViewController.h"
#import "XYPieChartView.h"

@interface PieChartViewController ()<PieChartDelegate>

@property (nonatomic, strong) XYPieChartView *pieChartView;
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) NSMutableArray *typeArr;
@property (nonatomic, strong) NSMutableArray *precentArr;
@property (nonatomic, strong) NSMutableArray *colorArr;

@end

@implementation PieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

#pragma mark - 设置导航栏
- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"饼状图";
}

- (void)setupUI
{
    CGRect pieChartFrame = CGRectMake(kWidth(50), 30, kScreenWidth - kWidth(100), 300);
    
    self.pieChartView = [[XYPieChartView alloc] initWithFrame:pieChartFrame withPieChartTypeArray:self.typeArr withPercentArray:self.precentArr withColorArray:self.colorArr];
    
    self.pieChartView.delegate = self;
    
    // 当有一项数据的百分比小于你所校验的数值时，会将该项数值百分比移出饼图展示（校验数值从0~100）
    [self.pieChartView setCheckLessThanPercent:0.1];
    
    // 刷新加载
    [self.pieChartView reloadChart];
    
    // 设置圆心标题 （NSString类型）
//    [self.pieChartView setAmountText:@"总交易"];
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"总交易量"];
    
    // 设置圆心标题（NSMutableAttributedString类型）
    [self.pieChartView setTitleText:str];
    
    [self.view addSubview:self.pieChartView];
    
    self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth(15), 330, kScreenWidth - kWidth(30), 30)];
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    self.detailLabel.backgroundColor = [UIColor orangeColor];
    self.detailLabel.font = kFont(15);
    [self.view addSubview:self.detailLabel];
}

#pragma mark - PieChartDelegate

#pragma mark - 选中扇形的回调数据
- (void)selectedFinish:(XYPieChartView *)pieChartView index:(NSInteger)index selectedType:(NSDictionary *)selectedType {
    
    NSString *type = [selectedType objectForKey:@"title"];
    NSString *total = [selectedType objectForKey:@"totalMoney"];
    NSString *amount = [selectedType objectForKey:@"amount"];
    
    NSString *needString = [NSString stringWithFormat:@"类型:%@--金额:%@--笔数:%@", type, total, amount];
    
    self.detailLabel.text = needString;
    
}

#pragma mark - 点击中心按钮的回调
- (void)onCenterClick:(XYPieChartView *)PieChartView {
    
    NSLog(@"查看总的交易量");
}

#pragma mark - Lazy Load
- (NSMutableArray *)typeArr {
    
    if (!_typeArr) {
        
        NSDictionary *dic1 = @{@"title":@"微信支付", @"totalMoney":@"1457", @"amount":@"18"};
        NSDictionary *dic2 = @{@"title":@"支付宝", @"totalMoney":@"1500", @"amount":@"20"};
        NSDictionary *dic3 = @{@"title":@"QQ钱包", @"totalMoney":@"357", @"amount":@"7"};
        NSDictionary *dic4 = @{@"title":@"现金/其他", @"totalMoney":@"200", @"amount":@"2"};
        
        _typeArr = [[NSMutableArray alloc] initWithObjects:dic1, dic2, dic3, dic4, nil];
    }
    
    return _typeArr;
}

- (NSMutableArray *)precentArr {
    
    if (!_precentArr) {
        
        _precentArr = [[NSMutableArray alloc] initWithObjects:@"40", @"45", @"15", @"5", nil];
    }
    
    return _precentArr;
}

- (NSMutableArray *)colorArr {
    
    if (!_colorArr) {
        
        UIColor *weixinColor = [UIColor zy_colorWithRed:125 green:207 blue:21];
        UIColor *aLiColor = [UIColor zy_colorWithRed:221 green:203 blue:103];
        UIColor *qqColor = [UIColor zy_colorWithRed:253 green:171 blue:41];
        UIColor *otherColor = [UIColor zy_colorWithRed:72 green:197 blue:252];
        
        _colorArr = [[NSMutableArray alloc] initWithObjects:weixinColor, aLiColor, qqColor, otherColor, nil];
    }
    
    return _colorArr;
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
