//
//  BindCodeStatusView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/12.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "BindCodeStatusView.h"

@interface BindCodeStatusView ()

@property (nonatomic, strong) UIButton *bgButton;

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIImageView *qrCodeImageView;

@property (nonatomic, strong) UILabel *qrCodeNumLabel;

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *merchantLabel;

@property (nonatomic, strong) UILabel *cashierLabel;

@property (nonatomic, strong) UIButton *confirmButton;

@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, assign) StatusType statusType;

@property (nonatomic, weak) MASConstraint *containerWidthCons;

@property (nonatomic, weak) MASConstraint *containerHeightCons;

@end

@implementation BindCodeStatusView

#pragma mark - Init Method
+ (instancetype)shareStatusViewWithType:(StatusType)type
{
    BindCodeStatusView *statusView = [[BindCodeStatusView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) withType:type];
    
    return statusView;
}

- (instancetype)initWithFrame:(CGRect)frame withType:(StatusType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.statusType = type;
        
        if (self.statusType == StatusTypeNoAccess) {
            
            self.merchantLabel.text = @"此码已绑定，你无权查看该信息";
        }
        
        [self addSubViewConstraints];
    }
    return self;
}

#pragma mark - 添加约束
- (void)addSubViewConstraints {
    
    switch (self.statusType) {
            
        case StatusTypeBind:
        {
            [self.bgButton mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.edges.mas_equalTo(0);
                
            }];
            
            [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.center.mas_equalTo(0);
                
                self.containerWidthCons = make.width.mas_equalTo(0);
                
                self.containerHeightCons = make.height.mas_equalTo(0);
                
            }];
            
            [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.centerX.mas_equalTo(0);
                
                make.top.mas_equalTo(kWidth(24));
                
                make.width.height.mas_equalTo(kWidth(111/3.0));
                
            }];
            
            [self.qrCodeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.qrCodeImageView.mas_bottom).offset(kWidth(16));
                
                make.height.mas_equalTo(19);
                
            }];
            
            [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.qrCodeNumLabel.mas_bottom).offset(kWidth(15));
                
                make.height.mas_equalTo(16);
                
            }];
            
            [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.statusLabel.mas_bottom).offset(kWidth(12));
                
                make.height.mas_equalTo(1);
                
            }];
            
            [self.merchantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.lineView.mas_bottom).offset(kWidth(24));
                
                make.height.mas_equalTo(16);
                
            }];
            
            [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.centerX.equalTo(self.bgImageView).multipliedBy(0.5);
                
                make.top.equalTo(self.merchantLabel.mas_bottom).offset(kWidth(22));
                
                make.width.mas_equalTo(kWidth(334/3.0));
                
                make.height.mas_equalTo(kWidth(94/3.0));
                
            }];
            
            [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.centerX.equalTo(self.bgImageView).multipliedBy(1.5);
                
                make.top.equalTo(self.confirmButton.mas_top);
                
                make.width.equalTo(self.confirmButton.mas_width);
                
                make.height.equalTo(self.confirmButton.mas_height);
            }];
        }
            break;
            
        case StatusTypeUnBind:
        {
            [self.bgButton mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(0);
                
            }];
            
            [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.center.mas_equalTo(0);
                
                self.containerWidthCons = make.width.mas_equalTo(0);
                
                self.containerHeightCons = make.height.mas_equalTo(0);
                
            }];
            
            [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.centerX.mas_equalTo(0);
                
                make.top.mas_equalTo(kHeight(24));
                
                make.width.height.mas_equalTo(kWidth(111/3.0));
                
            }];
            
            [self.qrCodeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.qrCodeImageView.mas_bottom).offset(kWidth(16));
                
                make.height.mas_equalTo(19);
                
            }];
            
            [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.qrCodeNumLabel.mas_bottom).offset(kWidth(15));
                
                make.height.mas_equalTo(16);
                
            }];
            
            [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.statusLabel.mas_bottom).offset(kWidth(12));
                
                make.height.mas_equalTo(1);
                
            }];
            
            [self.merchantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.lineView.mas_bottom).offset(kWidth(24));
                
                make.height.mas_equalTo(16);
                
            }];
            
            [self.cashierLabel mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.centerX.equalTo(self.merchantLabel.mas_centerX);
                
                make.top.equalTo(self.merchantLabel.mas_bottom).offset(kWidth(10));
                
                make.width.mas_equalTo(self.merchantLabel.mas_width);
                
                make.height.mas_equalTo(self.merchantLabel.mas_height);
                
            }];
            
            [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.centerX.equalTo(self.bgImageView).multipliedBy(0.5);
                
                make.top.equalTo(self.cashierLabel.mas_bottom).offset(kWidth(18));
                
                make.width.mas_equalTo(kWidth(334/3.0));
                
                make.height.mas_equalTo(kWidth(94/3.0));
                
            }];
            
            [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.centerX.equalTo(self.bgImageView).multipliedBy(1.5);
                
                make.top.equalTo(self.confirmButton.mas_top);
                
                make.width.equalTo(self.confirmButton.mas_width);
                
                make.height.equalTo(self.confirmButton.mas_height);
            }];
        }
            break;
            
        case StatusTypeNoAccess:
        {
            [self.bgButton mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(0);
                
            }];
            
            [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.center.mas_equalTo(0);
                
                self.containerWidthCons = make.width.mas_equalTo(0);
                
                self.containerHeightCons = make.height.mas_equalTo(0);
                
            }];
            
            [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.centerX.mas_equalTo(0);
                
                make.top.mas_equalTo(kHeight(24));
                
                make.width.height.mas_equalTo(kWidth(111/3.0));
                
            }];
            
            [self.qrCodeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.qrCodeImageView.mas_bottom).offset(kWidth(16));
                
                make.height.mas_equalTo(19);
                
            }];
            
            [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.qrCodeNumLabel.mas_bottom).offset(kWidth(15));
                
                make.height.mas_equalTo(16);
                
            }];
            
            [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.statusLabel.mas_bottom).offset(kWidth(12));
                
                make.height.mas_equalTo(1);
                
            }];
            
            [self.merchantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.trailing.mas_equalTo(0);
                
                make.top.equalTo(self.lineView.mas_bottom).offset(kWidth(24));
                
                make.height.mas_equalTo(16);
                
            }];
            
            [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.centerX.equalTo(self.bgImageView).multipliedBy(1);
                
                make.top.equalTo(self.merchantLabel.mas_bottom).offset(kWidth(22));
                
                make.width.mas_equalTo(kWidth(334/3.0));
                
                make.height.mas_equalTo(kWidth(94/3.0));
                
            }];
        
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Public Method
- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    [window addSubview:self];
    
    [self layoutIfNeeded];
    
    switch (self.statusType) {
        case StatusTypeBind:
        {
            [self.bgImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                self.containerWidthCons = make.width.mas_equalTo(kWidth(1026/3.0));
                
                self.containerHeightCons = make.height.mas_equalTo(kWidth(762/3.0));
                
            }];
            
        }
            break;
            
        case StatusTypeUnBind:
        {
            [self.bgImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                self.containerWidthCons = make.width.mas_equalTo(kWidth(1026/3.0));
                
                self.containerHeightCons = make.height.mas_equalTo(kWidth(820/3.0));
                
            }];
        }
            break;
            
        case StatusTypeNoAccess:
        {
            [self.bgImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                self.containerWidthCons = make.width.mas_equalTo(kWidth(1026/3.0));
                
                self.containerHeightCons = make.height.mas_equalTo(kWidth(762/3.0));
                
            }];
        }
            break;
            
        default:
            break;
    }
    
    [UIView animateWithDuration:0.25 delay:0.01 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.bgButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        [self layoutIfNeeded];
        
        [self.bgImageView layoutSubviews];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hide
{
    [UIView animateWithDuration:0.15 delay:0.01 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - Button Event Response
- (void)buttonClick:(UIButton *)sender
{
    if (self.confirmBlock) {
        
        self.confirmBlock();
    }
}

#pragma mark - 懒加载
- (UIButton *)bgButton {
    
    if (!_bgButton) {
        
        _bgButton = [UIButton new];
        
        [self addSubview:_bgButton];
    }
    
    return _bgButton;
}

- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        
        _bgImageView.image = kImage(@"圆角矩形-9");
        
        _bgImageView.userInteractionEnabled = YES;
        
        [self.bgButton addSubview:_bgImageView];
    }
    
    return _bgImageView;
}

- (UIImageView *)qrCodeImageView {
    
    if (!_qrCodeImageView) {
        
        _qrCodeImageView = [[UIImageView alloc] init];
        
        _qrCodeImageView.image = kImage(@"图层-1290");
        
        [self.bgImageView addSubview:_qrCodeImageView];
    }
    
    return _qrCodeImageView;
}

- (UILabel *)qrCodeNumLabel {
    
    if (!_qrCodeNumLabel) {
        
        _qrCodeNumLabel = [[UILabel alloc] init];
        
        _qrCodeNumLabel.textColor = [UIColor blackColor];
        
        _qrCodeNumLabel.font = kFont(55/3.0);
        
        _qrCodeNumLabel.text = @"4568846511346531";
        
        _qrCodeNumLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.bgImageView addSubview:_qrCodeNumLabel];
    }
    
    return _qrCodeNumLabel;
}

- (UILabel *)statusLabel {
    
    if (!_statusLabel) {
        
        _statusLabel = [[UILabel alloc] init];
        
        _statusLabel.textColor = [UIColor redColor];
        
        _statusLabel.font = kFont(46/3.0);
        
        _statusLabel.text = @"未绑定";
        
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.bgImageView addSubview:_statusLabel];
    }
    
    return _statusLabel;
}

- (UIView *)lineView {
    
    if (!_lineView) {
        
        _lineView = [[UIView alloc] init];
        
        _lineView.backgroundColor = [UIColor lightGrayColor];
        
        [self.bgImageView addSubview:_lineView];
    }
    
    return _lineView;
}

- (UILabel *)merchantLabel {
    
    if (!_merchantLabel) {
        
        _merchantLabel = [[UILabel alloc] init];
        
        _merchantLabel.textColor = [UIColor lightGrayColor];
        
        _merchantLabel.textAlignment = NSTextAlignmentCenter;
        
        _merchantLabel.text = @"当前门店:紫金小镇浙大森林有云科技";
        
        _merchantLabel.font = kFont(15);
        
        [self.bgImageView addSubview:_merchantLabel];
    }
    
    return _merchantLabel;
}

- (UILabel *)cashierLabel {
    
    if (!_cashierLabel) {
        
        _cashierLabel = [[UILabel alloc] init];
        
        _cashierLabel.textColor = [UIColor lightGrayColor];
        
        _cashierLabel.textAlignment = NSTextAlignmentCenter;
        
        _cashierLabel.font = kFont(15);
        
        _cashierLabel.text = @"收银员:配西";
        
        [self.bgImageView addSubview:_cashierLabel];
    }
    
    return _cashierLabel;
}

- (UIButton *)confirmButton {
    
    if (!_confirmButton) {
        
        _confirmButton = [UIButton new];
        
        _confirmButton.backgroundColor = [UIColor redColor];
        
        [_confirmButton setTitle:@"绑定" forState:UIControlStateNormal];
        
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _confirmButton.titleLabel.font = kFont(15);
        
        _confirmButton.layer.cornerRadius = kWidth(15);
        
        [_confirmButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _confirmButton.layer.masksToBounds = YES;
        
        [self.bgImageView addSubview:_confirmButton];
    }
    
    return _confirmButton;
}

- (UIButton *)cancelButton {
    
    if (!_cancelButton) {
        
        _cancelButton = [UIButton new];
        
        _cancelButton.backgroundColor = [UIColor whiteColor];
        
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        
        [_cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        _cancelButton.titleLabel.font = kFont(15);
        
        _cancelButton.layer.cornerRadius = kWidth(15);
        
        [_cancelButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        
        _cancelButton.layer.borderWidth = 1;
        
        _cancelButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        _cancelButton.layer.masksToBounds = YES;
        
        [self.bgImageView addSubview:_cancelButton];
    }
    
    return _cancelButton;
}

- (void)setStatusType:(StatusType)statusType {
    
    _statusType = statusType;
}

@end
