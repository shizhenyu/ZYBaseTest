//
//  TopMenuTableViewCell.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/26.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "TopMenuTableViewCell.h"

@interface TopMenuTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation TopMenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubViewConstraints];
    }
    
    return self;
}

- (void)addSubViewConstraints
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(kWidth(15));
        
        make.top.mas_equalTo(kWidth(23));
        
        make.trailing.mas_equalTo(kWidth(-15));
        
        make.height.mas_equalTo(kWidth(16));
        
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(kWidth(15));
        
        make.trailing.mas_equalTo(kWidth(-15));
        
        make.bottom.mas_equalTo(0);
        
        make.height.mas_equalTo(kWidth(1));
        
    }];
}

#pragma mark - Setter && Getter
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = @"2016年9月";
        
        _titleLabel.textColor = [UIColor zy_colorWithHex:0x383838];
        
        _titleLabel.font = kFont(kWidth(16));
        
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UIView *)bottomLineView {
    
    if (!_bottomLineView) {
        
        _bottomLineView = [[UIView alloc] init];
        
        _bottomLineView.backgroundColor = [UIColor zy_colorWithHex:0xdddddd];
        
        [self.contentView addSubview:_bottomLineView];
    }
    
    return _bottomLineView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
