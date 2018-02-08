//
//  NSDictionary+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSDictionary+ZYKit.h"

@implementation NSDictionary (ZYKit)


- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}

- (NSString *)urlSortForDictionary {
    
    if (!self) return nil;
    
    NSMutableString *urlParamString = [NSMutableString string];
    
    NSArray *keys = [self allKeys];
    
    for (NSString *key in keys) {
        
        id value = [self objectForKey:key];
        
        [urlParamString appendFormat:@"%@=%@&",key,value];
        
    }
    
    //    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    //
    //        if (!urlParamString) {
    //
    //            urlParamString = [NSMutableString stringWithFormat:@"%@=%@",key,obj];
    //
    //        }else {
    //
    //            [urlParamString appendFormat:@"&%@=%@",key,obj];
    //        }
    //    }];
    
    return [[urlParamString substringToIndex:urlParamString.length-1] copy];
}

@end
