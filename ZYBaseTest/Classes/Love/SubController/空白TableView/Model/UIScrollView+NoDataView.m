//
//  UIScrollView+NoDataView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "UIScrollView+NoDataView.h"
#import <objc/runtime.h>

@implementation UIScrollView (NoDataView)

static const char ShowNoDataViewKey = 's';
static const char NoDataImageNameKey = 'i';
static const char NoDataTipStrKey = 't';

#pragma mark - 自定义的创建table的init方法
- (instancetype)zy_InitWithFrame:(CGRect)frame {
    
    [self zy_InitWithFrame:frame];
    
    if (self) {
        
        UIView *noDataContainerView = [[UIView alloc] init];
        noDataContainerView.frame = self.bounds;
        noDataContainerView.hidden = YES;
        noDataContainerView.tag = 10;
        [self addSubview:noDataContainerView];
        
        UIImageView *noDataImageView = [[UIImageView alloc] init];
        noDataImageView.center = CGPointMake(self.center.x, self.center.y - 20);
        noDataImageView.bounds = CGRectMake(0, 0, 100, 100);
        noDataImageView.backgroundColor = [UIColor cyanColor];
        noDataImageView.tag = 11;
        [noDataContainerView addSubview:noDataImageView];
        
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.text = @"dads";
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.center = CGPointMake(self.center.x, self.center.y + 90);
        tipLabel.bounds = CGRectMake(0, 0, 120, 30);
        tipLabel.tag = 12;
        [noDataContainerView addSubview:tipLabel];
        
    }
    
    return self;
}

#pragma mark - Setter && Getter
- (void)setIsShowNoDataView:(BOOL)isShowNoDataView {
    
    NSString *show = [NSString stringWithFormat:@"%d", isShowNoDataView];
    
    objc_setAssociatedObject(self, &ShowNoDataViewKey, show, OBJC_ASSOCIATION_ASSIGN);
    
    UIView *containerView = [self viewWithTag:10];
    containerView.hidden = !isShowNoDataView;
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
    
    UILabel *label = [self viewWithTag:12];
    label.text = noDataTipStr;
}

- (NSString *)noDataTipStr {
    
    return objc_getAssociatedObject(self, &NoDataTipStrKey);
}

@end
