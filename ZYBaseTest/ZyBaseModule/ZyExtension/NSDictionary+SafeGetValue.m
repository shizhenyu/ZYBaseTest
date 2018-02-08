//
//  NSDictionary+SafeGetValue.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/7/7.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSDictionary+SafeGetValue.h"

@implementation NSDictionary (SafeGetValue)

/** 安全的取出字符串，不会出现因空值造成的crash */
- (NSString *)zy_objectString:(NSString *)key {
    
    if ([self isKindOfClass:[NSDictionary class]]) {
        
        id tempObject = [self objectForKey:key];
        
        if ([tempObject isKindOfClass:[NSNull class]] || tempObject == [NSNull null]) {
            
            return @"";
            
        }
        
        if (tempObject && tempObject != [NSNull null]) {
            
            if ([tempObject respondsToSelector:@selector(length)]) {
                
                return [self objectForKey:key];
                
            }else if ([tempObject respondsToSelector:@selector(intValue)]) {
                
                return [NSString stringWithFormat:@"%d",[[self objectForKey:key] intValue]];
            }
            
        }else {
            
            return @"";
        }
        
        
        return @"";
        
    }else {
        
        return @"";
    }
    
}

/** 安全的取出int类型，不会出现因空值造成的crash */
- (int)zy_objectInt:(NSString *)key {
    
    if ([self isKindOfClass:[NSDictionary class]]) {
        
        id tempObject = [self objectForKey:key];
        
        if (tempObject && tempObject != [NSNull null] && [tempObject respondsToSelector:@selector(intValue)]) {
            
            return [[self objectForKey:key] intValue];
            
        }else {
            
            return 0;
        }
        
        return 0;
        
    }else {
        
        return 0;
    }
    
}

/** 安全的取出浮点型，不会出现因空值造成的crash */
- (float)zy_objectFloat:(NSString *)key {
    
    if ([self isKindOfClass:[NSDictionary class]]) {
        
        id tempObject = [self objectForKey:key];
        
        if (tempObject && tempObject != [NSNull null] && [tempObject respondsToSelector:@selector(floatValue)]) {
            
            return [[self objectForKey:key] floatValue];
            
        }else {
            
            return 0;
        }
        
        return 0;
        
    }else {
        
        return 0;
    }
}

@end
