//
//  LoginMainView.h
//  ZYBaseTest
//
//  Created by youyun on 2018/6/29.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginMainViewDelegate <NSObject>

- (void)confirmLoginWithUserName:(NSString *)userName userPassword:(NSString *)password;

@end

@interface LoginMainView : UIView

@property (nonatomic, weak) id <LoginMainViewDelegate> delegate;

@end
