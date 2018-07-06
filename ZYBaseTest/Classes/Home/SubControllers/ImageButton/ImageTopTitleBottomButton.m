//
//  ImageTopTitleBottomButton.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ImageTopTitleBottomButton.h"

@implementation ImageTopTitleBottomButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.titleLabel.text && self.imageView.image) {
        
        CGFloat marginH = (self.frame.size.height - self.imageView.frame.size.height - self.titleLabel.frame.size.height)/2.5;
        
        //图片
        CGPoint imageCenter = self.imageView.center;
        imageCenter.x = self.frame.size.width/2;
        imageCenter.y = self.imageView.frame.size.height/2 + marginH - 2;
        self.imageView.center = imageCenter;
        //文字
        CGRect newFrame = self.titleLabel.frame;
        newFrame.origin.x = 0;
        newFrame.origin.y = self.frame.size.height - newFrame.size.height - marginH + 2;
        newFrame.size.width = self.frame.size.width;
        self.titleLabel.frame = newFrame;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
}

@end
