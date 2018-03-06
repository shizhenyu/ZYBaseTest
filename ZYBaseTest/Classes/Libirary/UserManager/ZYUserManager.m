//
//  ZYUserManager.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ZYUserManager.h"

@interface ZYUserManager ()

@end

@implementation ZYUserManager

+ (instancetype)sharedManager {
    
    static ZYUserManager *instance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[ZYUserManager alloc] init];
        
        instance.currentUser = [ZYUserManager userForLocal];
    });
    
    return instance;
}

+ (BOOL)saveUserToLocal:(ZYUser *)user {
    
    NSString *path = [kUserFileName documentDirectory];
    
    [self deleteLocalUser];
    
    BOOL isSuccess = [NSKeyedArchiver archiveRootObject:user toFile:path];
    
    if (isSuccess) {
        
        [ZYUserManager sharedManager].currentUser = user;
    }
    
    return isSuccess;
}

+ (ZYUser *)userForLocal {
    
    NSString *path = [kUserFileName documentDirectory];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:path]) {
        
        ZYUser *user = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        return user;
    }
    
    return nil;
}

+ (BOOL)deleteLocalUser {
    
    NSString *path = [kUserFileName documentDirectory];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL fileExist = [fileManager fileExistsAtPath:path];
    
    if (fileExist) {
        
        NSError *error;
        
        BOOL isDelete = [fileManager removeItemAtPath:path error:&error];
        
        return isDelete;
    }
    
    return NO;
}

+ (BOOL)userIsLogin {
    
    NSString *path = [kUserFileName documentDirectory];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL fileExist = [fileManager fileExistsAtPath:path];
    
    if (!fileExist) {
        
        return NO;
    }
    
    return YES;
}

@end
