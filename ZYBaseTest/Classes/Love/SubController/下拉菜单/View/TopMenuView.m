//
//  TopMenuView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "TopMenuView.h"
#import "TopMenuTableViewCell.h"

#define MPTextColor [UIColor zy_colorWithHex:0x888888]
#define MPSelectTextColor  [UIColor zy_colorWithHex:0x00a2ac]

@interface TopMenuView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *topLineView;

@property (nonatomic, strong) UIButton *monthButton;

@property (nonatomic, strong) UIButton *statusButton;

@property (nonatomic, strong) UIButton *bgButton;

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) BOOL isChooseTime;

@end

@implementation TopMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
                
        [self addSubViewConstraints];
    }
    return self;
}

- (void)addSubViewConstraints
{
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.top.trailing.mas_equalTo(0);
        
        make.height.mas_equalTo(kWidth(1));
        
    }];
    
    [self.monthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.topLineView.mas_bottom);
        
        make.centerX.equalTo(self).multipliedBy(0.5);
        
        make.width.mas_equalTo(kScreenWidth/2.0);
        
        make.height.mas_equalTo(kWidth(43));
        
    }];
    
    [self.statusButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.monthButton.mas_top);
        
        make.centerX.equalTo(self).multipliedBy(1.5);
        
        make.width.equalTo(self.monthButton.mas_width);
        
        make.height.mas_equalTo(self.monthButton.mas_height);
        
    }];
    
    [self.bgButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.trailing.mas_equalTo(0);
        
        make.top.mas_equalTo(kWidth(44)+64);
        
        make.bottom.mas_equalTo(0);
        
    }];

    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.top.trailing.mas_equalTo(0);
        
        make.height.mas_equalTo(0);
        
    }];
}

#pragma mark - Button Event Response
- (void)buttonClick:(UIButton *)sender
{
    if (sender == self.monthButton) {
        
        self.isChooseTime = YES;
        self.dataSource = _titleArr1;
        
        self.monthButton.selected = YES;
        self.statusButton.selected = NO;
        
    }else {
        
        self.isChooseTime = NO;
        self.dataSource = _titleArr2;
        
        self.monthButton.selected = NO;
        self.statusButton.selected = YES;
    }
    
    [self.listTableView reloadData];
    
    [self show];
}

- (void)show
{
    self.bgButton.hidden = NO;
    
    [self layoutIfNeeded];
    
    CGFloat tableHeight = kWidth(60)*self.dataSource.count;
    
    [self.listTableView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.leading.trailing.top.mas_equalTo(0);
        
        make.height.mas_equalTo(tableHeight);
        
    }];
    
    [UIView animateWithDuration:0.3 delay:0.01 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [self.bgButton layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hide
{
    [self.listTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.leading.trailing.top.mas_equalTo(0);
        
        make.height.mas_equalTo(0);
        
    }];
    
    [UIView animateWithDuration:0.2 delay:0.01 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [self layoutIfNeeded];
//        [self.bgButton layoutIfNeeded]; //消失有个缩小的动画
        
    } completion:^(BOOL finished) {
        
      self.bgButton.hidden = YES;
    }];
}
#pragma mark - TableView Delegate && DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopMenuTableViewCell" forIndexPath:indexPath];
    
    cell.titleStr = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titleStr = [self.dataSource objectAtIndex:indexPath.row];
    
    if (self.isChooseTime) {
        
        [self.monthButton setTitle:titleStr forState:UIControlStateNormal];
        self.monthButton.selected = NO;
        
    }else {
        
        [self.statusButton setTitle:titleStr forState:UIControlStateNormal];
        self.statusButton.selected = NO;

    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(topMenuViewDidSelectedIndex:selectedTitle:)]) {
        
        [self.delegate topMenuViewDidSelectedIndex:indexPath.row selectedTitle:titleStr];
    }
    
    [self hide];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kWidth(60);
}

#pragma mark - Setter && Getter
- (UIView *)topLineView {
    
    if (!_topLineView) {
        
        _topLineView = [[UIView alloc] init];
        
        _topLineView.backgroundColor = [UIColor zy_colorWithHex:0xcccccc];
        
        [self addSubview:_topLineView];
    }
    
    return _topLineView;
}

- (UIButton *)monthButton {
    
    if (!_monthButton) {
        
        _monthButton = [UIButton new];
        
        _monthButton.backgroundColor = [UIColor whiteColor];
        
        [_monthButton setTitleColor:MPTextColor forState:UIControlStateNormal];
        
        [_monthButton setTitleColor:MPSelectTextColor forState:UIControlStateSelected];
        
        [_monthButton setTitle:@"近三个月" forState:UIControlStateNormal];
        
        _monthButton.titleLabel.font = kFont(kWidth(16));
        
        [_monthButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_monthButton];
    
    }
    
    return _monthButton;
}

- (UIButton *)statusButton {
    
    if (!_statusButton) {
        
        _statusButton = [UIButton new];
        
        _statusButton.backgroundColor = [UIColor whiteColor];
        
        [_statusButton setTitleColor:MPTextColor forState:UIControlStateNormal];
        
        [_statusButton setTitleColor:MPSelectTextColor forState:UIControlStateSelected];
        
        [_statusButton setTitle:@"收益" forState:UIControlStateNormal];
        
        _statusButton.titleLabel.font = kFont(kWidth(16));
        
        [_statusButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_statusButton];
        
    }
    
    return _statusButton;
}

- (UIButton *)bgButton {
    
    if (!_bgButton) {
        
        _bgButton = [UIButton new];
        
        _bgButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        _bgButton.hidden = YES;
        
        [_bgButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        
        [[UIApplication sharedApplication].keyWindow addSubview:_bgButton];
    }
    
    return _bgButton;
}

- (UITableView *)listTableView {
    
    if (!_listTableView) {
        
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _listTableView.tableFooterView = [UIView new];
        
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _listTableView.delegate = self;
        
        _listTableView.dataSource = self;
        
        [_listTableView registerClass:[TopMenuTableViewCell class] forCellReuseIdentifier:@"TopMenuTableViewCell"];
        
        [self.bgButton addSubview:_listTableView];
    }
    
    return _listTableView;
}
- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc] init];
    }
    
    return _dataSource;
}

- (void)setTitleArr1:(NSMutableArray *)titleArr1 {
    
    _titleArr1 = titleArr1;
}

- (void)setTitleArr2:(NSMutableArray *)titleArr2 {
    
    _titleArr2 = titleArr2;
}

@end
