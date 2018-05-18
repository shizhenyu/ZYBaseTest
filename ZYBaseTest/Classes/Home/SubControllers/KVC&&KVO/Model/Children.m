//
//  Children.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "Children.h"

@implementation Children{
    NSObject *father;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        father = (NSObject *)[NSClassFromString(@"Father") new];
        
        [self addObserver:father forKeyPath:@"age" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
        
        [self addObserver:father forKeyPath:@"height" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)dealloc {
    
    [self removeObserver:father forKeyPath:@"age"];
    [self removeObserver:father forKeyPath:@"height"];
}

@end
