//
//  UIBarButtonItem+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UIBarButtonItem+ZYKit.h"
#import <objc/runtime.h>

static const NSString * block_key;

@implementation UIBarButtonItem (ZYKit)

- (instancetype)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style action:(void(^)(id sender))block {
    
    objc_setAssociatedObject(self, &block_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UIBarButtonItem *item = [self initWithImage:image style:style target:self action:@selector(invoke:)];
    
    return item;
    
}

- (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style action:(void(^)(id sender))block {
    
    objc_setAssociatedObject(self, &block_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UIBarButtonItem *item = [self initWithTitle:title style:style target:self action:@selector(invoke:)];
    
    return item;
    
}

- (instancetype)initWithCustomView:(UIView *)customView events:(UIControlEvents)events action:(void(^)(id sender))block {
    
    BOOL isControl = [customView isKindOfClass:[UIControl class]];
    
    if (isControl) {
        
        UIControl *control = (UIControl *)customView;
        
        objc_setAssociatedObject(self, &block_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        [control addTarget:self action:@selector(invoke:) forControlEvents:events];
    }
    
    UIBarButtonItem *item = [self initWithCustomView:customView];
    
    return item;
    
}

+ (instancetype)barButtonItemWithCustomView:(UIView *)customView events:(UIControlEvents)events action:(void(^)(id sender))block {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customView events:events action:block];
    
    return item;
    
}

+ (instancetype)barButtonItemWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style action:(void(^)(id sender))block {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:style action:block];
    
    return item;
}

+ (instancetype)barButtonWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style action:(void(^)(id sender))block {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title style:style action:block];
    
    return item;
    
}

- (void)invoke:(id)sender {
    
    void(^block)(id sender) = objc_getAssociatedObject(self, &block_key);
    
    if (block) {
        
        block(sender);
        
    }
}



@end
