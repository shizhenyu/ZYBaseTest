//
//  TimeTransformTool.h
//  ZYBaseTest
//
//  Created by youyun on 2018/2/8.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DateFormatType) {
    DateFormatTypeYearMonth,
    DateFormatTypeYearMonthDate,
    DateFormatTypeHour,
    DateFormatTypeHourMinute,
    DateFormatTypeHourMinuteSecond
};

@interface TimeTransformTool : NSObject

/**
 * 实例化方法
 */
+ (instancetype)sharedTimeTool;

/**
 日期转换为字符串

 @param date 需要转换的日期
 @param formatType 需要转换成的类型
 @return 返回对应格式的日期字符串
 */
- (NSString *)stringFromDate:(NSDate *)date withDateFormatType:(DateFormatType)formatType;


/**
 获取今天的开始时间和结束时间

 @return 返回包含日期的数组 第一个元素是开始日期，第二个是结束日期
 */
- (NSArray *)fetchTodayBeginAndEndTime;


/**
 获取昨天的开始时间和结束时间

 @return 返回包含日期的数组 第一个元素是开始日期，第二个是结束日期
 */
- (NSArray *)fetchYesterdayBeginAndEndTime;

/**
 获取前七天的开始时间和结束时间
 
 @return 返回包含日期的数组 第一个元素是开始日期，第二个是结束日期
 */
- (NSArray *)fetchWeekdayBeginAndEndTime;


/**
 获取这个月的开始时间和结束时间
 
 @return 返回包含日期的数组 第一个元素是开始日期，第二个是结束日期
 */
- (NSArray *)fetchThisMonthBeginAndEndTime;

/**
 获取上个月的开始时间和结束时间
 
 @return 返回包含日期的数组 第一个元素是开始日期，第二个是结束日期
 */
- (NSArray *)fetchLastMonthBeginAndEndTime;


/**
 根据时间戳，返回改时间和当前时间的关系，例如：“刚刚”、“1分钟前”
 
 @param timestamp 时间戳
 @return 关系字符串
 */
- (NSString *)timeStatusWithTimeStamp:(NSTimeInterval)timestamp;

@end
