//
//  TipGatherTableViewCell.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "TipGatherTableViewCell.h"

@implementation TipGatherTableViewCell
{
     NSMutableArray *buttonArr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        buttonArr = [NSMutableArray array];
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI
{
    CGFloat margin = 10;
    
    CGFloat buttonX = 10;
    CGFloat buttonY = 10;
    CGFloat buttonHeight = 30;
    
    _cellHeight = 20 + buttonHeight;
    
    for (int i = 0; i < buttonArr.count; i ++)
    {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor colorWithRed:77/255.0 green:123/255.0 blue:255/255.0 alpha:1];
        [button setTitle:buttonArr[i] forState:UIControlStateNormal];
        button.layer.cornerRadius = 3;
        button.tag = 100+i;
        [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.layer.masksToBounds = YES;
        
        CGSize titleSize = [buttonArr[i] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, buttonHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
        CGFloat titleBtnWidth = titleSize.width + 2 * margin;
        
        if ((buttonX + titleBtnWidth) > self.frame.size.width) {
            
            buttonX = 10;
            buttonY += buttonHeight + margin;
            
            _cellHeight = _cellHeight + buttonHeight + margin;
        }
        
        button.frame = CGRectMake(buttonX, buttonY, titleBtnWidth, buttonHeight);
        buttonX += titleBtnWidth + margin;
        [self.contentView addSubview:button];
    }
}
#pragma mark - Cell Delegate
- (void)buttonEvent:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedIndexPathRow:tipTag:)]) {
        [self.delegate didSelectedIndexPathRow:_indexPath_Row tipTag:sender.tag - 100];
    }
}

#pragma mark - Setter
- (void)setTipArr:(NSMutableArray *)tipArr
{
    buttonArr = [NSMutableArray arrayWithArray:tipArr];
    
    for (UIView *subView in self.contentView.subviews) {
        [subView removeFromSuperview];
    }
    
    [self setupUI];
}

- (void)setIndexPath_Row:(NSInteger)indexPath_Row
{
    _indexPath_Row = indexPath_Row;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
