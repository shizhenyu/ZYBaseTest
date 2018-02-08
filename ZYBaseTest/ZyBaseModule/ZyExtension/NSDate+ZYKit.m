//
//  NSDate+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSDate+ZYKit.h"
#import "NSDateFormatter+ZYKit.h"

@implementation NSDate (ZYKit)


- (NSUInteger)daysOfMonthForDate:(NSDate *)date {
    
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}


- (NSString *)dateComponentStringWithComponentType:(DateComponentStringType)type {
    
    NSDateComponents *dateCom = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:self];
    
    NSInteger component = 0;
    
    switch (type) {
        case DateComponentStringTypeYear:
            component = dateCom.year;
            break;
            
        case DateComponentStringTypeMonth:
            component = dateCom.month;
            break;
            
        case DateComponentStringTypeDay:
            component = dateCom.day;
            break;
            
        case DateComponentStringTypeWeekDay:
            component = dateCom.weekday;
            break;
            
        case DateComponentStringTypeHour:
            component = dateCom.hour;
            break;
            
        case DateComponentStringTypeMin:
            component = dateCom.minute;
            break;
            
        case DateComponentStringTypeSecond:
            component = dateCom.second;
            break;
            
        default:
            break;
    }
    
    return [NSString stringWithFormat:@"%ld",(long)component];
}

- (NSDate *)fetchLastMonthThisDate {
    
    NSDateComponents *com = [[NSDateComponents alloc]init];
    
    com.month = -1;
    /**
     *  上个月的今天
     */
    NSDate *lastDate = [[NSCalendar currentCalendar] dateByAddingComponents:com toDate:self options:0];
    return lastDate;
}

/**
 *  获取日期模型
 *
 */
- (NSArray *)modelFromData:(NSDate *)fromDate {
    
    NSDateComponents *fromDateCom = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:fromDate];
    
    NSDateComponents *toDateCom = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:self];
    
    NSInteger fromYear = fromDateCom.year;
    NSInteger toYear = toDateCom.year;
    NSInteger fromMonth = fromDateCom.month;
    NSInteger toMonth = toDateCom.month;
    
    /**
     *  装载所有的月份的数组
     */
    NSMutableArray *array = [NSMutableArray array];
    
    // 计算所有的月份
    
    NSInteger allMonthNum = (toYear - fromYear) * 12 + (toMonth - fromMonth)+1;
    
    for (int i = 0; i < allMonthNum; i++) {
        
        NSMutableArray *monthArray = [NSMutableArray array];
        
        /**
         *  计算这个月有多少天
         */
        /**
         *  后面 几个月的 今天
         */
        
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.month = i;
        
        NSDate *nextToday = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:fromDate options:0];
        
        
        /**
         *  计算上个月在这个月中显示的天数
         */
        
        /**
         *  上个月的今天
         */
        NSDate *lastDay = [nextToday fetchLastMonthThisDate];
        
        /**
         *  上个月的天数
         */
        NSUInteger lastDayCount = [self daysOfMonthForDate:lastDay];
        
        /**
         *  取得这个月的 第一天
         */
        NSDateComponents *currentCom = [[NSCalendar currentCalendar]components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nextToday];
        
        [currentCom setDay:1];
        
        NSDate *firstDay = [[NSCalendar currentCalendar]dateFromComponents:currentCom];
        
        /**
         *  获取这个月第一天 是星期几
         */
        NSUInteger weekDay = [[NSCalendar currentCalendar]ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDay];
        
        /**
         *  上个月在本月显示的天数
         */
        
        NSUInteger lastMonthShowDays;
        
        if (weekDay == 1) {
            lastMonthShowDays = 6;
        }else {
            lastMonthShowDays = weekDay - 2;
        }
        // 构造上个月在本月显示的模型
        for (NSUInteger i = (lastDayCount - lastMonthShowDays + 1); i < lastDayCount + 1; i++) {
            
            NSDateComponents *lastCom = [[NSCalendar currentCalendar]components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:lastDay];
            
            [lastCom setDay:i];
            
            NSDate *lastShowDay = [[NSCalendar currentCalendar] dateFromComponents:lastCom];
            
            /**
             *  获取这天的weekDay
             */
            NSUInteger weekDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:lastShowDay];
            
            
            /**
             *  创建模型
             */
            CYCalendarModel *model = [CYCalendarModel new];
            
            model.year = lastCom.year;
            
            model.month = lastCom.month;
            
            model.day = lastCom.day;
            
            model.weekDay = weekDay;
            
            model.dateType = CalendarDayTypeEmpty;
            
            [monthArray addObject:model];
            
        }
        
        /**
         *  这个月有几天
         */
        NSRange totalDaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:nextToday];
        
        for (int i = 1; i < totalDaysInMonth.length + 1; i++) {
            
            /**
             *  获取这个月的第 i 天
             */
            
            NSDateComponents *dayCom = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay  fromDate:nextToday];
            
            
            [dayCom setDay:i];
            
            NSDate *dayOfMonth = [[NSCalendar currentCalendar] dateFromComponents:dayCom];
            
            /**
             *  获取这天的weekDay
             */
            NSUInteger weekDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:dayOfMonth];
            
            /**
             *  创建填充模型
             */
            
            CYCalendarModel *model = [CYCalendarModel new];
            
            model.year = dayCom.year;
            
            model.month = dayCom.month;
            
            model.day = dayCom.day;
            
            model.weekDay = weekDay;
            
            /**
             *  比较fromDate - dayOfMonth 与 fromDate - nowDate 的时间差大小，判断是将来还是现在
             */
            
            /**
             从0时开始的fromDate
             */
            NSDate *initFromDate = [[NSCalendar currentCalendar]dateFromComponents:fromDateCom];
            
            NSDateComponents *nowDateCom = [[NSCalendar currentCalendar]components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
            
            /**
             从0时开始的nowDate
             */
            NSDate *nowDate = [[NSCalendar currentCalendar]dateFromComponents:nowDateCom];
            
            NSTimeInterval deltaT = [dayOfMonth timeIntervalSinceDate:initFromDate];
            
            NSTimeInterval nowDeltaT = [nowDate timeIntervalSinceDate:initFromDate];
            
            if (nowDeltaT > deltaT) {
                
                model.dateType = CalendarDayTypePast;
            }else {
                
                model.dateType = CalendarDayTypeFuture;
                
                /**
                 *  这里判断是不是周末
                 */
                if (weekDay == 7 || weekDay == 1) {
                    
                    model.dateType = CalendarDayTypeWeek;
                }
                
            }
            
            model.holiday = [dayOfMonth holidayForDate];
            
            [monthArray addObject:model];
            
        }
        
        [array addObject:monthArray];
        
    }
    
    return array;
    
}

- (NSString *)holidayForDate {
    
    NSDateComponents *dateCom = [[NSCalendar currentCalendar]components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    
    NSDateComponents *nowDateCom = [[NSCalendar currentCalendar]components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate new]];
    
    NSString *holidayStr = nil;
    
    NSDate *nowDate = [[NSCalendar currentCalendar] dateFromComponents:nowDateCom];
    
    NSTimeInterval timeInterval = [self timeIntervalSinceDate:nowDate];
    
    if (timeInterval == - 3600 * 24 * 2) {
        
        holidayStr = @"前天";
        
    }else if (timeInterval == - 3600 * 24) {
        
        holidayStr = @"昨天";
        
    }else if (timeInterval == 0) {
        
        holidayStr = @"今天";
        
    }else if (timeInterval == 3600 * 24){
        
        holidayStr = @"明天";
        
    }
    
    
    if (dateCom.month == 1 && dateCom.day == 1)
    {
        holidayStr = @"元旦";
        //  2.14情人节
    }else if (dateCom.month == 2 && dateCom.day == 14)
    {
        holidayStr = @"情人节";
        //  3.8妇女节
    }else if (dateCom.month == 3 && dateCom.day == 8)
    {
        holidayStr = @"妇女节";
        //  5.1劳动节
    }else if (dateCom.month == 5 && dateCom.day == 1)
    {
        holidayStr = @"劳动节";
        //  6.1儿童节
    }else if (dateCom.month == 6 && dateCom.day == 1)
    {
        holidayStr = @"儿童节";
        //  8.1建军节
    }else if (dateCom.month == 8 && dateCom.day == 1)
    {
        holidayStr = @"建军节";
        //  9.10教师节
    }else if (dateCom.month == 9 && dateCom.day == 10)
    {
        holidayStr = @"教师节";
        //  10.1国庆节
    }else if (dateCom.month == 10 && dateCom.day == 1)
    {
        holidayStr = @"国庆节";
        //  11.1植树节
    }else if (dateCom.month == 11 && dateCom.day == 1)
    {
        holidayStr = @"植树节";
        //  11.11光棍节
    }else if (dateCom.month == 11 && dateCom.day == 11)
    {
        holidayStr = @"光棍节";
    }else
    {
        //  这里写其它的节日
    }
    
    return holidayStr;
    
}

- (NSString *)stringFromDateWithDateFormat:(NSString *)dateFormat {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter shareInstance];
    
    [dateFormatter setDateFormat:dateFormat];
    
    return [dateFormatter stringFromDate:self];
}


@end


@implementation CYCalendarModel



@end
