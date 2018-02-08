//
//  ProductCommentTableViewCell.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ProductCommentTableViewCell.h"

@interface ProductCommentTableViewCell ()

@property (nonatomic, strong) UIImageView *userHeaderImage;

@property (nonatomic, strong) UILabel *userNameLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UILabel *productDescribeLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *viewCountLabel;

@property (nonatomic, strong, readwrite) UIButton *zanCountLabel;

@end

@implementation ProductCommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
                
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubViewConstraints];
    }
    
    return self;
}

- (void)addSubViewConstraints
{
    [self.userHeaderImage mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(kWidth(15));
        
        make.top.mas_equalTo(kHeight(10));
        
        make.width.height.mas_equalTo(kWidth(40));
        
    }];
    
    self.userHeaderImage.layer.cornerRadius = kWidth(20);
    self.userHeaderImage.layer.masksToBounds = YES;
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self.userHeaderImage.mas_trailing).offset(kWidth(8));
        
        make.top.equalTo(self.userHeaderImage.mas_top);
        
        make.trailing.mas_lessThanOrEqualTo(self.timeLabel.mas_leading);
        
        make.height.equalTo(self.userHeaderImage.mas_height).multipliedBy(0.5);
        
    }];
    
    [self.productDescribeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.userNameLabel.mas_leading);
        
        make.top.equalTo(self.userNameLabel.mas_bottom);
        
        make.trailing.mas_equalTo(kWidth(-15));
        
        make.height.equalTo(self.userHeaderImage.mas_height).multipliedBy(0.5);

    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.mas_equalTo(kWidth(-15));
        
        make.top.equalTo(self.userHeaderImage.mas_top);
        
        make.leading.mas_greaterThanOrEqualTo(self.userNameLabel.mas_leading);
        
        make.height.mas_equalTo(kHeight(15));
        
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(kWidth(15));
        
        make.trailing.mas_equalTo(kWidth(-15));
        
        make.top.equalTo(self.productDescribeLabel.mas_bottom).offset(kHeight(5));
        
        
    }];
    
    [self.zanCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.trailing.mas_equalTo(kWidth(-15));
        
        make.top.equalTo(self.contentLabel.mas_bottom).offset(kHeight(5));
        
        make.width.mas_equalTo(kWidth(70));
        
        make.bottom.mas_equalTo(-5);
        
    }];
    
    [self.viewCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self.zanCountLabel.mas_leading).offset(kWidth(-15));
        
        make.top.equalTo(self.contentLabel.mas_bottom).offset(kHeight(5));
                        
        make.bottom.mas_equalTo(-5);
        
    }];
}

#pragma mark - Setter && Getter
- (UIImageView *)userHeaderImage {
    
    if (!_userHeaderImage) {
        
        _userHeaderImage = [[UIImageView alloc]init];
        
        [self.contentView addSubview:_userHeaderImage];
        
    }
    
    return _userHeaderImage;
}

- (UILabel *)userNameLabel {
    
    if (!_userNameLabel) {
        
        _userNameLabel = [[UILabel alloc]init];
        
        _userNameLabel.textColor = [UIColor blackColor];
        
        _userNameLabel.font = kFont(16);
        
        [_userNameLabel setContentCompressionResistancePriority:251 forAxis:UILayoutConstraintAxisHorizontal];
        
        [self.contentView addSubview:_userNameLabel];
        
    }
    
    return _userNameLabel;
}

- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        
        _timeLabel = [[UILabel alloc]init];
        
        _timeLabel.textColor = [UIColor zy_colorWithRed:138 green:138 blue:138];
        
        _timeLabel.font = kFont(15);
        
        [_timeLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [self.contentView addSubview:_timeLabel];
        
    }
    
    return _timeLabel;
}

- (UILabel *)productDescribeLabel {
    
    if (!_productDescribeLabel) {
        
        _productDescribeLabel = [[UILabel alloc]init];
        
        _productDescribeLabel.textColor = [UIColor zy_colorWithRed:138 green:138 blue:138];
        
        _productDescribeLabel.font = kFont(16);
        
        _productDescribeLabel.numberOfLines = 0;
        
        [self.contentView addSubview:_productDescribeLabel];
        
    }
    
    return _productDescribeLabel;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc]init];
        
        _contentLabel.textColor = [UIColor blackColor];
        
        _contentLabel.numberOfLines = 0;
        
        _contentLabel.font = kFont(16);
        
        [self.contentView addSubview:_contentLabel];
        
    }
    
    return _contentLabel;
}

- (UILabel *)viewCountLabel {
    
    if (!_viewCountLabel) {
        
        _viewCountLabel = [[UILabel alloc]init];
        
        _viewCountLabel.textColor = [UIColor zy_colorWithRed:138 green:138 blue:138];
        
        _viewCountLabel.font = kFont(15);
        
        _viewCountLabel.textAlignment = NSTextAlignmentRight;
        
        [_viewCountLabel setContentCompressionResistancePriority:251 forAxis:UILayoutConstraintAxisHorizontal];
        
        [self.contentView addSubview:_viewCountLabel];
        
    }
    
    return _viewCountLabel;
}

- (UIButton *)zanCountLabel {
    
    if (!_zanCountLabel) {
        
        _zanCountLabel = [UIButton new];
        
        [_zanCountLabel setTitleColor:[UIColor zy_colorWithRed:138 green:138 blue:138] forState:UIControlStateNormal];
        
        _zanCountLabel.titleLabel.font = kFont(15);
        
        [_zanCountLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [self.contentView addSubview:_zanCountLabel];
    }
    
    return _zanCountLabel;
}

- (void)setModel:(ProductCommentModel *)model
{
    _model = model;
    
    [self.userHeaderImage sd_setImageWithURL:[NSURL URLWithString:model.userAvatar] placeholderImage:[UIImage imageWithColor:[UIColor cyanColor]]];
    
    self.userNameLabel.text = model.userName;
    self.productDescribeLabel.text = model.productDescribe;
    
    self.timeLabel.text = model.comment_time;
    
    self.contentLabel.text = model.content;
    
    self.viewCountLabel.text = [NSString stringWithFormat:@"%@浏览过",model.viewCount];
    
    [self.zanCountLabel setTitle:[NSString stringWithFormat:@"%@赞过",model.zanCount] forState:UIControlStateNormal];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
