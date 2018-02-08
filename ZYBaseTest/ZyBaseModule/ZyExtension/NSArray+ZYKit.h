//
//  NSArray+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ZYKit)


/**
 倒序数组元素
 
 @return 倒序操作 生成的新数组
 */
- (NSArray *)arrayReverse;

/**
 排序数组
 
 @return 新的数组
 */
- (NSArray *)sortArray;

/**
 在排序数组前，映射处理元素
 
 @param mapBlock 映射block
 @return 新的数组
 */
- (NSArray *)sortArrayWithMap:(id(^)(id obj))mapBlock;

/**
 生成唯一元素的数组，剔除数组中相同的元素
 
 @return 新的数组
 */
- (NSArray *)arrayElementUnique;

/**
 取两个数组的并集，合并数组，但满足 isEqual: 返回yes的元素，剔除
 
 @param anArray 第二个数组
 @return 生成的并集数组
 */
- (NSArray *)objectsUnion:(NSArray *)anArray;

/**
 取两个数组的交集，即取两个数组元素满足 isEqual: 返回yes的元素
 
 @param anArray 第二个数组
 @return 生成的交集数组
 */
- (NSArray *)objectsIntersection:(NSArray *)anArray;

/**
 剔除与第二数组 元素相同的部分
 
 @param anArray 第二数组
 @return 新的数组
 */
- (NSArray *)objectsMinusEqualElemtent:(NSArray *)anArray;


/**
 过滤数组中的元素
 
 @param filterBlock 过滤条件的block
 @return 过滤后的新数组
 */
- (NSArray *)objectFilter:(BOOL(^)(id obj))filterBlock;

/**
 取数组的前N的元素
 
 @param N 取得元素个数
 @return 新的数组
 */
- (NSArray *)takeN:(NSUInteger)N;

/**
 去满足条件的元素，并生成新的数组，知道while 返回 NO 停止
 
 @param block 待满足的条件
 @return 新的数组
 */
- (NSArray *)takeElementWhile:(BOOL(^)(id obj))block;

@end
