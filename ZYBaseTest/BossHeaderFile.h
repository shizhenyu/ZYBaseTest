//
//  BossHeaderFile.h
//  ZYBaseTest
//
//  Created by youyun on 2018/7/3.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#ifndef BossHeaderFile_h
#define BossHeaderFile_h

#define ScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight         [[UIScreen mainScreen] bounds].size.height

#define Suit(num) num * ScreenWidth / 375.0

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define MCNavMainColor UIColorFromRGB(0x1C2F5A)

#endif /* BossHeaderFile_h */
