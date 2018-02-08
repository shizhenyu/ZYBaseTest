//
//  NSTimer+Block.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo  invokeBlock:(void (^)(NSTimer *timer))block {
    
    NSTimer *timer = [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(invoke:) userInfo:[block copy] repeats:yesOrNo];
    
    return timer;
    
}

+ (void)invoke:(NSTimer *)timer {
    
    void (^block)(NSTimer *timer) = timer.userInfo;
    
    if (block) {
        block(timer);
    }
    
}

@end
