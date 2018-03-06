//
//  ZYCollectionViewCell.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/5.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ZYCollectionViewCell.h"

@interface ZYCollectionViewCell ()
@property (nonatomic, copy) UILabel *titleLabel;
@end

@implementation ZYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubViewConstraints];
    }
    return self;
}

#pragma mark - Init UI
- (void)addSubViewConstraints {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - Setter && Getter
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.textColor = [UIColor zy_randomColor];
        
        _titleLabel.font = kFont(15);
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}
- (void)setTitleStr:(NSString *)titleStr {
    
    _titleStr = titleStr;
    
    self.titleLabel.text = titleStr;
}

@end
