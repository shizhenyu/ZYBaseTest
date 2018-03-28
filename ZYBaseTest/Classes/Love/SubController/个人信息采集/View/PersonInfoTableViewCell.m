//
//  PersonInfoTableViewCell.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/28.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "PersonInfoTableViewCell.h"

@interface PersonInfoTableViewCell ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextField *textField;

@end

@implementation PersonInfoTableViewCell

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

- (void)addSubViewConstraints {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(0);
        
        make.leading.mas_equalTo(15);
        
        make.height.mas_equalTo(15);
        
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.bottom.mas_equalTo(0);
        
        make.leading.equalTo(self.titleLabel.mas_trailing).offset(10);
        
        make.trailing.mas_equalTo(-15);
        
    }];
}

#pragma mark - UITextField Event
- (void)textFieldDidChange:(UITextField *)text {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldContentDidChange:inIndexPath:)]) {
        
        [self.delegate textFieldContentDidChange:text.text inIndexPath:_indexPath_Row];
    }
}

#pragma mark - Setter && Getter
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = @"姓名";
        
        [_titleLabel setContentHuggingPriority:751 forAxis:UILayoutConstraintAxisHorizontal];
                
        _titleLabel.textColor = [UIColor zy_colorWithHex:0x333434];
        
        _titleLabel.font = kFont(16);
        
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UITextField *)textField {
    
    if (!_textField) {
        
        _textField = [[UITextField alloc] init];
        
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        [self.contentView addSubview:_textField];
    }
    
    return _textField;
}

- (void)setTitleStr:(NSString *)titleStr {
    
    _titleStr = titleStr;
    
    self.titleLabel.text = titleStr;
}

- (void)setPlaceholderStr:(NSString *)placeholderStr {
    
    _placeholderStr = placeholderStr;
    
    self.textField.placeholder = placeholderStr;
}

- (void)setContentStr:(NSString *)contentStr {
    
    _contentStr = contentStr;
    
    self.textField.text = contentStr;
}

- (void)setIndexPath_Row:(NSInteger)indexPath_Row {
    
    _indexPath_Row = indexPath_Row;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
