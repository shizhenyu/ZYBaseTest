//
//  BossHomeMainView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/30.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "BossHomeMainView.h"
#import "ImageTopTitleBottomButton.h"
#import "BossHomeTypeItemHeaderView.h"
#import "BossHomeNewsHeaderView.h"
#import "BossHomeAdverHeaderView.h"
#import "BossHomeItemHeaderView.h"

@interface BossHomeMainView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BossHomeMainView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
        self.tableHeaderView = [self getTableViewHeaderView];
        
        self.delegate = self;
        
        self.dataSource = self;
        
        [self registerClass:[BossHomeTypeItemHeaderView class] forHeaderFooterViewReuseIdentifier:@"BossHomeTypeItemHeaderView"];
        
        [self registerClass:[BossHomeNewsHeaderView class] forHeaderFooterViewReuseIdentifier:@"BossHomeNewsHeaderView"];
        
        [self registerClass:[BossHomeAdverHeaderView class] forHeaderFooterViewReuseIdentifier:@"BossHomeAdverHeaderView"];
        
        [self registerClass:[BossHomeItemHeaderView class] forHeaderFooterViewReuseIdentifier:@"BossHomeItemHeaderView"];
        
        [self registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"UITableViewHeaderFooterView"];
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
    }
    
    return self;
}

- (UIView *)getTableViewHeaderView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kWidth(80))];
    
    view.backgroundColor = [UIColor zy_colorWithRed:24 green:47 blue:93];
    
    NSArray *iconArr = @[@"pressTouch_scan", @"pressTouch_refund", @"pressTouch_cardVoucher", @"pressTouch_member"];
    NSArray *titleArr = @[@"扫码收款", @"退款", @"卡券核销", @"会员充值"];
    
    NSMutableArray *buttonArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < iconArr.count; i ++) {
        
        ImageTopTitleBottomButton *button = [ImageTopTitleBottomButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:kImage(iconArr[i]) forState:UIControlStateNormal];
        
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = kFont(15);
        
        [buttonArr addObject:button];
        
        [view addSubview:button];
    }
    
    [buttonArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:kWidth(70) leadSpacing:kWidth(15) tailSpacing:kWidth(15)];
    
    [buttonArr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(kWidth(3));
        
        make.bottom.mas_equalTo(kWidth(-3));
        
    }];
   
    return view;
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0 || section == 1 || section == 2) {
        
        return 0;
    }
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld", indexPath.section, indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kWidth(60);
}

#pragma mark - UITableView SectionHeaderView && SectionFooterView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        BossHomeTypeItemHeaderView *typeHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"BossHomeTypeItemHeaderView"];
        
        return typeHeaderView;
        
    }else if (section == 1) {
        
        BossHomeNewsHeaderView *newsHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"BossHomeNewsHeaderView"];
        
        return newsHeaderView;
        
    }else if (section == 2) {
        
        BossHomeAdverHeaderView *adversHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"BossHomeAdverHeaderView"];
        
        return adversHeaderView;
        
    }else {
        
        BossHomeItemHeaderView *itemHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"BossHomeItemHeaderView"];
        
        itemHeaderView.titleStr = @"实收数据";
        
        return itemHeaderView;
    }
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
    
    footerView.contentView.backgroundColor = [UIColor zy_colorWithHex:0xf7f9fa];
    
    return footerView;
}

#pragma mark - UITableView SectionHeaderView Height && SectionFooterView Height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return kWidth(140) + 5;
    }else if (section == 3) {
        
        
        return kWidth(39);
    }
    
    return kWidth(60);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return kWidth(15);
}


@end
