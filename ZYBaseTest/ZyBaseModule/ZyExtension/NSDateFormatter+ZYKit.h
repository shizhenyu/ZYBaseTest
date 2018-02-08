//
//  NSDateFormatter+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (ZYKit)

/**
 因为NSDateFormatter创建颇耗性能，这里获取全局的NSDateFormatter对象
 
 @return NSDateFormatter对象
 */
+ (instancetype)shareInstance;

@end
