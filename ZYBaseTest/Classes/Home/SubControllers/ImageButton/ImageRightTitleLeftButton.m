//
//  ImageRightTitleLeftButton.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ImageRightTitleLeftButton.h"

@implementation ImageRightTitleLeftButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.titleLabel.text && self.imageView.image) {
        
        //文字
        CGPoint labelCenter = self.titleLabel.center;
        labelCenter.x = self.frame.size.width/2 - 10;
        labelCenter.y = self.frame.size.height/2;
        self.titleLabel.center = labelCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //图片
        CGRect newFrame = self.imageView.frame;
        newFrame.origin.x = CGRectGetMaxX(self.titleLabel.frame)+3;
        newFrame.origin.y = self.imageView.frame.size.height/2;
        newFrame.size.width = self.imageView.frame.size.width;
        self.imageView.frame = newFrame;
        
        CGPoint newPoint = self.imageView.center;
        newPoint.y = labelCenter.y;
        self.imageView.center = newPoint;
    }
    
}

@end
