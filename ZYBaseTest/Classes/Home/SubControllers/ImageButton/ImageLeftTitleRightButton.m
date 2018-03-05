//
//  ImageLeftTitleRightButton.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ImageLeftTitleRightButton.h"

@implementation ImageLeftTitleRightButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if(self.titleLabel.text && self.imageView.image)
    {
        CGPoint imageCenter = self.imageView.center;
        imageCenter.x = self.frame.size.width/2 - 15;
        imageCenter.y = self.frame.size.height/2;
        self.imageView.center = imageCenter;
        
        CGRect newFrame = self.titleLabel.frame;
        newFrame.origin.x = CGRectGetMaxX(self.imageView.frame) + 3;
        newFrame.origin.y = self.imageView.frame.size.height/2;
        self.titleLabel.frame = newFrame;
        
        CGPoint newPoint = self.titleLabel.center;
        newPoint.y = imageCenter.y;
        self.titleLabel.center = newPoint;
    }
}

@end
