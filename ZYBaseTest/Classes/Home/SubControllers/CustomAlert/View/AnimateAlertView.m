//
//  AnimateAlertView.m
//  ZYCalculator
//
//  Created by youyun on 2017/12/9.
//  Copyright © 2017年 TaoSheng. All rights reserved.
//

#import "AnimateAlertView.h"

#define TSCancelTintColor  [UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1]
#define TSConfirmTintColor [UIColor colorWithRed:230/255.0 green:64/255.0 blue:64/255.0 alpha:1]
#define TSTimeTintColor    [UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1]
#define TSLineColor      [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1]

@interface AnimateAlertView ()

@property (nonatomic, strong) UIButton *bgButton;

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) UIView *separationLineViewHor;

@property (nonatomic, strong) UIView *separationLineViewVer;

@property (nonatomic, strong) UIButton *confirmButton;

@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, weak) MASConstraint *containerWidthCons;

@property (nonatomic, weak) MASConstraint *containerHeightCons;

@end

@implementation AnimateAlertView

#pragma mark - Init Method
+ (instancetype)shareAlertView
{
    AnimateAlertView *alertView = [[AnimateAlertView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    return alertView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubViewContraints];
    }
    return self;
}

#pragma mark - Add SubView Contraints
- (void)addSubViewContraints
{
    [self.bgButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(0);
        
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.mas_equalTo(0);
        
        self.containerWidthCons = make.width.mas_equalTo(0);
        
        self.containerHeightCons = make.height.mas_equalTo(0);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(kHeight(15));

        make.leading.trailing.mas_equalTo(0);

        make.height.mas_equalTo(kHeight(22));

    }];

    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.mas_equalTo(0);
        
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kHeight(9));
        
        make.width.mas_equalTo(kWidth(280));
        
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {

        make.leading.mas_equalTo(0);

        make.top.equalTo(self.messageLabel.mas_bottom).offset(kHeight(16));

        make.width.equalTo(self.containerView.mas_width).multipliedBy(0.5);

        make.height.mas_equalTo(kHeight(45));
        
    }];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.cancelButton.mas_top);

        make.trailing.mas_equalTo(0);

        make.width.equalTo(self.cancelButton.mas_width);
        
        make.height.equalTo(self.cancelButton.mas_height);

    }];

    [self.separationLineViewHor mas_makeConstraints:^(MASConstraintMaker *make) {

        make.leading.trailing.mas_equalTo(0);

        make.top.equalTo(self.confirmButton.mas_top);

        make.height.mas_equalTo(1);

    }];

    [self.separationLineViewVer mas_makeConstraints:^(MASConstraintMaker *make) {

        make.leading.equalTo(self.cancelButton.mas_trailing);

        make.top.equalTo(self.cancelButton.mas_top);

        make.bottom.equalTo(self.cancelButton.mas_bottom);

        make.width.mas_equalTo(1);

    }];
    
}

#pragma mark - Button Event Response
- (void)cancelClick:(UIButton *)btn
{
    if (self.cancelBlock)
    {
        self.cancelBlock();
    }
    
    [self hiden];
}

- (void)confirmClick:(UIButton *)btn
{
    if (self.confirmBlock)
    {
        self.confirmBlock();
    }
    
    [self hiden];
}

#pragma mark - Public Method
- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    self.alpha = 0;
    
    [window addSubview:self];
    
    self.containerView.transform = CGAffineTransformMakeScale(1.2, 1.2);

    [UIView animateWithDuration:0.20 delay:0.01 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.bgButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        
        self.alpha = 1;
        
        self.containerView.transform = CGAffineTransformIdentity;

    } completion:^(BOOL finished) {
        
        self.containerView.transform = CGAffineTransformIdentity;
        
    }];
}

- (void)hiden
{
    [self.containerWidthCons uninstall];
    
    [self.containerHeightCons uninstall];
    
    [self layoutIfNeeded];
    
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
                
        self.containerWidthCons = make.width.mas_equalTo(0);
        
        self.containerHeightCons = make.height.mas_equalTo(0);
        
    }];
    
    [UIView animateWithDuration:0.25 delay:0.01 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
        [self layoutIfNeeded];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - Setter && Getter
- (UIButton *)bgButton {
    
    if (!_bgButton) {
        
        _bgButton = [UIButton new];
        
        _bgButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        
        [self addSubview:_bgButton];
    }
    
    return _bgButton;
}

- (UIView *)containerView {
    
    if (!_containerView) {
        
        _containerView = [[UIView alloc]init];
        
        _containerView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.95];
        
        _containerView.layer.cornerRadius = 10;
        
        _containerView.layer.masksToBounds = YES;
        
        [self addSubview:_containerView];
    }
    
    return _containerView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]init];
        
        _titleLabel.textColor = [UIColor blackColor];
        
        _titleLabel.font = kBFont(19);
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.containerView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UILabel *)messageLabel {
    
    if (!_messageLabel) {
        
        _messageLabel = [[UILabel alloc]init];
        
        _messageLabel.textColor = [UIColor blackColor];
        
        _messageLabel.font = kFont(16);
        
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        
        _messageLabel.numberOfLines = 0;
        
        [self.containerView addSubview:_messageLabel];
    }
    
    return _messageLabel;
}

- (UIView *)separationLineViewHor {
    
    if (!_separationLineViewHor) {
        
        _separationLineViewHor = [[UIView alloc]init];
        
        _separationLineViewHor.backgroundColor = TSLineColor;
        
        [self.containerView addSubview:_separationLineViewHor];
    }
    
    return _separationLineViewHor;
}

- (UIView *)separationLineViewVer {
    
    if (!_separationLineViewVer) {
        
        _separationLineViewVer = [[UIView alloc]init];
        
        _separationLineViewVer.backgroundColor = TSLineColor;
        
        [self.containerView addSubview:_separationLineViewVer];
    }
    
    return _separationLineViewVer;
}

- (UIButton *)confirmButton {
    
    if (!_confirmButton) {
        
        _confirmButton = [UIButton new];
        
        _confirmButton.titleLabel.font = kFont(18);
        
        [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        
        [_confirmButton addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_confirmButton setTitleColor:TSConfirmTintColor forState:UIControlStateNormal];
        
        [_confirmButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        
        [self.containerView addSubview:_confirmButton];
    }
    
    return _confirmButton;
}

- (UIButton *)cancelButton {
    
    if (!_cancelButton) {
        
        _cancelButton = [UIButton new];
                
        _cancelButton.titleLabel.font = kFont(18);
        
        [_cancelButton addTarget:self action:@selector(hiden) forControlEvents:UIControlEventTouchUpInside];
        
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        
        [_cancelButton setTitleColor:TSCancelTintColor forState:UIControlStateNormal];
        
        [_cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        
        [_cancelButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.containerView addSubview:_cancelButton];
    }
    
    return _cancelButton;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    self.titleLabel.text = title;
}

- (void)setMessage:(NSString *)message
{
    _message = message;
    
    self.messageLabel.text = message;
    
    [self.containerWidthCons uninstall];
    [self.containerHeightCons uninstall];
    
    CGFloat messageHeight = [message boundingRectWithSize:CGSizeMake(kWidth(280), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:kFont(16)} context:nil].size.height;
    
    CGFloat containerHeight = kHeight(107) + messageHeight;
    
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        self.containerWidthCons = make.width.equalTo(self).multipliedBy(300/375.0);
        
        self.containerHeightCons = make.height.mas_equalTo(containerHeight);
        
    }];
    
    [self layoutIfNeeded];
}

- (void)setCancelTitle:(NSString *)cancelTitle
{
    _cancelTitle = cancelTitle;
    
    [self.cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
}

- (void)setCancelTitleColor:(UIColor *)cancelTitleColor
{
    _cancelTitleColor = cancelTitleColor;
    
    [self.cancelButton setTitleColor:cancelTitleColor forState:UIControlStateNormal];
}

- (void)setConfirmTitle:(NSString *)confirmTitle
{
    _confirmTitle = confirmTitle;
    
    [self.confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
}

- (void)setConfirmTitleColor:(UIColor *)confirmTitleColor
{
    _confirmTitleColor = confirmTitleColor;
    
    [self.confirmButton setTitleColor:confirmTitleColor forState:UIControlStateNormal];
}

#pragma mark - 设置有“倒计时”弹框的
- (void)setCountDownTime:(CGFloat)countDownTime
{
    _countDownTime = countDownTime;
    
    if (countDownTime == 0) {
        
        // 如果倒计时为0，则证明用户不需要倒计时，直接显示message
        self.messageLabel.text = _message;
        
        return;
    }
    
    self.cancelButton.enabled = NO;
    self.confirmButton.enabled = NO;
    
    NSString *originStr = [NSString stringWithFormat:@"%@ (%.0fs)", _message, countDownTime];
    
    NSMutableAttributedString *originMessage = [[NSMutableAttributedString alloc]initWithString:originStr];
    
    NSString *originSecond = [NSString stringWithFormat:@"(%.0fs)",countDownTime];
    
    NSRange originRange = [originStr rangeOfString:originSecond];
    
    [originMessage addAttributes:@{NSForegroundColorAttributeName:TSTimeTintColor} range:originRange];
    
    self.messageLabel.attributedText  = originMessage;
    
    __block CGFloat restSecond = countDownTime;
    
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES invokeBlock:^(NSTimer *timer) {
        
        if (restSecond == 1) {
            
            [timer invalidate];
            
            timer = nil;
            
            NSString *message = _message;
            
            self.cancelButton.enabled = YES;
            self.confirmButton.enabled = YES;
            
            self.messageLabel.text = message;
            
            return ;
        }
        
        restSecond --;
        
        NSString *secondStr = [NSString stringWithFormat:@"(%.0fs)", restSecond];
        
        NSString *tmpMessage = [NSString stringWithFormat:@"%@ %@", _message, secondStr];
        
        NSRange range = [tmpMessage rangeOfString:secondStr];
        
        NSMutableAttributedString *message = [[NSMutableAttributedString alloc]initWithString:tmpMessage];
        
        [message addAttributes:@{NSForegroundColorAttributeName:TSTimeTintColor} range:range];
        
        self.messageLabel.attributedText  = message;
        
    }];
}

@end
