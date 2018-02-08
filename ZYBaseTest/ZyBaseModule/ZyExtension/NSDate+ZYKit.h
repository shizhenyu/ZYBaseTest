//
//  NSDate+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DateComponentStringType) {
    DateComponentStringTypeYear,
    DateComponentStringTypeMonth,
    DateComponentStringTypeDay,
    DateComponentStringTypeWeekDay,
    DateComponentStringTypeHour,
    DateComponentStringTypeMin,
    DateComponentStringTypeSecond
    
};

@interface NSDate (ZYKit)

/**
 获取从某个时间起到self的所有日历模型，模型类型：CYCalendarModel
 
 @param fromDate 起始时间
 @return 模型数组
 */
- (NSArray *)modelFromData:(NSDate *)fromDate;

/**
 获取这个时间点月份有多少天
 
 @param date 时间点
 @return 天数
 */
- (NSUInteger)daysOfMonthForDate:(NSDate *)date;

/**
 这个日期 组件的字符串形式
 
 @param type 组件类型
 @return 组件值
 */
- (NSString *)dateComponentStringWithComponentType:(DateComponentStringType)type;

/**
 获取这个时间点对应的上个月的时间点
 
 @return 上个月
 */
- (NSDate *)fetchLastMonthThisDate;


/**
 根据当前日期self,返回该日期对应的节假日，反之为nil
 
 @return 节假日
 */
- (NSString *)holidayForDate;

/**
 根据dateFormat 返回指定格式的日期字符串
 
 @param dateFormat 指定的格式
 @return 日期字符串
 */
- (NSString *)stringFromDateWithDateFormat:(NSString *)dateFormat;


@end

typedef NS_ENUM(NSInteger,CalendarDayType) {
    CalendarDayTypePast, // 已经过去的时间
    CalendarDayTypeFuture,  // 将来的时间
    CalendarDayTypeWeek, // 周末
    CalendarDayTypeHoliday, // 节假日
    CalendarDayTypeEmpty // 空白日期，每个月，月头月尾空白部分
};


/**
 日历模型
 */
@interface CYCalendarModel : NSObject

@property (nonatomic,assign) NSInteger year;

@property (nonatomic,assign) NSInteger month;

@property (nonatomic,assign) NSInteger day;

@property (nonatomic,assign) NSInteger weekDay;

@property (nonatomic,copy) NSString *holiday;

@property (nonatomic,assign) CalendarDayType dateType;


@end
