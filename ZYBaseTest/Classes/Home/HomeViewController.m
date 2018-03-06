//
//  HomeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "HomeViewController.h"
#import "ZYWaterflowLayout.h"
#import "ZYCollectionViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) NSMutableArray *viewControllerIdentifier;

@end

@implementation HomeViewController

#pragma mark - Life Cycle
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UserPressTouch object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    
    [self addObserverForUserPressTouch];
}

- (void)setupUI
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - 观察用户的3D Touch交互通知
- (void)addObserverForUserPressTouch {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressTouchAction:) name:UserPressTouch object:nil];
}

#pragma mark - 3D Touch快捷进入
- (void)pressTouchAction:(NSNotification *)notifi {
    
    if ([ZYUserManager userIsLogin]) {
       
        // 用户已经登录的情况
        
        // 将要push过去的VC的name
        NSString *VCName = [notifi.userInfo objectForKey:@"VCName"];
        
        // 当前navigationVC下的topviewController的name
        NSString *desenVCName = NSStringFromClass([self.navigationController.topViewController class]);
        
        // 如果将要push的界面已经存在，则不做任何操作，否则会造成无限压栈的问题
        if (![VCName isEqualToString:desenVCName]) {
            
            UIViewController *vc = [NSClassFromString(VCName) new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }else {
        
        // 用户暂未登录，请先登录
        ViewController *vc = [[ViewController alloc] init];
        [vc Action_toLoginViewController];
    }
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
    if (indexPath.row == 11) {
        
        ZYWaterflowLayout *flowLayout = [[ZYWaterflowLayout alloc] init];
        
        ZYCollectionViewController *collectionVC = [[ZYCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
        
        [self.navigationController pushViewController:collectionVC animated:YES];
        
    }else {
        
        NSString *viewControllerId = [self.viewControllerIdentifier objectAtIndex:indexPath.row];
        
        UIViewController *VC = [NSClassFromString(viewControllerId) new];
        
        [self.navigationController pushViewController:VC animated:YES];
        
    }
}

#pragma mark - Lazy Load
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc]initWithObjects:@"TextField的placeholder水印居中", @"商品评论", @"订单列表", @"自定义举报弹框", @"自定义弹框", @"强制横屏", @"封装MBProgressHud", @"日期转换工具", @"不同位置的图片button", @"WebViewAndH5交互", @"界面之间连续Push", @"自定义瀑布流", nil];
    }
    
    return _dataSource;
}

- (NSMutableArray *)viewControllerIdentifier {
    
    if (!_viewControllerIdentifier) {
        
        _viewControllerIdentifier = [[NSMutableArray alloc]initWithObjects:@"TextFieldPlaceholderViewController", @"GoodCommentListViewController", @"OrderListViewController", @"ReportViewController", @"CustomAlertViewController", @"LandScapeViewController", @"MBProgressHUDViewController", @"TimeTransformToolViewController", @"ImageButtonViewController", @"WebViewAndHtmlViewController", @"PushHomeViewController", @"ZYCollectionViewController", nil];
    }
    
    return _viewControllerIdentifier;
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
