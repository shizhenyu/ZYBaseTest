//
//  CALayer+xibConfig.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "CALayer+xibConfig.h"

@implementation CALayer (xibConfig)

- (UIColor *)borderColorWithUIColor {
    
    return [UIColor colorWithCGColor:self.borderColor];
}

- (void)setBorderColorWithUIColor:(UIColor *)borderWithUIColor {
    
    self.borderColor = borderWithUIColor.CGColor;
    
}

@end
