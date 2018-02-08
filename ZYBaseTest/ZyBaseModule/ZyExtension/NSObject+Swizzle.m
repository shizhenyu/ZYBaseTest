//
//  NSObject+Swizzle.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

#define SetNSErrorFor(FUNC, ERROR_VAR, FORMAT,...)	\
if (ERROR_VAR) {	\
NSString *errStr = [NSString stringWithFormat:@"%s: " FORMAT,FUNC,##__VA_ARGS__]; \
*ERROR_VAR = [NSError errorWithDomain:@"NSCocoaErrorDomain" \
code:-1	\
userInfo:[NSDictionary dictionaryWithObject:errStr forKey:NSLocalizedDescriptionKey]]; \
}

#define SetNSError(ERROR_VAR, FORMAT,...) SetNSErrorFor(__func__, ERROR_VAR, FORMAT, ##__VA_ARGS__)

@implementation NSObject (Swizzle)

+ (BOOL)zy_swizzleMethod:(SEL)method withMethod:(SEL)nMethod error:(NSError **)error {
    
    Class selfClass = [self class];
    
    SEL originalSelector = method;
    
    SEL swizzledSelector = nMethod;
    
    Method originalMethod = class_getInstanceMethod(selfClass, originalSelector);
    
    if (!originalMethod) {
        SetNSError(error, @"original method %@ not found for class %@", NSStringFromSelector(originalSelector), selfClass);
        return NO;
    }
    
    Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
    
    if (!swizzledMethod) {
        SetNSError(error, @"swizzle method %@ not found for class %@", NSStringFromSelector(originalSelector), selfClass);
        return NO;
    }
    
    BOOL isSuccess = class_addMethod(selfClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (isSuccess) {
        
        class_replaceMethod(selfClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        
    }else {
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
    return isSuccess;
    
}

+ (BOOL)zy_swizzleClassMethod:(SEL)method withMethod:(SEL)nMethod error:(NSError **)error {
    
    Class selfClass = [self class];
    
    SEL originalSelector = method;
    
    SEL swizzledSelector = nMethod;
    
    Method originalMethod = class_getClassMethod(selfClass, originalSelector);
    
    if (!originalMethod) {
        SetNSError(error, @"original method %@ not found for class %@", NSStringFromSelector(originalSelector), selfClass);
        return NO;
    }
    
    Method swizzledMethod = class_getClassMethod(selfClass, swizzledSelector);
    
    if (!swizzledMethod) {
        SetNSError(error, @"swizzle method %@ not found for class %@", NSStringFromSelector(originalSelector), selfClass);
        return NO;
    }
    
    BOOL isSuccess = class_addMethod(selfClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (isSuccess) {
        
        class_replaceMethod(selfClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        
    }else {
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
    return isSuccess;
    
}


@end
