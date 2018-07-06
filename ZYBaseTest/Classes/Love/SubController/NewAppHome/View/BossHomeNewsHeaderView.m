//
//  BossHomeNewsHeaderView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/30.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "BossHomeNewsHeaderView.h"

@implementation BossHomeNewsHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.contentView.backgroundColor = [UIColor orangeColor];
    }
    
    return self;
}

@end
