//
//  NSArray+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSArray+ZYKit.h"

#ifdef DEBUG
#   define ZYLog(...) NSLog(__VA_ARGS__);
#else
#   define ZYLog(...)
#endif

@implementation NSArray (ZYKit)

/**
 数组在控制台的打印文字
 */
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}

- (NSArray *)arrayReverse {
    
    if (!self) {
        return nil;
    }
    
    if (self.count <= 1) {
        return self;
    }
    
    return [[self reverseObjectEnumerator] allObjects];
}

- (NSArray *)sortArray {
    
    return [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return [obj1 compare:obj2];
    }];
}

- (NSArray *)sortArrayWithMap:(id(^)(id))mapBlock {
    
    return [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        if (mapBlock) {
            return [mapBlock(obj1) compare:mapBlock(obj2)];
        }
        
        return [obj1 compare:obj2];
    }];
}

- (NSArray *)arrayElementUnique {
    
    if (!self) {
        return nil;
    }
    
    if (self.count <= 1) {
        return [self copy];
    }
    
    NSOrderedSet *set =[NSOrderedSet orderedSetWithArray:self];
    
    return [set.array copy];
}

- (NSArray *)objectsUnion:(NSArray *)anArray {
    NSMutableOrderedSet *set1 = [NSMutableOrderedSet orderedSetWithArray:self];
    NSMutableOrderedSet *set2 = [NSMutableOrderedSet orderedSetWithArray:anArray];
    [set1 unionOrderedSet:set2];
    return set1.array.copy;
}

- (NSArray *)objectsIntersection:(NSArray *)anArray {
    NSMutableOrderedSet *set1 = [NSMutableOrderedSet orderedSetWithArray:self];
    NSMutableOrderedSet *set2 = [NSMutableOrderedSet orderedSetWithArray:anArray];
    [set1 intersectOrderedSet:set2];
    return set1.array.copy;
}

- (NSArray *)objectsMinusEqualElemtent:(NSArray *)anArray {
    NSMutableOrderedSet *set1 = [NSMutableOrderedSet orderedSetWithArray:self];
    NSMutableOrderedSet *set2 = [NSMutableOrderedSet orderedSetWithArray:anArray];
    [set1 minusOrderedSet:set2];
    return set1.array.copy;
}

- (NSArray *)objectFilter:(BOOL(^)(id obj))filterBlock {
    
    if (!self || !filterBlock) return nil;
    
    NSMutableArray *newArray = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (filterBlock(obj)) {
            
            [newArray addObject:obj];
        }
        
    }];
    
    return [newArray copy];
}

- (NSArray *)objectMap:(id(^)(id obj))mapBlock {
    
    if (!self || !mapBlock) return nil;
    
    NSMutableArray *newArray = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        id object = mapBlock(obj);
        
        if (object) {
            [newArray addObject:object];
        }else {
            ZYLog(@"%ld个元素“%@”映射后为nil,",(unsigned long)idx,obj);
        }
        
    }];
    
    return [newArray copy];
    
}

- (NSArray *)takeN:(NSUInteger)N {
    
    if (!self || N<=0) return nil;
    
    NSMutableArray *newArray = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [newArray addObject:obj];
        
        if (idx == N) {
            *stop = YES;
        }
        
    }];
    
    return newArray;
}

- (NSArray *)takeElementWhile:(BOOL(^)(id obj))block {
    
    if (!self || !block) return nil;
    
    NSMutableArray *newArray = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        *stop = !block(obj);
        
        [newArray addObject:obj];
        
    }];
    
    return newArray;
}



@end
