//
//  MBProgressHUDViewController.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MBProgressHUDViewController.h"
#import "MBProgressTool.h"

@interface MBProgressHUDViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation MBProgressHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"封装MBProgressHUD";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(barButtonShowCustomProgressView)];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(barButtonShowCustomMessageView)];
    
    self.navigationItem.rightBarButtonItems = @[addButton, refreshButton];
}

#pragma mark - 展示之前封装的简易MB
- (void)barButtonShowCustomProgressView {
    
    ShowMaskStatus(self.view, @"正在加载...");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        DismissHud(self.view);
    });
}

- (void)barButtonShowCustomMessageView {
    
    ShowMessage(self.navigationController.view, @"加载完成");
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectorName = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"selector"];
    
    SEL selector = NSSelectorFromString(selectorName);
    
    SuppressPerformSelectorLeakWarning([self performSelector:selector]);
}

#pragma mark - MB Selectors
- (void)showProgressViewInView {
    
    MBProgressTool *tool = [MBProgressTool sharedMBTool];
    
    [tool showProcessingMessage:@"正在加载" showInView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self showCompleteViewInView];
    });
}
- (void)showWarningViewInView {
    
    MBProgressTool *tool = [MBProgressTool sharedMBTool];
    [tool showWarningMessage:@"使用不规范的名字" showInView:self.view];
}
- (void)showErrorViewInView {
    
    MBProgressTool *tool = [MBProgressTool sharedMBTool];
    [tool showErrorMessage:@"请先登录" showInView:self.view];
}
- (void)showCompleteViewInView {
    
    MBProgressTool *tool = [MBProgressTool sharedMBTool];
    [tool showOkMessage:@"注册完成" showInView:self.view];
}

- (void)showMessageInBottomView {
    
    MBProgressTool *tool = [MBProgressTool sharedMBTool];
    [tool showMessageAboveViewBottom:@"我在底部展示" showInView:self.view];
}

- (void)showMessageInMiddleView {
    
    MBProgressTool *tool = [MBProgressTool sharedMBTool];
    [tool showMessageInViewMiddle:@"我在中间展示" showInView:self.view];
}

- (void)showProcessingViewInWindow {
    
    [[MBProgressTool sharedMBTool] showProcessingMessageInWindow:@"正在加载"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self showCompleteViewInWindow];
    });
}

- (void)showWarningViewInWindow {
    
    [[MBProgressTool sharedMBTool] showWarningMessageInWindow:@"昵称不合法"];
}

- (void)showErrorViewInWindow {
    
    [[MBProgressTool sharedMBTool] showErrorMessageInWindow:@"密码错误"];
}

- (void)showCompleteViewInWindow {
    
    [[MBProgressTool sharedMBTool] showOkMessageInWindow:@"注册完成"];
}

- (void)showMessageInWindowBottom {
    
    [[MBProgressTool sharedMBTool] showMessageAboveWindowBottom:@"我在底部"];
}

- (void)showMessageInWindowMiddle {
    
    [[MBProgressTool sharedMBTool] showMessageInWindowMiddle:@"我在中间"];
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
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
        
        NSDictionary *dic1 = @{@"title":@"指定视图上展示加载视图", @"selector":@"showProgressViewInView"};
        NSDictionary *dic2 = @{@"title":@"指定视图上展示警告视图", @"selector":@"showWarningViewInView"};
        NSDictionary *dic3 = @{@"title":@"指定视图上展示错误视图", @"selector":@"showErrorViewInView"};
        NSDictionary *dic4 = @{@"title":@"指定视图上展示完成视图", @"selector":@"showCompleteViewInView"};
        NSDictionary *dic5 = @{@"title":@"指定视图上底部展示视图", @"selector":@"showMessageInBottomView"};
        NSDictionary *dic6 = @{@"title":@"指定视图上中间展示视图", @"selector":@"showMessageInMiddleView"};
        NSDictionary *dic7 = @{@"title":@"全屏展示加载视图", @"selector":@"showProcessingViewInWindow"};
        NSDictionary *dic8 = @{@"title":@"全屏展示警告视图", @"selector":@"showWarningViewInWindow"};
        NSDictionary *dic9 = @{@"title":@"全屏展示错误视图", @"selector":@"showErrorViewInWindow"};
        NSDictionary *dic10 = @{@"title":@"全屏展示完成视图", @"selector":@"showCompleteViewInWindow"};
        NSDictionary *dic11 = @{@"title":@"在Window底部展示视图", @"selector":@"showMessageInWindowBottom"};
        NSDictionary *dic12 = @{@"title":@"在Window中间展示视图", @"selector":@"showMessageInWindowMiddle"};

        _dataSource = [[NSMutableArray alloc] initWithObjects:dic1, dic2, dic3, dic4, dic5, dic6, dic7, dic8, dic9, dic10, dic11, dic12, nil];
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
