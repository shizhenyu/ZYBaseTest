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

// 状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

// 是否为iPhone X
#define IsIPhone_X  kStatusBarHeight == 44.f ? YES : NO

// 导航栏高度
#define kNavigationBarHeight (IsIPhone_X ? 88.f : 64.f)

// tabBar 高度
#define kTabBarHeight    (IsIPhone_X ? 83.f : 49.f)

/** 字体设置 **/
#define kFont(size) [UIFont systemFontOfSize:size]
#define kBFont(size) [UIFont boldSystemFontOfSize:size]

/** 图片名字 */
#define kImage(imageName) [UIImage imageNamed:imageName]

#define ZYUserDefault [NSUserDefaults standardUserDefaults]

/** 弱引用 */
#define kWeakSelf __weak typeof(self)weakSelf = self;

/** 打印生命周期方法名 */
#define ZYLogLifeFunc(self) NSLog(@"%@", [NSString stringWithFormat:@"%@->%@",NSStringFromClass([self class]), NSStringFromSelector(_cmd)])

#if DEBUG
#define Log(FORMAT, ...) fprintf(stderr,"\nFunction:%s line:%d \n content:%s \n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define Log(FORMAT, ...) nil
#endif


/** 消除警告 */
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

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
