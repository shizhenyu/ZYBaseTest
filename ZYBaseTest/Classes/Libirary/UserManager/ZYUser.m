//
//  ZYUser.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ZYUser.h"

@interface ZYUserManager ()<NSCoding>

@end

@implementation ZYUser

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.userPassword forKey:@"userPassword"];
    [aCoder encodeObject:self.userID forKey:@"userID"];

}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userPassword = [aDecoder decodeObjectForKey:@"userPassword"];
        self.userID = [aDecoder decodeObjectForKey:@"userID"];
    }
    
    return self;
}

@end
