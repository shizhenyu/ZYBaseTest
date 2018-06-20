//
//  YYTextTableViewCell.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/13.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "YYTextTableViewCell.h"

@implementation YYTextTableViewCell

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

#pragma mark - Add SubViewConstraints
- (void)addSubViewConstraints {
 
    self.contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.contentLabel];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 15, 10, 15));
        
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
