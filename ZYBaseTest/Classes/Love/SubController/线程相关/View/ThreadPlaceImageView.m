//
//  ThreadPlaceImageView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/4/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ThreadPlaceImageView.h"

@implementation ThreadPlaceImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        
        imageView.center = self.center;
        
        imageView.bounds = CGRectMake(0, 0, 100, 100);
        
        imageView.image = kImage(@"形状-20");
        
        [self addSubview:imageView];
    }
    return self;
}

@end
