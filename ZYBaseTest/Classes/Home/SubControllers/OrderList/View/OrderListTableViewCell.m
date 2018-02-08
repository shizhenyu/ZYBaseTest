//
//  OrderListTableViewCell.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/5.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "OrderListTableViewCell.h"

@interface OrderListTableViewCell ()

@property (nonatomic, strong) UIView *bgContainerView;

@property (nonatomic, strong) UIImageView *payTypeImage;

@property (nonatomic, strong) UILabel *payTypeLabel;

@property (nonatomic, strong) UILabel *payStatusLabel;

@property (nonatomic, strong) UILabel *moneyLabel;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UIView *separateView1;

@property (nonatomic, strong) UILabel *shopLabel;

@property (nonatomic, strong) UILabel *noteLabel;

@property (nonatomic, strong) UIView *separateView2;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIButton *settingButton;

@end

@implementation OrderListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubViewConstraints];
    }
    
    return self;
}

#pragma mark - Add SubViews Constraints
- (void)addSubViewConstraints
{
    [self.bgContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.trailing.mas_equalTo(0);
        
        make.top.mas_equalTo(0);
        
        make.bottom.mas_equalTo(kHeight(-8));
        
    }];
    
    [self.payTypeImage mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(kHeight(10));
        
        make.leading.mas_equalTo(kWidth(10));
        
        make.width.height.mas_equalTo(kWidth(40));
        
    }];
    
    [self.payTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.payTypeImage.mas_top);
        
        make.leading.equalTo(self.payTypeImage.mas_trailing).offset(kWidth(5));
        
        make.trailing.mas_lessThanOrEqualTo(self.moneyLabel.mas_leading);
        
        make.height.mas_equalTo(18);
        
    }];
    
    [self.payStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.payTypeImage.mas_bottom);
        
        make.leading.equalTo(self.payTypeLabel.mas_leading).offset(3);
        
        make.trailing.mas_lessThanOrEqualTo(self.infoLabel.mas_leading);
        
        make.height.mas_equalTo(15);
        
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.payTypeLabel.mas_centerY);
        
        make.leading.mas_greaterThanOrEqualTo(self.payTypeLabel.mas_trailing);
        
        make.trailing.mas_equalTo(kWidth(-10));
        
        make.height.mas_equalTo(20);
        
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.centerY.equalTo(self.payStatusLabel.mas_centerY);
        
        make.trailing.equalTo(self.moneyLabel.mas_trailing);
        
        make.height.mas_equalTo(16);
        
    }];
    
    [self.separateView1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(12);
        
        make.trailing.mas_equalTo(-12);
        
        make.top.equalTo(self.payTypeImage.mas_bottom).offset(10);
        
        make.height.mas_equalTo(1);
        
    }];
    
    [self.shopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self.payTypeLabel.mas_leading);
        
        make.top.equalTo(self.separateView1.mas_bottom).offset(5);
        
        make.trailing.mas_equalTo(-15);
        
    }];
    
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.shopLabel.mas_leading);
        
        make.trailing.equalTo(self.shopLabel.mas_trailing);
        
        make.top.equalTo(self.shopLabel.mas_bottom);
        
    }];
    
    [self.separateView2 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self.separateView1.mas_leading);
        
        make.trailing.equalTo(self.separateView1.mas_trailing);
        
        make.top.equalTo(self.noteLabel.mas_bottom).offset(5);
        
        make.height.mas_equalTo(1);
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.equalTo(self.payTypeLabel.mas_leading);
        
        make.top.equalTo(self.separateView2.mas_bottom).offset(5);
        
        make.width.mas_equalTo(150);
        
        make.bottom.mas_equalTo(-5);
        
    }];
    
    [self.settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self.moneyLabel.mas_trailing);
        
        make.top.equalTo(self.separateView2.mas_bottom).offset(5);
        
        make.width.mas_equalTo(150);
        
        make.bottom.mas_equalTo(-5);
        
    }];
}

#pragma mark - Setter && Getter
- (UIView *)bgContainerView {
    
    if (!_bgContainerView) {
        
        _bgContainerView = [[UIView alloc]init];
        
        _bgContainerView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_bgContainerView];
    }
    
    return _bgContainerView;
}

- (UIImageView *)payTypeImage {
    
    if (!_payTypeImage) {
        
        _payTypeImage = [[UIImageView alloc]init];
        
        _payTypeImage.backgroundColor = [UIColor cyanColor];
        
        [self.bgContainerView addSubview:_payTypeImage];
    }
    
    return _payTypeImage;
}

- (UILabel *)payTypeLabel {
    
    if (!_payTypeLabel) {
        
        _payTypeLabel = [[UILabel alloc]init];
        
        _payTypeLabel.font = [UIFont systemFontOfSize:17];
        
        [_payTypeLabel setContentCompressionResistancePriority:251 forAxis:UILayoutConstraintAxisHorizontal];
        
        [self.bgContainerView addSubview:_payTypeLabel];
    }
    
    return _payTypeLabel;
}

- (UILabel *)payStatusLabel {
    
    if (!_payStatusLabel) {
        
        _payStatusLabel = [[UILabel alloc]init];
        
        _payStatusLabel.textColor = [UIColor blueColor];
        
        _payStatusLabel.font = [UIFont systemFontOfSize:14];
        
        [self.bgContainerView addSubview:_payStatusLabel];
    }
    
    return _payStatusLabel;
}

- (UILabel *)moneyLabel {
    
    if (!_moneyLabel) {
        
        _moneyLabel = [[UILabel alloc]init];
        
        _moneyLabel.font = [UIFont boldSystemFontOfSize:19];
        
        _moneyLabel.textAlignment = NSTextAlignmentRight;
        
        [_moneyLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [self.bgContainerView addSubview:_moneyLabel];
        
    }
    
    return _moneyLabel;
}

- (UILabel *)infoLabel {
    
    if (!_infoLabel) {
        
        _infoLabel = [[UILabel alloc]init];
        
        _infoLabel.textColor = [UIColor redColor];
        
        _infoLabel.font = [UIFont systemFontOfSize:15];
        
        _infoLabel.textAlignment = NSTextAlignmentRight;
        
        [self.bgContainerView addSubview:_infoLabel];
    }
    
    return _infoLabel;
}

- (UIView *)separateView1 {
    
    if (!_separateView1) {
        
        _separateView1 = [[UIView alloc]init];
        
        _separateView1.backgroundColor = [UIColor zy_colorWithHex:0xdddddd];
        
        [self.bgContainerView addSubview:_separateView1];
    }
    
    return _separateView1;
}

- (UILabel *)shopLabel {
    
    if (!_shopLabel) {
        
        _shopLabel = [[UILabel alloc]init];
        
        _shopLabel.font = [UIFont systemFontOfSize:15];
        
        _shopLabel.numberOfLines = 0;
        
        [self.bgContainerView addSubview:_shopLabel];
    }
    
    return _shopLabel;
}

- (UILabel *)noteLabel {
    
    if (!_noteLabel) {
        
        _noteLabel = [[UILabel alloc]init];
        
        _noteLabel.numberOfLines = 0;
        
        _noteLabel.font = [UIFont systemFontOfSize:15];
        
        [self.bgContainerView addSubview:_noteLabel];
    }
    
    return _noteLabel;
}

- (UIView *)separateView2 {
    
    if (!_separateView2) {
        
        _separateView2 = [[UIView alloc]init];
        
        _separateView2.backgroundColor = [UIColor zy_colorWithHex:0xdddddd];
        
        [self.bgContainerView addSubview:_separateView2];
    }
    
    return _separateView2;
}

- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        
        _timeLabel = [[UILabel alloc]init];
        
        _timeLabel.textColor = [UIColor lightGrayColor];
        
        [self.bgContainerView addSubview:_timeLabel];
    }
    
    return _timeLabel;
}

- (UIButton *)settingButton {
    
    if (!_settingButton) {
        
        _settingButton = [UIButton new];
        
        _settingButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [_settingButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        
        [_settingButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [self.bgContainerView addSubview:_settingButton];
    }
    
    return _settingButton;
}

-(void)setModel:(OrderListModel *)model
{
    _model = model;
    
    self.payTypeLabel.text = @"支付宝支付-收款";
    
    self.payStatusLabel.text = @"收款成功";
    
    self.moneyLabel.text = @"+650";
    
    self.infoLabel.text = @"使用代金券0.01元";
    
    self.timeLabel.text = @"2017-09-21 14:39";
    
    [self.settingButton setTitle:@"设置客户" forState:UIControlStateNormal];
    
    self.shopLabel.text = model.shopnote;
    
    self.noteLabel.text = model.usernote;
    
    if (model.shopnote.length != 0 && model.usernote.length != 0) {
        
        [self.noteLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.shopLabel.mas_bottom).offset(5);
            
        }];
    }
    
    if (model.shopnote.length == 0 && model.usernote.length == 0) {

        [self.shopLabel mas_updateConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.separateView1.mas_bottom);
            
        }];
        
        [self.separateView2 mas_updateConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.noteLabel.mas_bottom);

            make.height.mas_equalTo(0);

        }];

    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
