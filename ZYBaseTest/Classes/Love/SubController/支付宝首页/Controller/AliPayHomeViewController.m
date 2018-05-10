//
//  AliPayHomeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/10.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AliPayHomeViewController.h"
#import "ImageTopTitleBottomButton.h"
#import "AliPayHomeTableView.h"

CGFloat const functionHeaderViewHeight = 95;
CGFloat const singleAppHeaderViewHeight = 60;

CGFloat const topOffsetY = functionHeaderViewHeight + singleAppHeaderViewHeight;

@interface AliPayHomeViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, strong) UIView *navView;

@property (nonatomic, strong) UIView *mainNavView;

@property (nonatomic, strong) UIView *coverNavView;

@property (nonatomic, strong) UIView *functionHeaderView;

@property (nonatomic, strong) AliPayHomeTableView *mainTableView;

@property (nonatomic, strong) UIView *appHeaderView;

@property (nonatomic, strong) UIView *headerView;

@end

@implementation AliPayHomeViewController

#pragma mark - 生命周期
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self updateContentSize:self.mainTableView.contentSize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

#pragma mark - 设置导航栏
- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setHidden:YES];
}

#pragma mark - 初始化视图
- (void)setupUI {
    
    [self.view addSubview:self.mainScrollView];
    [self.view addSubview:self.navView];
    [self.view addSubview:self.mainNavView];
    [self.view addSubview:self.coverNavView];
    
    [self.mainScrollView addSubview:self.headerView];
    [self.headerView addSubview:self.functionHeaderView];
    [self.headerView addSubview:self.appHeaderView];
    [self.mainScrollView addSubview:self.mainTableView];
    
    kWeakSelf
    self.mainTableView.changeContentSize = ^(CGSize contentSize) {
      
        [weakSelf updateContentSize:contentSize];
    };
    
    self.mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [weakSelf.mainTableView.mj_footer endRefreshing];
            [weakSelf.mainTableView reloadData];
        });
        
    }];
}


#pragma mark - 当tableView的contentSize改变时 对应的修改主界面的frame
- (void)updateContentSize:(CGSize)size {
    
    CGSize contentSize = size;
    contentSize.height = contentSize.height + topOffsetY;
    self.mainScrollView.contentSize = contentSize;
    
    CGRect newFrame = self.mainTableView.frame;
    newFrame.size.height = size.height;
    self.mainTableView.frame = newFrame;
}

#pragma mark - FunctionView 执行的动画
- (void)functionViewAnimation:(CGFloat)offsetY {
    
    if (offsetY > functionHeaderViewHeight / 2.0) {
        
        [self.mainScrollView setContentOffset:CGPointMake(0, 95) animated:YES];
        
    }else {
        
        [self.mainScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    CGFloat y = scrollView.contentOffset.y;
    
    if (y < -65) {
        
        [self.mainTableView.mj_header beginRefreshing];
        
    }else if (y > 0 && y <= functionHeaderViewHeight) {
        
        [self functionViewAnimation:y];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat y = scrollView.contentOffset.y;
    
    if (y <= 0) {
        
        self.mainNavView.alpha = 1;
        self.coverNavView.alpha = 0;
        
        CGRect newFrame = self.headerView.frame;
        newFrame.origin.y = y;
        self.headerView.frame = newFrame;
        
        newFrame = self.mainTableView.frame;
        newFrame.origin.y = y + topOffsetY;
        self.mainTableView.frame = newFrame;
        
        //偏移量给到tableview，tableview自己来滑动
        [self.mainTableView setScrollViewContentOffSet:CGPointMake(0, y)];
        
        //功能区状态回归
        newFrame = self.functionHeaderView.frame;
        newFrame.origin.y = 0;
        self.functionHeaderView.frame = newFrame;
        
    }else if (y < functionHeaderViewHeight && y > 0) {
        
        //处理功能区隐藏和视差
        CGRect newFrame = self.functionHeaderView.frame;
        newFrame.origin.y = y/2;
        self.functionHeaderView.frame = newFrame;
        
        //处理透明度
        CGFloat alpha = (1 - y/functionHeaderViewHeight*2.5 ) > 0 ? (1 - y/functionHeaderViewHeight*2.5 ) : 0;
        
        self.functionHeaderView.alpha = alpha;
        
        if (alpha > 0.5) {
            
            CGFloat newAlpha =  alpha*2 - 1;
            
            self.mainNavView.alpha = newAlpha;
            
            self.coverNavView.alpha = 0;
            
        }else {
            
            CGFloat newAlpha =  alpha*2;
            
            self.mainNavView.alpha = 0;
            
            self.coverNavView.alpha = 1 - newAlpha;
        }
        
    }
}
#pragma mark - 懒加载
- (UIScrollView *)mainScrollView {
    
    if (!_mainScrollView) {
        
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
        
        _mainScrollView.delegate = self;
        
        _mainScrollView.contentSize = CGSizeMake(kScreenWidth, kWidth(100));
        
        _mainScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(kWidth(155), 0, 0, 0);
    }
    
    return _mainScrollView;
}

- (UIView *)navView {
    
    if (!_navView) {
        
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight)];
        
        _navView.backgroundColor = [UIColor zy_colorWithRed:65 green:128 blue:255];
    }
    
    return _navView;
}

- (UIView *)mainNavView {
    
    if (!_mainNavView) {
        
        _mainNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight)];
        
        _mainNavView.backgroundColor = [UIColor clearColor];
        
        UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [payButton setImage:kImage(@"home_bill_320") forState:UIControlStateNormal];
        [payButton setTitle:@"账单" forState:UIControlStateNormal];
        payButton.titleLabel.font = kFont(kWidth(13));
        payButton.titleEdgeInsets = UIEdgeInsetsMake(0, kWidth(10), 0, 0);
        [payButton sizeToFit];
        
        CGRect newFrame = payButton.frame;
        newFrame.origin.y = kWidth(20) + kWidth(10);
        newFrame.origin.x = kWidth(10);
        newFrame.size.width = CGRectGetWidth(payButton.frame) + kWidth(10);
        payButton.frame = newFrame;
        
        [_mainNavView addSubview:payButton];
    }
    
    return _mainNavView;
}

- (UIView *)coverNavView {
    
    if (!_coverNavView) {
        
        _coverNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight)];
        
        _coverNavView.backgroundColor = [UIColor clearColor];
        
        UIButton *scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [scanButton setImage:kImage(@"scan_mini") forState:UIControlStateNormal];
        [scanButton sizeToFit];
        
        CGRect newFrame = scanButton.frame;
        newFrame.origin.y = kWidth(20) + kWidth(10);
        newFrame.origin.x = kWidth(10);
        newFrame.size.width = newFrame.size.width + kWidth(10);
        scanButton.frame = newFrame;
        
        UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [codeButton setImage:kImage(@"pay_mini") forState:UIControlStateNormal];
        [codeButton sizeToFit];
        
        newFrame.origin.x = newFrame.origin.x + kWidth(40) + newFrame.size.width;
        codeButton.frame = newFrame;
        
        UIButton *memberButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [memberButton setImage:kImage(@"camera_mini") forState:UIControlStateNormal];
        [memberButton sizeToFit];
        
        newFrame.origin.x = newFrame.origin.x + kWidth(40) + newFrame.size.width;
        memberButton.frame = newFrame;
        
        [_coverNavView addSubview:scanButton];
        [_coverNavView addSubview:codeButton];
        [_coverNavView addSubview:memberButton];
        
        _coverNavView.alpha = 0;
    }
    
    return _coverNavView;
}

- (UIView *)functionHeaderView {
    
    if (!_functionHeaderView) {
        
        _functionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, functionHeaderViewHeight)];
        _functionHeaderView.backgroundColor = [UIColor clearColor];
        
        CGFloat padding = 5.0;
        CGFloat buttonWidth = kScreenWidth / 4.0 - padding*2;
        
        ImageTopTitleBottomButton *scanButton = [ImageTopTitleBottomButton buttonWithType:UIButtonTypeCustom];
        scanButton.frame = CGRectMake(padding, padding, buttonWidth, buttonWidth);
        [scanButton setImage:kImage(@"home_scan") forState:UIControlStateNormal];
        [scanButton setTitle:@"扫一扫" forState:UIControlStateNormal];
        scanButton.titleLabel.font = kFont(kWidth(14));
        
        ImageTopTitleBottomButton *payButton = [ImageTopTitleBottomButton buttonWithType:UIButtonTypeCustom];
        payButton.frame = CGRectMake(padding + kScreenWidth / 4.0, padding, buttonWidth, buttonWidth);
        [payButton setImage:kImage(@"home_pay") forState:UIControlStateNormal];
        [payButton setTitle:@"付款" forState:UIControlStateNormal];
        payButton.titleLabel.font = kFont(kWidth(14));
        
        ImageTopTitleBottomButton *cardButton = [ImageTopTitleBottomButton buttonWithType:UIButtonTypeCustom];
        cardButton.frame = CGRectMake(padding + kScreenWidth / 4.0 * 2, padding, buttonWidth, buttonWidth);
        [cardButton setImage:kImage(@"home_card") forState:UIControlStateNormal];
        [cardButton setTitle:@"卡券" forState:UIControlStateNormal];
        cardButton.titleLabel.font = kFont(kWidth(14));
        
        ImageTopTitleBottomButton *xiuButton = [ImageTopTitleBottomButton buttonWithType:UIButtonTypeCustom];
        xiuButton.frame = CGRectMake(padding + kScreenWidth / 4.0 * 3, padding, buttonWidth, buttonWidth);
        [xiuButton setImage:kImage(@"home_xiu") forState:UIControlStateNormal];
        [xiuButton setTitle:@"到位" forState:UIControlStateNormal];
        xiuButton.titleLabel.font = kFont(kWidth(14));
        
        [_functionHeaderView addSubview:scanButton];
        [_functionHeaderView addSubview:payButton];
        [_functionHeaderView addSubview:cardButton];
        [_functionHeaderView addSubview:xiuButton];
    }
    
    return _functionHeaderView;
}

- (AliPayHomeTableView *)mainTableView {
    
    if (!_mainTableView) {
        
        CGFloat originY = functionHeaderViewHeight + singleAppHeaderViewHeight;
        CGFloat tableViewHeight = kWidth(1000) - originY;
        
        _mainTableView = [[AliPayHomeTableView alloc] initWithFrame:CGRectMake(0, originY, kScreenWidth, tableViewHeight) style:UITableViewStylePlain];
        _mainTableView.scrollEnabled = NO;
    }
    
    return _mainTableView;
}

- (UIView *)appHeaderView {
    
    if (!_appHeaderView) {
        
        _appHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, functionHeaderViewHeight, kScreenWidth, singleAppHeaderViewHeight)];
        _appHeaderView.backgroundColor = [UIColor orangeColor];
    }
    
    return _appHeaderView;
}

- (UIView *)headerView {
    
    if (!_headerView) {
        
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, functionHeaderViewHeight + singleAppHeaderViewHeight)];
        
        _headerView.backgroundColor = [UIColor zy_colorWithRed:65 green:128 blue:255];
    }
    
    return _headerView;
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
