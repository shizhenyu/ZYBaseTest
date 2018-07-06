//
//  MemberHomeTypesReusableView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/29.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MemberHomeTypesReusableView.h"

@interface MemberHomeTypesReusableView ()

@property (nonatomic, strong) UIView *redLineView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MemberHomeTypesReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self.redLineView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.leading.mas_equalTo(kWidth(15));
            
            make.centerY.mas_equalTo(0);
            
            make.width.mas_equalTo(kWidth(5));
            
            make.height.mas_equalTo(kWidth(16));
            
        }];
        
        self.redLineView.layer.cornerRadius = kWidth(5 / 2.0);
        self.redLineView.layer.masksToBounds = YES;
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.leading.equalTo(self.redLineView.mas_trailing).offset(kWidth(5));
            
            make.centerY.equalTo(self.redLineView.mas_centerY);
            
            make.trailing.mas_equalTo(kWidth(-15));
            
            make.height.mas_equalTo(kWidth(16));
            
        }];
        
    }
    return self;
}

- (UIView *)redLineView {
    
    if (!_redLineView) {
        
        _redLineView = [[UIView alloc] init];
        
        _redLineView.backgroundColor = [UIColor zy_colorWithRed:24 green:47 blue:93];
        
        [self addSubview:_redLineView];
    }
    
    return _redLineView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = @"会员数据";
        
        _titleLabel.font = kFont(16);
        
        _titleLabel.textColor = [UIColor zy_colorWithHex:0x333434];
        
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (void)setTitleStr:(NSString *)titleStr {
    
    _titleStr = titleStr;
    
    self.titleLabel.text = titleStr;
}

@end
