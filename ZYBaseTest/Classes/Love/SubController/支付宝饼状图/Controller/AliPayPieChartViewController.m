//
//  AliPayPieChartViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/23.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AliPayPieChartViewController.h"
#import "YBPieView.h"

#define Color(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface AliPayPieChartViewController ()<YBPieViewDelegate, YBPieViewDataSource>

@property (nonatomic, strong) YBPieView *cView;

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) NSArray *colorArray;

@end

@implementation AliPayPieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"支付宝饼状图";
}

- (void)setupUI
{
    self.datas = [NSMutableArray arrayWithArray:@[@10,@15,@50,@25]];
    self.colorArray =  [NSArray arrayWithObjects:Color(240, 230, 140, 1),Color(255, 215, 0, 1),Color(0, 206, 209, 1),Color(255, 160, 122, 1),Color(127, 255, 212, 1),nil];
    
    YBPieView *chart = [[YBPieView alloc] initWithFrame:CGRectMake(60, 50, 250, 250)];
    [self.view addSubview:chart];
    chart.delegate = self;
    chart.dataSource = self;
    chart.animationDuration = 0.5;
    [chart reloadData];
    self.cView = chart;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//        if (self.datas.count) {
//            [self.datas removeAllObjects];
//        } else {
//            self.datas = [NSMutableArray arrayWithArray:@[@10,@15,@23,@45,@35]];
//        }
//        [self.cView reloadData];
}

#pragma mark - PieView Delegate
- (void)pieChart:(YBPieView *)pieChart didSelectAtIndex:(NSInteger)index
{
    NSLog(@"你选中的是%ld",index);
}

#pragma mark - PieView Data Source

- (NSUInteger)numberOfSlicesInPieChart:(YBPieView *)pieChart {
    return self.datas.count;
}

- (CGFloat)pieChart:(YBPieView *)pieChart valueForSliceAtIndex:(NSUInteger)index {
    return [self.datas[index] intValue];
}

- (UIColor *)pieChart:(YBPieView *)pieChart colorForSliceAtIndex:(NSUInteger)index {
    return self.colorArray[index];
}

- (NSString *)pieChart:(YBPieView *)pieChart imageNameForSliceAtIndex:(NSUInteger)index {
    NSArray *imageArray = @[@"1",@"2",@"4",@"5"];
    return imageArray[index];
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
