//
//  NSString+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ZYKit)


/**
 获取一段字符串的高度
 
 @param maxWidth 最大宽度
 @param font 采用的字体
 @return 计算得出的字符串高度
 */
- (CGFloat)heightWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font ;

/**
 获取一段字符串的宽度
 
 @param maxHeight 最大高度
 @param font 采用的字体
 @return 计算得出的字符串宽度
 */
- (CGFloat)widthWithMaxHeight:(CGFloat)maxHeight font:(UIFont *)font;


/**
 清楚字符串中 被指定的部分
 
 @param aString 指定部分的字符串
 @return 生成的新的字符串
 */
- (NSString *)stringByClearSpecificCharacter:(NSString *)aString;

/**
 MD5加密
 
 @return MD5加密字符串
 */
- (NSString *)md5String;
/**
 取出指定下标的字符串
 
 @param index 待取的下标
 @return 生成的新的字符串
 */
- (NSString *)stringOfIndex:(NSUInteger)index;

/**
 取出字符串里所有的 字符
 
 @return 装载所有字符的数组
 */
- (NSArray *)allCharacters;


/**
 在字符串指定位置插入一个字串
 
 @param aString 待插入的字串
 @param index 指定位置
 @return 新的字符串
 */
- (NSString *)insertSubString:(NSString *)aString atIndex:(NSUInteger)index;

/**
 删除一段字串
 
 @param subString 待删除的字串
 @return 生成的新的字符串
 */
- (NSString *)deleteSubString:(NSString *)subString;

/**
 沙盒下的document文件夹路径
 
 @return document文件夹路径
 */
- (NSString *)documentDirectory;

/**
 沙盒下的caches文件夹路径
 
 @return caches文件夹路径
 */
- (NSString *)cachesDirectory;

/**
 沙盒下的preferences文件夹路径
 
 @return preferences文件夹路径
 */
- (NSString *)preferencesDirectory;

/**
 沙盒下的temp文件夹路径
 
 @return temp文件夹路径
 */
- (NSString *)tempDirectory;

/**
 将json字符串转换成对象
 
 @return 生成的OC对象
 */
- (id)jsonStringToObject;


/**
 将对象转换成json字符串
 
 @param object 待转换的对象
 @return 生成的json字符串
 */
+ (NSString *)objectToJsonString:(id)object;

/**
 根据时间戳，返回改时间和当前时间的关系，例如：“刚刚”、“1分钟前”
 
 @param timestamp 时间戳
 @return 关系字符串
 */
+ (NSString *)timeStatusWithTimeStamp:(NSTimeInterval)timestamp;

#pragma mark - 正则表达式
- (BOOL)isPhoneNumber;

- (BOOL)judgeIdentityStringValid;

- (BOOL)isValidChinese;

@end
