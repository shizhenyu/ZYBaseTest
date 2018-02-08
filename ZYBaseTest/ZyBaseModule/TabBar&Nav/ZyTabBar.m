//
//  ZyTabBar.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "ZyTabBar.h"

@interface ZyTabBar ()

@property (nonatomic,strong) UIImageView *lineImageView;

@end

@implementation ZyTabBar

#pragma mark - life circle 

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self configTabBar];
        
        [self addSubview:self.lineImageView];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    NSArray *subviews = self.subviews;
    
    for (int i = 0;i < subviews.count; i++) {
        
        UIView *subView = [subviews objectAtIndex:i];
        
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            self.lineImageView.center = CGPointMake(subView.center.x, 49-3);
            return;
            
        }
    }
    
}

#pragma mark - Private Method

- (void)configTabBar {
    
    self.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];
    
    self.shadowImage = [UIImage new];
    
    self.layer.shadowColor = [[UIColor zy_colorWithHex:0x000000] colorWithAlphaComponent:0.25].CGColor;
    
    self.layer.shadowRadius = 8;  // 阴影模糊度
    
    self.layer.shadowOpacity = 0.3;  // 阴影透明度
    
    self.layer.shadowOffset = CGSizeMake(0, -2); //阴影偏移距离
}


#pragma mark - Public Method

- (void)setLinePositionWithIndex:(NSInteger)index animated:(BOOL)animated {
    
    NSArray *subviews = self.subviews;
    
    UIView *subView = [subviews objectAtIndex:index + 2];
    
    if (![subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        return;
    }
    
    if (animated) {
        
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self.lineImageView.center = CGPointMake(subView.center.x, 49-3);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }else {
        
        self.lineImageView.center = CGPointMake(subView.center.x, 49-3);
    }
}

#pragma mark - Setter & Getter

- (UIImageView *)lineImageView {
    
    if (!_lineImageView) {
        
        _lineImageView = [UIImageView new];
        
        _lineImageView.bounds = CGRectMake(0, 0, 28, 3);
        
        _lineImageView.backgroundColor = [UIColor clearColor];
    }
    
    return _lineImageView;
}


@end
