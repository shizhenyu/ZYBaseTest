//
//  NSDictionary+SafeGetValue.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/7/7.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeGetValue)

/** 安全的取出字符串，不会出现因空值造成的crash */
- (NSString *)zy_objectString:(NSString *)key;

/** 安全的取出int类型，不会出现因空值造成的crash */
- (int)zy_objectInt:(NSString *)key;

/** 安全的取出浮点型数据，不会出现因空值造成的crash */
- (float)zy_objectFloat:(NSString *)key;
@end
