//
//  ZYUser.h
//  ZYBaseTest
//
//  Created by youyun on 2018/3/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYUser : NSObject

/** 用户ID */
@property (nonatomic, copy) NSString *userID;

/** 用户姓名 */
@property (nonatomic, copy) NSString *userName;

/** 用户密码 */
@property (nonatomic, copy) NSString *userPassword;

@end
