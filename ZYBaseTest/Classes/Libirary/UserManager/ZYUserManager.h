//
//  ZYUserManager.h
//  ZYBaseTest
//
//  Created by youyun on 2018/3/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYUser.h"

#define kUserFileName @"ZYUser"

@interface ZYUserManager : NSObject

@property (nonatomic, strong) ZYUser *currentUser;

/**
 初始化方法

 @return ZYUserManager的实例对象
 */
+ (instancetype)sharedManager;

/**
 存储用户模型到本地沙盒

 @param user 用户对象
 @return YES 表示存储成功
 */
+ (BOOL)saveUserToLocal:(ZYUser *)user;


/**
 从本地取出缓存的用户对象

 @return 用户对象
 */
+ (ZYUser *)userForLocal;


/**
 删除本地的用户信息

 @return YES 表示删除成功
 */
+ (BOOL)deleteLocalUser;


/**
 用户是否登录

 @return YES 表示用户已经登录
 */
+ (BOOL)userIsLogin;
@end
