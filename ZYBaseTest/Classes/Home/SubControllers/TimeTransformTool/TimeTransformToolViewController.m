//
//  TimeTransformToolViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/8.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "TimeTransformToolViewController.h"
#import "TimeTransformTool.h"

@interface TimeTransformToolViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation TimeTransformToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"日期转换工具";
}

- (void)setupUI
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray *str = [[TimeTransformTool sharedTimeTool] fetchLastMonthBeginAndEndTime];
    
    NSLog(@"%@",str);
}

#pragma mark - AlertView
- (void)showAlertViewWithMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NSArray *arr = [[TimeTransformTool sharedTimeTool] fetchTodayBeginAndEndTime];
            
            NSString *beginTime = arr[0];
            NSString *endTime = arr[1];
            
            NSString *showMessage = [NSString stringWithFormat:@"开始时间:%@\n结束时间:%@",beginTime,endTime];
            
            [self showAlertViewWithMessage:showMessage];
        }
            break;
        case 1:
        {
            NSArray *arr = [[TimeTransformTool sharedTimeTool] fetchYesterdayBeginAndEndTime];
            
            NSString *beginTime = arr[0];
            NSString *endTime = arr[1];
            
            NSString *showMessage = [NSString stringWithFormat:@"开始时间:%@\n结束时间:%@",beginTime,endTime];
            
            [self showAlertViewWithMessage:showMessage];
        }
            break;
        case 2:
        {
            NSArray *arr = [[TimeTransformTool sharedTimeTool] fetchWeekdayBeginAndEndTime];
            
            NSString *beginTime = arr[0];
            NSString *endTime = arr[1];
            
            NSString *showMessage = [NSString stringWithFormat:@"开始时间:%@\n结束时间:%@",beginTime,endTime];
            
            [self showAlertViewWithMessage:showMessage];
        }
            break;
        case 3:
        {
            NSArray *arr = [[TimeTransformTool sharedTimeTool] fetchThisMonthBeginAndEndTime];
            
            NSString *beginTime = arr[0];
            NSString *endTime = arr[1];
            
            NSString *showMessage = [NSString stringWithFormat:@"开始时间:%@\n结束时间:%@",beginTime,endTime];
            
            [self showAlertViewWithMessage:showMessage];
        }
            break;
        case 4:
        {
            NSArray *arr = [[TimeTransformTool sharedTimeTool] fetchLastMonthBeginAndEndTime];
            
            NSString *beginTime = arr[0];
            NSString *endTime = arr[1];
            
            NSString *showMessage = [NSString stringWithFormat:@"开始时间:%@\n结束时间:%@",beginTime,endTime];
            
            [self showAlertViewWithMessage:showMessage];
        }
            break;
            
            case 5:
        {
            NSTimeInterval timeStamp = 1518177781;
            
            NSString *str = [[TimeTransformTool sharedTimeTool] timeStatusWithTimeStamp:timeStamp];
            
            [self showAlertViewWithMessage:str];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Lazy Load
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]init];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc]initWithObjects:@"今天的时间", @"昨天的时间", @"前七天的时间", @"这个月的时间", @"上个月的时间", @"多久之前", nil];
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
