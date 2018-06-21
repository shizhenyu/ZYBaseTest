//
//  GoodCommentListViewController.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "GoodCommentListViewController.h"
#import "ProductCommentTableViewCell.h"
#import "ProductCommentMainViewModel.h"
#import "ReportView.h"
#import "GoodCommentDetailViewController.h"

@interface GoodCommentListViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ProductCommentMainViewModel *viewModel;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation GoodCommentListViewController

- (void)dealloc {
    
    [ZYNotification removeObserver:self name:@"changeCommentUserName" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
    
    [self fetchData];
    
    [ZYNotification addObserver:self selector:@selector(reloadTableViewDataIfChangedData) name:@"changeCommentUserName" object:nil];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"商品评论列表";
}

- (void)setupUI
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - Load Data
- (void)fetchData
{    
    self.dataSource = [self.viewModel fetchProcommentData];
    
    [self.dataSource addObjectsFromArray:self.dataSource];
    
    [self.tableView reloadData];
}

- (void)reloadTableViewDataIfChangedData {
    
    [self.tableView reloadData];
}


#pragma mark - Cell Event Response
- (void)buttonClick:(UIButton *)sender
{    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    CGRect frame = [sender convertRect:sender.bounds toView:window];
    
    [ReportView showViewWithContainerViewFrame:frame];
}

#pragma mark - TableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCommentTableViewCell" forIndexPath:indexPath];
    
    cell.model = [self.dataSource objectAtIndex:indexPath.row];
    
    cell.zanCountLabel.tag = indexPath.row + 10;
    
    [cell.zanCountLabel addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
  
    // 注册3D Touch
    /**
     从iOS9开始，我们可以通过这个类来判断运行程序对应的设备是否支持3D Touch功能。
     
     UIForceTouchCapabilityUnknown = 0, //未知
     UIForceTouchCapabilityUnavailable = 1, //不可用
     UIForceTouchCapabilityAvailable = 2 // 可用
     
     */
    if ([self respondsToSelector:@selector(traitCollection)]) {
        
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
            
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
                
                [self registerForPreviewingWithDelegate:(id)self sourceView:cell];
            }
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodCommentDetailViewController *commentDetailVC = [[GoodCommentDetailViewController alloc] init];
    
    commentDetailVC.model = [self.dataSource objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:commentDetailVC animated:YES];
}


#pragma mark - UIViewControllerPreviewingDelegate
// 3D Touch时预览的界面
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    // 找到点击的是哪个Cell
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(ProductCommentTableViewCell *)[previewingContext sourceView]];
    
    // 创建要预览的控制器
    GoodCommentDetailViewController *commentDetailVC = [[GoodCommentDetailViewController alloc] init];
    
    commentDetailVC.model = [self.dataSource objectAtIndex:indexPath.row];
    
    commentDetailVC.dataSource = self.dataSource;
    
    commentDetailVC.indexPath = indexPath.row;
    
    // 指定当前上下文视图rect
    CGRect rect = CGRectMake(0, 0, kScreenWidth, 300);
    
    previewingContext.sourceRect = rect;
    
    return commentDetailVC;
}

// 深度按压之后跳转的界面
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    [self showViewController:viewControllerToCommit sender:self];
}

#pragma mark - Lazy Load
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor whiteColor];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        // 它会返回一个估计高度，有了这个方法后，tableview会先调用它获取估计高度，然后获取cell，最后获取真实高度。
        // estimatedHeightForRowAtIndexPath的返回值可以随意，返回多少都可以，只是给tableview一个安慰而已，让它延迟获取真实的高度
        _tableView.estimatedRowHeight = 44.f;
        
        [_tableView registerClass:[ProductCommentTableViewCell class] forCellReuseIdentifier:@"ProductCommentTableViewCell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (ProductCommentMainViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[ProductCommentMainViewModel alloc]init];
        
    }
    
    return _viewModel;
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
