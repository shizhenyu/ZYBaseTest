//
//  UISearchBar+ZYSearchBarPlaceholder.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/23.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UISearchBar+ZYSearchBarPlaceholder.h"

@implementation UISearchBar (ZYSearchBarPlaceholder)

-(void)changeLeftPlaceholder:(NSString *)placeholder {
    self.placeholder = placeholder;
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector]) {
        BOOL centeredPlaceholder = NO;
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&centeredPlaceholder atIndex:2];
        [invocation invoke];
    }
}

@end
