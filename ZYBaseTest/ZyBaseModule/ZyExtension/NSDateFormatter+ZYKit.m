//
//  NSDateFormatter+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSDateFormatter+ZYKit.h"

@implementation NSDateFormatter (ZYKit)

+ (instancetype)shareInstance {
    static NSDateFormatter *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NSDateFormatter alloc]init];
        
    });
    return instance;
}

@end
