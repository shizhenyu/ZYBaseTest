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
#import "ZyNavigationController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) NSMutableArray *viewControllerIdentifier;

@end

@implementation HomeViewController

#pragma mark - Life Cycle
- (void)dealloc {
    
    [ZYNotification removeObserver:self name:kUserPressTouch object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    [ZYNotification addObserver:self selector:@selector(pressTouchAction:) name:kUserPressTouch object:nil];
}

#pragma mark - 3D Touch快捷进入
- (void)pressTouchAction:(NSNotification *)notifi {

    if ([ZYUserManager userIsLogin]) {  // 如果已经登录，则跳转到对应的VC
        
        // 将要push的VC的name
        NSString *destinationVCName = [notifi.userInfo objectForKey:@"VCName"];
        
        if ([destinationVCName isEqualToString:@"SettingViewController"]) {  // 点击的是个人中心的设置
            
            // 先将之前的其他tabBar的跳转到首页
            ZyNavigationController *homeNav = [self.tabBarController.viewControllers firstObject];
            [homeNav popToRootViewControllerAnimated:NO];
            
            [self.tabBarController setSelectedIndex:3]; //先跳转tabBar
            
            // 取出以MineViewController为根视图的nav，以后就用这个nav去实现跳转
            ZyNavigationController *nav = [self.tabBarController.viewControllers objectAtIndex:3];
            
            // 当前navigationVC下的topviewController的name
            NSString *currentVCName = NSStringFromClass([nav.topViewController class]);
            
            if ([currentVCName isEqualToString:@"MineViewController"]) {
                
                // 当前的navigationVC下的topViewController是rootVC, 可以直接push，不存在无限入栈的情况
                
                UIViewController *destinationVC = [NSClassFromString(destinationVCName) new];
                [nav pushViewController:destinationVC animated:YES];
                
            }else {  // 如果当前的navigationVC下的topViewController不是rootVC，pop到rootVC
                
                [nav popToRootViewControllerAnimated:NO]; // 先pop到根视图，防止无限入栈的bug
                
                UIViewController *destinationVC = [NSClassFromString(destinationVCName) new];
                [nav pushViewController:destinationVC animated:YES];
                
            }
            
        }else {  // 点击的是首页中的几个选项
            
            // 先将之前的其他tabBar的跳转到首页
            ZyNavigationController *mineNav = [self.tabBarController.viewControllers objectAtIndex:3];
            [mineNav popToRootViewControllerAnimated:NO];
            
            [self.tabBarController setSelectedIndex:0];
            
            // 取出以HomeViewController为根视图的nav，以后就用这个nav去实现跳转
            ZyNavigationController *nav = [self.tabBarController.viewControllers firstObject];
            
            // 当前navigationVC下的topviewController的name
            NSString *currentVCName = NSStringFromClass([nav.topViewController class]);
            
            if ([currentVCName isEqualToString:NSStringFromClass([HomeViewController class])]) {
                
                // 当前的navigationVC下的topViewController是rootVC, 可以直接push，不存在无限入栈的情况
                    
                UIViewController *destinationVC = [NSClassFromString(destinationVCName) new];
                [nav pushViewController:destinationVC animated:YES];
                
            }else {  // 如果当前的navigationVC下的topViewController不是rootVC，pop到rootVC
                
                [nav popToRootViewControllerAnimated:NO];

                UIViewController *destinationVC = [NSClassFromString(destinationVCName) new];
                [nav pushViewController:destinationVC animated:YES];
            }
        }
        
    }else {  // 如果没有登录，则跳转到登录界面
        
        ViewController *mainVC = [[ViewController alloc] init];
        
        [mainVC Action_toLoginViewController];
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
    if (indexPath.row == 12) {
        
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
        
        _tableView.backgroundColor = [UIColor whiteColor];
        
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc]initWithObjects:@"TextField的placeholder水印居中", @"商品评论", @"订单列表", @"自定义举报弹框", @"自定义弹框", @"强制横屏", @"封装MBProgressHud", @"日期转换工具", @"不同位置的图片button", @"WebViewAndH5交互", @"饼状图", @"界面之间连续Push", @"自定义瀑布流", @"绑定收款码", @"KVC&&KVO", nil];
    }
    
    return _dataSource;
}

- (NSMutableArray *)viewControllerIdentifier {
    
    if (!_viewControllerIdentifier) {
        
        _viewControllerIdentifier = [[NSMutableArray alloc]initWithObjects:@"TextFieldPlaceholderViewController", @"GoodCommentListViewController", @"OrderListViewController", @"ReportViewController", @"CustomAlertViewController", @"LandScapeViewController", @"MBProgressHUDViewController", @"TimeTransformToolViewController", @"ImageButtonViewController", @"WebViewAndHtmlViewController", @"PieChartViewController", @"PushHomeViewController", @"ZYCollectionViewController", @"BindQRCodeViewController", @"KVOViewController", nil];
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
