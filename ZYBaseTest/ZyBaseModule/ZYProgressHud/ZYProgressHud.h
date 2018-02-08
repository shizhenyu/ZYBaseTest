//
//  ZYProgressHud.h
//  ZYBaseTest
//
//  Created by youyun on 2018/2/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYProgressHud : NSObject

extern void ShowMaskStatus(UIView *toView, NSString *status);

extern void ShowMessage(UIView *toView, NSString *status);

extern void DismissHud(UIView *toView);

@end
