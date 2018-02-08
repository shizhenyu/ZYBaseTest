//
//  ReportView.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ReportView.h"

@interface ReportView ()

@property (nonatomic,strong) UIButton *bgView;

@property (nonatomic,strong) UIControl *containerView;

@property (nonatomic,strong) UIImageView *bgImageView;

@property (nonatomic,strong) UIImageView *reportImage;

@property (nonatomic,strong) UILabel *reportLabel;

@end

@implementation ReportView

#pragma mark - Init UI
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubViewConstraints];
    }
    return self;
}

- (void)addSubViewConstraints
{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - Public Method
+ (instancetype)showViewWithContainerViewFrame:(CGRect)frame {
    
    ReportView *reportView = [[ReportView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    reportView.tag = 5;
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    [reportView layoutIfNeeded];
    
    CGRect containerRect  = reportView.containerView.frame;
    
    CGFloat maxY = CGRectGetMaxY(frame);
    
    containerRect.origin.x = kScreenWidth - 112 - 12;
    
    if (maxY + 60 > kScreenHeight) {
        // 上边显示
        containerRect.origin.y = CGRectGetMinY(frame) - 60;
        
        [reportView.reportImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(reportView.bgImageView).mas_equalTo(-3);
            
            make.leading.mas_equalTo(31);
            
        }];
        
        [reportView.reportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(reportView.reportImage.mas_centerY);
            
            make.trailing.mas_equalTo(-32);
            
        }];
        
        reportView.bgImageView.image = [UIImage imageNamed:@"动态举报弹窗down"];
        
    }else {
        // 下边显示
        
        [reportView.reportImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(reportView.bgImageView).mas_equalTo(3);
            make.leading.mas_equalTo(31);
            
        }];
        
        [reportView.reportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(reportView.bgImageView).mas_equalTo(3);
            
            make.trailing.mas_equalTo(-32);
            
        }];
        
        
        containerRect.origin.y = CGRectGetMaxY(frame) - 64 + 60;
        
        reportView.bgImageView.image = [UIImage imageNamed:@"动态举报弹窗up"];
        
    }
    
    reportView.containerView.alpha = 0.3;
    
    reportView.containerView.frame = containerRect;
    
    containerRect.size = CGSizeMake(112, 60);
    
    [UIView animateWithDuration:0.25 animations:^{
        
        reportView.containerView.frame = containerRect;
        
        reportView.containerView.alpha = 1;
    }];
    
    
    
    NSLog(@"%@",NSStringFromCGRect(containerRect));
    
    [window addSubview:reportView];
    
    return reportView;
    
}
- (void)hideReport
{
    ReportView *reportView = [self viewWithTag:5];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        reportView.alpha = 0.3;
        reportView.containerView.frame = CGRectZero;
        
    } completion:^(BOOL finished) {
        
        [reportView removeFromSuperview];
        
    }];
}

- (void)reportMessage
{
    NSLog(@"点击举报");
}

#pragma mark -- Setter && Getter
- (UIButton *)bgView {
    
    if (!_bgView) {
        
        _bgView = [UIButton new];
        
        _bgView.backgroundColor = [UIColor clearColor];
        
        [_bgView addTarget:self action:@selector(hideReport) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_bgView];
    }
    
    return _bgView;
}

- (UIControl *)containerView {
    
    if (!_containerView) {
        
        _containerView = [[UIControl alloc]init];
        
        _containerView.backgroundColor = [UIColor clearColor];
        
        [_containerView addTarget:self action:@selector(reportMessage) forControlEvents:UIControlEventTouchUpInside];
        
        [self.bgView addSubview:_containerView];
    }
    
    return _containerView;
}

- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView  = [[UIImageView alloc]init];
        
        [self.containerView addSubview:_bgImageView];
    }
    
    return _bgImageView;
}

- (UIImageView *)reportImage {
    
    if (!_reportImage) {
        
        _reportImage = [[UIImageView alloc]init];
        
        _reportImage.image = [UIImage imageNamed:@"举报icon"];
        
        [self.containerView addSubview:_reportImage];
    }
    
    return _reportImage;
}

- (UILabel *)reportLabel {
    
    if (!_reportLabel) {
        
        _reportLabel = [UILabel new];
        
        _reportLabel.text = @"举报";
        
        _reportLabel.textColor = [UIColor zy_colorWithHex:0xFFFFFF];
        
        _reportLabel.font = [UIFont systemFontOfSize:14];
        
        [self.containerView addSubview:_reportLabel];
    }
    
    return _reportLabel;
}

@end
