//
//  MemberHomeItemCollectionViewCell.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/29.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MemberHomeItemCollectionViewCell.h"

@interface MemberHomeItemCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *descripeLabel;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UIView *topLineView;

@property (nonatomic, strong) UIView *rightLineView;

@end

@implementation MemberHomeItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self addSubViewConstraints];
    }
    return self;
}

- (void)addSubViewConstraints {
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(0);
        
        make.trailing.mas_equalTo(kWidth(-15));
        
        make.width.height.mas_equalTo(kWidth(35));
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(kWidth(17));
        
        make.leading.mas_equalTo(kWidth(15));
        
        make.trailing.equalTo(self.iconImageView.mas_leading).offset(kWidth(-3));
        
        make.height.mas_equalTo(kWidth(16));
    }];
    
    [self.descripeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kWidth(5));
        
        make.leading.equalTo(self.titleLabel.mas_leading);
        
        make.trailing.equalTo(self.titleLabel.mas_trailing);
        
        make.height.mas_equalTo(kWidth(10));
        
    }];
    
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.top.trailing.mas_equalTo(0);
        
        make.height.mas_equalTo(1);
        
    }];
    
    [self.rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.trailing.bottom.mas_equalTo(0);
        
        make.width.mas_equalTo(1);
        
    }];
}

#pragma mark - Setter && Getter
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = @"会员列表";
        
        _titleLabel.textColor = [UIColor zy_colorWithRed:32 green:125 blue:194];
        
        _titleLabel.font = kFont(16);
        
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UILabel *)descripeLabel {
    
    if (!_descripeLabel) {
        
        _descripeLabel = [[UILabel alloc] init];
        
        _descripeLabel.text = @"会员信息查询";
        
        _descripeLabel.textColor = [UIColor zy_colorWithRed:138 green:138 blue:138];
        
        _descripeLabel.font = kFont(10);
        
        [self.contentView addSubview:_descripeLabel];
    }
    
    return _descripeLabel;
}

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] init];
        
        _iconImageView.image = kImage(@"余利宝");
        
        _iconImageView.layer.cornerRadius = kWidth(35/2.0);
        
        _iconImageView.layer.masksToBounds = YES;
        
        [self.contentView addSubview:_iconImageView];
    }
    
    return _iconImageView;
}

- (UIView *)topLineView {
    
    if (!_topLineView) {
        
        _topLineView = [[UIView alloc] init];
        
        _topLineView.backgroundColor = [UIColor zy_colorWithHex:0xeeeeee];
        
        [self.contentView addSubview:_topLineView];
    }
    
    return _topLineView;
}

- (UIView *)rightLineView {
    
    if (!_rightLineView) {
        
        _rightLineView = [[UIView alloc] init];
        
        _rightLineView.backgroundColor = [UIColor zy_colorWithHex:0xeeeeee];
        
        [self.contentView addSubview:_rightLineView];
    }
    
    return _rightLineView;
}

- (void)setInfoDic:(NSDictionary *)infoDic {
    
    _infoDic = infoDic;
    
    self.titleLabel.text = infoDic[@"title"];
    
    self.descripeLabel.text = infoDic[@"des"];
    
    self.iconImageView.image = kImage(infoDic[@"icon"]);
}

- (void)hideRightLineView {
    
    self.rightLineView.hidden = YES;
}
@end
