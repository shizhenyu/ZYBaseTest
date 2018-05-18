//
//  TipGatherViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "TipGatherViewController.h"
#import "QQPopMenuView.h"
#import "TipGatherTableViewCell.h"

@interface TipGatherViewController ()<UITableViewDelegate, UITableViewDataSource, TipGatherTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation TipGatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.navigationItem.title = @"不规则标签集合";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navRightButtonClick:)];
    self.navigationItem.rightBarButtonItem = addItem;
}

- (void)navRightButtonClick:(UIButton *)button {
    
    NSArray *arr = @[@{@"icon":@"发起讨论", @"title":@"发起讨论"},
                     @{@"icon":@"扫描名片", @"title":@"扫描名片"},
                     @{@"icon":@"写日报", @"title":@"写日报"},
                     @{@"icon":@"外勤签到", @"title":@"外勤签到"}];
    
    QQPopMenuView *menuView = [[QQPopMenuView alloc] initWithItems:arr width:130 trianglePoint:CGPointMake(kScreenWidth - 30, kNavigationBarHeight + 5) action:^(NSInteger index) {
       
        NSLog(@"选中第%ld个", index);
    }];
    
    [menuView show];
    
}

- (void)setupUI {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - tableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipGatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipGatherTableViewCell"];
    
    cell.delegate = self;
    
    cell.tipArr = self.dataSource[indexPath.row];
    
    cell.indexPath_Row = indexPath.row;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipGatherTableViewCell *cell = (TipGatherTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cell.cellHeight;
}

#pragma mark - TipGatherTableViewCell
- (void)didSelectedIndexPathRow:(NSInteger)selectRow tipTag:(NSInteger)selectTag {
    
    NSString *str = [[self.dataSource objectAtIndex:selectRow] objectAtIndex:selectTag];
    
    NSLog(@"选中%@", str);
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        [_tableView registerClass:[TipGatherTableViewCell class] forCellReuseIdentifier:@"TipGatherTableViewCell"];
        
        [self.view addSubview:_tableView];
        
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc]init];
        
        NSArray *arr1 = @[@"文艺青年",@"极品吃货",@"逗比",@"叛逆",@"安静",@"中二少年",@"行为艺术死忠粉",@"肌肉男"];
        NSArray *arr2 = @[@"打羽毛球",@"读书",@"看电影",@"滑雪",@"打游戏",@"装扮行为艺术",@"踢足球",@"听音乐"];
        NSArray *arr3 = @[@"保险业",@"采矿",@"能源",@"餐饮",@"公益组织",@"卫生和社会工作",@"文教体育用品制造",@"IT行业",@"商务服务",@"企业管理服务"];
        NSArray *arr4 = @[@"OC",@"Java",@"JavaScript",@"jQuery",@"Python",@"C++",@"Swift",@"PHP",@"网站开发",@"WebStorem",@"Objective-C",@"Kolthn",@"Android",@"塞班",@"CF"];
        
        [_dataSource addObject:arr1];
        [_dataSource addObject:arr2];
        [_dataSource addObject:arr3];
        [_dataSource addObject:arr4];
        [_dataSource addObject:arr1];
        [_dataSource addObject:arr2];
        [_dataSource addObject:arr3];
        [_dataSource addObject:arr4];
        [_dataSource addObject:arr1];
        [_dataSource addObject:arr2];
        [_dataSource addObject:arr3];
        [_dataSource addObject:arr4];
        [_dataSource addObject:arr1];
        [_dataSource addObject:arr2];
        [_dataSource addObject:arr3];
        [_dataSource addObject:arr4];
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
