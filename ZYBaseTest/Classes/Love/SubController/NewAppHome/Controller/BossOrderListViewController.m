//
//  BossOrderListViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/7/5.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "BossOrderListViewController.h"

@interface BossOrderListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BossOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"订单列表";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    }
    
    NSString *orderTime = [self.dataSource objectAtIndex:indexPath.row];
    
    cell.textLabel.text = orderTime;
    
    cell.detailTextLabel.text = [self dateTimeDifferenceWithOrderStartTime:orderTime];
    
    return cell;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc] initWithObjects:
                       @"2018-07-06 14:55:17",
                       @"2018-07-06 14:45:17",
                       @"2018-07-06 14:35:11",
                       @"2018-07-06 13:45:07",
                       @"2018-07-06 13:33:41",
                       @"2018-07-05 18:51:21",
                       @"2018-07-05 14:27:18",
                       @"2018-07-05 13:56:17",
                       @"2018-07-05 13:23:17",
                       @"2018-07-02 15:47:11",
                       @"2018-06-30 14:58:07",
                       @"2018-06-29 10:33:41",
                       @"2018-06-23 15:51:21",
                       @"2018-06-05 14:27:18", nil];
    }
    
    return _dataSource;
}

- (NSString *)dateTimeDifferenceWithOrderStartTime:(NSString *)orderTime {
    
    NSDateFormatter *formatter = [NSDateFormatter shareInstance];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *orderDate = [formatter dateFromString:orderTime];
    
    NSDate *now = [NSDate date];
    NSString *nowDateStr = [formatter stringFromDate:now];
    NSDate *nowDate = [formatter dateFromString:nowDateStr];
    
    NSTimeInterval orderValue = [nowDate timeIntervalSince1970] - [orderDate timeIntervalSince1970];
    
    NSString *timeStr = @"";
    long temp = 0;
    
    if (orderValue < 60) { // 小于60秒
        
        timeStr = @"刚刚";
        
    }else if ((temp = orderValue / 60) < 60) { // 小于一个小时
        
        timeStr = [NSString stringWithFormat:@"%ld分钟前", temp];
        
    }else if ((temp = temp / 60) < 24) { // 小于一天
        
        timeStr = [NSString stringWithFormat:@"%ld小时前", temp];
        
    }else if ((temp = temp / 24) < 30) { // 小于一个月
        
        timeStr = [NSString stringWithFormat:@"%ld天前", temp];
    }else {
        
        timeStr = orderTime;
    }
    
    return timeStr;
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
