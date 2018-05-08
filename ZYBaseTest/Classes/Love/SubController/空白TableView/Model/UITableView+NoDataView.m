//
//  UITableView+NoDataView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "UITableView+NoDataView.h"
#import <objc/runtime.h>

@implementation UITableView (NoDataView)

static const char ShowNoDataViewKey = 's';
static const char NoDataImageNameKey = 'i';
static const char NoDataTipStrKey = 't';

- (void)setIsShowNoDataView:(BOOL)isShowNoDataView {
    
    NSString *show = [NSString stringWithFormat:@"%d", isShowNoDataView];
    
    objc_setAssociatedObject(self, &ShowNoDataViewKey, show, OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isShowNoDataView {
    
    return [objc_getAssociatedObject(self, &ShowNoDataViewKey) boolValue];
}

- (void)setNoDataImageName:(NSString *)noDataImageName {
    
    objc_setAssociatedObject(self, &NoDataImageNameKey, noDataImageName, OBJC_ASSOCIATION_COPY);
}

- (NSString *)noDataImageName {
    
    return objc_getAssociatedObject(self, &NoDataImageNameKey);
}

- (void)setNoDataTipStr:(NSString *)noDataTipStr {
    
    objc_setAssociatedObject(self, &NoDataTipStrKey, noDataTipStr, OBJC_ASSOCIATION_COPY);
}

- (NSString *)noDataTipStr {
    
    return objc_getAssociatedObject(self, &NoDataTipStrKey);
}

#pragma mark - 自定义的创建table的init方法
- (instancetype)zy_tableInitWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    [self zy_tableInitWithFrame:frame style:style];
    
    if (self) {
        
        UIView *noDataContainerView = [[UIView alloc] init];
        noDataContainerView.frame = self.bounds;
        [self addSubview:noDataContainerView];
        
        UIImageView *noDataImageView = [[UIImageView alloc] init];
        noDataImageView.center = CGPointMake(self.center.x, self.center.y - 20);
        noDataImageView.bounds = CGRectMake(0, 0, 100, 100);
        noDataImageView.backgroundColor = [UIColor cyanColor];
        [noDataContainerView addSubview:noDataImageView];
        
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.text = @"dads";
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.center = CGPointMake(self.center.x, self.center.y + 90);
        tipLabel.bounds = CGRectMake(0, 0, 120, 30);
        [noDataContainerView addSubview:tipLabel];
        
    }
    
    return self;
}

#pragma mark - 懒加载

- (void)noDataView {
    
    UIImageView *noDataImageView = [[UIImageView alloc] init];
    
    noDataImageView.center = self.center;
    
    noDataImageView.bounds = CGRectMake(0, 0, 150, 150);
    
    [self addSubview:noDataImageView];
    
    UILabel *tipLabel = [[UILabel alloc] init];
    
    tipLabel.frame = CGRectMake(20, CGRectGetMaxY(noDataImageView.frame) + 10, [UIScreen mainScreen].bounds.size.width - 40, 15);
    
    tipLabel.textColor = [UIColor blackColor];
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:tipLabel];
}
@end
