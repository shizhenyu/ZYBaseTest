//
//  NSTimer+Block.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Block)

/**
 解决dealloc里释放不了timer，因为不在持有self，所有可以正常释放
 
 @param ti 时间间隔
 @param yesOrNo 是否重复
 @param block 回调block
 @return timer实例
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo  invokeBlock:(void (^)(NSTimer *timer))block;

@end
