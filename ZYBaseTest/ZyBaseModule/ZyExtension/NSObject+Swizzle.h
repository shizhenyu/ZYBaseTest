//
//  NSObject+Swizzle.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

/** 实例方法交换 */
+ (BOOL)zy_swizzleMethod:(SEL)method withMethod:(SEL)nMethod error:(NSError **)error;

/** 类方法交换 */
+ (BOOL)zy_swizzleClassMethod:(SEL)method withMethod:(SEL)nMethod error:(NSError **)error;

@end
