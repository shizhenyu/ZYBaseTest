//
//  UIView+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UIView+ZYKit.h"

@implementation UIView (ZYKit)

+ (instancetype)loadFromXib {
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
    
    return view;
}

- (CGSize)sizeFitsWithMaxWidth:(CGFloat)maxWidth {
    
    CGSize size = [self sizeThatFits:CGSizeMake(maxWidth, CGFLOAT_MAX)];
    
    return size;
}

- (CGSize)sizeFitsWithMaxHeight:(CGFloat)maxHeight {
    
    CGSize size = [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, maxHeight)];
    
    return size;
}

- (UIImage *)snapshortCurrentView {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
    
}

@end
