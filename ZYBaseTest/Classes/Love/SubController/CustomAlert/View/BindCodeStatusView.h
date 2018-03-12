//
//  BindCodeStatusView.h
//  ZYBaseTest
//
//  Created by youyun on 2018/3/12.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, StatusType) {
    StatusTypeBind,
    StatusTypeUnBind,
    StatusTypeNoAccess,
};

@interface BindCodeStatusView : UIView

@property (nonatomic, copy) void(^confirmBlock)(void);

+ (instancetype)shareStatusViewWithType:(StatusType)type;

- (void)show;

- (void)hide;

@end
