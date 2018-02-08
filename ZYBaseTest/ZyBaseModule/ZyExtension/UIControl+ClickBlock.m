//
//  UIControl+ClickBlock.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UIControl+ClickBlock.h"
#import <objc/runtime.h>

static const int block_key;

@implementation UIControl (ClickBlock)

- (void)addTargetForControlEvents:(UIControlEvents )events action:(void(^)(id sender))block {
    
    objc_setAssociatedObject(self, &block_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(invoke:) forControlEvents:events];
    
}

- (void)invoke:(id)sender {
    
    void(^block)(id sender) = objc_getAssociatedObject(self, &block_key);
    
    if (block) {
        block(sender);
    }
    
}

@end
