//
//  CALayer+xibConfig.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


@interface CALayer (xibConfig)

/**
 方便在Xib设置边框颜色
 */
@property (nonatomic,strong) UIColor *borderColorWithUIColor;

@end
