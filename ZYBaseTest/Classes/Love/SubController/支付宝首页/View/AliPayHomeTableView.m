//
//  AliPayHomeTableView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/10.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AliPayHomeTableView.h"

@interface AliPayHomeTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) NSInteger numberRows;

@end

@implementation AliPayHomeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.mj_header endRefreshing];
                
                [self reloadData];
            });
            
        }];
        
        
    }
    
    return self;
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.numberRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell-%ld", indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidth(50);
}

#pragma mark - Public Method
- (void)loadMoreData {
    
    self.numberRows += 10;
    
    [self reloadData];
    
    self.changeContentSize(self.contentSize);
}
- (void)setScrollViewContentOffSet:(CGPoint)point {
    
    if (!self.mj_header.isRefreshing) {
        
        self.contentOffset = point;
    }
}

#pragma mark - Setter && Getter
- (NSInteger)numberRows {
    
    if (!_numberRows) {
        
        _numberRows = 50;
    }
    
    return _numberRows;
}

@end
