//
//  NSObject+Property.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/29.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KeyValue <NSObject>

@optional
/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 */
+ (NSDictionary *)objectClassInArray;

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)replacedKeyFromPropertyName;

@end

@interface NSObject (Property) <KeyValue>

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary;

@end
