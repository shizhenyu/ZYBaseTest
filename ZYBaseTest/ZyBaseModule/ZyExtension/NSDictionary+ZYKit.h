//
//  NSDictionary+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZYKit)

/**
 将字典里的参数进行 url 参数拼接
 
 @return url 参数字符串
 */
- (NSString *)urlSortForDictionary;

@end
