//
//  UIImage+Extension.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (instancetype)imageWithColor:(UIColor *)color {
    
    CGSize size = CGSizeMake(1.f, 1.f);
    
    UIGraphicsBeginImageContext(size);
    
    [color setFill];
    
    UIRectFill((CGRect){CGPointZero,size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (instancetype)imageWithColor:(UIColor *)color string:(NSString *)name {
    
    CGRect rect = CGRectMake(0.f, 0.f, 80, 80);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSString *headName = nil;
    
    if (name.length < 3) {
        
        headName = name;
        
    }else {
        
        headName = [name substringFromIndex:name.length - 2];
    }
    
    UIImage *headImg = [self imageToAddText:img withText:headName];
    
    return headImg;
}

+ (instancetype)imageWithString:(NSString *)name {
    
    UIColor *color = [self randomColor]; // 获取随机颜色
    
    CGRect rect = CGRectMake(0.f, 0.f, 80, 80);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSString *headName = nil;
    
    if (name.length < 3) {
        
        headName = name;
        
    }else {
        
        headName = [name substringFromIndex:name.length - 2];
    }
    
    UIImage *headImg = [self imageToAddText:img withText:headName];
    
    return headImg;
    
}

// 随机颜色
+ (UIColor *)randomColor {
    
    CGFloat hue = arc4random() % 256 / 255.0; // 0.0 to 1.0
    
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5;
    
    CGFloat brightness = (arc4random()%128 / 256.0) + 0.5;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

// 把文字绘制到图片上
+ (UIImage *)imageToAddText:(UIImage *)img withText:(NSString *)text {
    
    // 1.获取上下文
    UIGraphicsBeginImageContext(img.size);
    
    // 2.绘制图片
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    
    // 3.绘制文字
    CGRect rect = CGRectMake(0, img.size.height / 3.0, img.size.width, img.size.height/2.0);
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    style.alignment = NSTextAlignmentCenter;
    
    // 文字的属性
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    // 将文字绘制上去
    [text drawInRect:rect withAttributes:dic];
    
    // 4.获取绘制得到的图片
    UIImage *waterMarkImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.结束图片的绘制
    UIGraphicsEndImageContext();
    
    return waterMarkImg;
}

- (instancetype)imageFitWithSize:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    
    CGRect rect = (CGRect){CGPointZero,size};
    
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (instancetype)imageCornerWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners fillColor:(UIColor *)fillColor zoomSize:(CGSize)zoomSize {
    
    UIGraphicsBeginImageContextWithOptions(zoomSize, YES, 0);
    
    CGRect rect = (CGRect){CGPointZero,zoomSize};
    
    [fillColor setFill];
    
    UIRectFill(rect);
    
    CGSize size = CGSizeMake(radius, radius);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:size];
    
    [path addClip];
    
    [self drawInRect:rect];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    return img;
    
}

- (instancetype)imageCornerWithRadius:(CGFloat)radius fillColor:(UIColor *)fillColor zoomSize:(CGSize)zoomSize {
    
    return [self imageCornerWithRadius:radius byRoundingCorners:UIRectCornerAllCorners fillColor:fillColor zoomSize:zoomSize];
}

@end
