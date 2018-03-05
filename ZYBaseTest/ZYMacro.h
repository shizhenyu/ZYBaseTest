//
//  ZYMacro.h
//  ZYBaseTest
//
//  Created by youyun on 2018/2/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#ifndef ZYMacro_h
#define ZYMacro_h

/** 屏幕宽高 **/
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kWidth(width) width * kScreenWidth / 375.0
#define kHeight(height) height * kScreenHeight / 667.0

/** 字体设置 **/
#define kFont(size) [UIFont systemFontOfSize:size]
#define kBFont(size) [UIFont boldSystemFontOfSize:size]

#define kImage(imageName) [UIImage imageNamed:imageName]

/** 日志打印 **/
#define LogFunc Log(@"%s", __func__)

/** 打印生命周期方法名 */
#define ZYLogLifeFunc(self) NSLog(@"%@", [NSString stringWithFormat:@"%@->%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd)])

#if DEBUG
#define Log(FORMAT, ...) fprintf(stderr,"\nFunction:%s line:%d \n content:%s \n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define Log(FORMAT, ...) nil
#endif

#define kWeakSelf __weak typeof(self)weakSelf = self;

/** 弱引用 **/
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

/** 强引用 **/
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* ZYMacro_h */
