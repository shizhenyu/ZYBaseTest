//
//  TimeTransformTool.m
//  ZYBaseTest
//
//  Created by youyun on 2018/2/8.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "TimeTransformTool.h"

@implementation TimeTransformTool

+ (instancetype)sharedTimeTool
{
    static TimeTransformTool *timeTool;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        timeTool = [[TimeTransformTool alloc]init];
        
    });
    
    return timeTool;
}

- (NSString *)stringFromDate:(NSDate *)date withDateFormatType:(DateFormatType)formatType{
    NSString *dateString;
    
    NSDateFormatter *formatter = [NSDateFormatter shareInstance];
    
    switch (formatType) {
        case DateFormatTypeYearMonth:
        {
            formatter.dateFormat = @"YYYY-MM";
        }
            break;
            
        case DateFormatTypeYearMonthDate:
        {
            formatter.dateFormat = @"YYYY-MM-dd";

        }
            break;
            
        case DateFormatTypeHour:
        {
            formatter.dateFormat = @"YYYY-MM-dd HH";

        }
            break;
            
        case DateFormatTypeHourMinute:
        {
            formatter.dateFormat = @"YYYY-MM-dd HH:mm";

        }
            break;
            
        case DateFormatTypeHourMinuteSecond:
        {
            formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
        }
            break;
            
        default:
            break;
    }
    
    dateString = [formatter stringFromDate:date];
    
    return dateString;
}

- (NSArray *)fetchTodayBeginAndEndTime {
    
    NSString *dateStr = [self stringFromDate:[NSDate date] withDateFormatType:DateFormatTypeYearMonthDate];
    
    NSString *beginDate = [NSString stringWithFormat:@"%@ 00:00:00",dateStr];
    
    NSString *endDate = [self stringFromDate:[NSDate date] withDateFormatType:DateFormatTypeHourMinuteSecond];
    
    return @[beginDate,endDate];
    
}

- (NSArray *)fetchYesterdayBeginAndEndTime {
    
    NSDateComponents *component = [[NSDateComponents alloc]init];
    component.day = -1;
    
    NSDate *yesterday = [[NSCalendar currentCalendar] dateByAddingComponents:component toDate:[NSDate date] options:0];
    
    NSString *string = [self stringFromDate:yesterday withDateFormatType:DateFormatTypeYearMonthDate];
    
    NSString *yesterdayBegin = [NSString stringWithFormat:@"%@ 00:00:00",string];
    NSString *yeterdayEnd = [NSString stringWithFormat:@"%@ 23:59:59",string];
    
    return @[yesterdayBegin, yeterdayEnd];
}

- (NSArray *)fetchWeekdayBeginAndEndTime {
    
    NSString *todayEnd = [self stringFromDate:[NSDate date] withDateFormatType:DateFormatTypeHourMinuteSecond];
    
    NSDateComponents *component = [[NSDateComponents alloc]init];
    component.day = -6;
    
    NSDate *weekday = [[NSCalendar currentCalendar] dateByAddingComponents:component toDate:[NSDate date] options:0];
    
    NSString *weekBegin = [self stringFromDate:weekday withDateFormatType:DateFormatTypeYearMonthDate];
    
    NSString *beginString = [NSString stringWithFormat:@"%@ 00:00:00",weekBegin];
    
    return @[beginString,todayEnd];
}

- (NSArray *)fetchThisMonthBeginAndEndTime {
    
    NSDate *currentDate = [NSDate date];
    
    NSString *todayEnd = [self stringFromDate:currentDate withDateFormatType:DateFormatTypeHourMinuteSecond];
    
    NSString *monthBegin = [self stringFromDate:currentDate withDateFormatType:DateFormatTypeYearMonth];
    
    NSString *beginString = [NSString stringWithFormat:@"%@-01 00:00:00",monthBegin];
    
    return @[beginString,todayEnd];
}

- (NSArray *)fetchLastMonthBeginAndEndTime {
    
    NSDateFormatter *dateformatter = [NSDateFormatter shareInstance];
    dateformatter.dateFormat = @"yyyy-MM-dd";
    
    NSDate *currentDate = [NSDate date];
    NSString *currentDateStr = [dateformatter stringFromDate:currentDate];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger currentYear = [[[currentDateStr componentsSeparatedByString:@"-"] firstObject] integerValue];
    NSInteger currentMonth = [[[currentDateStr componentsSeparatedByString:@"-"] objectAtIndex:1] integerValue];
    
    NSDateComponents *component1 = [[NSDateComponents alloc]init];
    
    [component1 setYear:currentYear];
    [component1 setMonth:currentMonth];
    [component1 setDay:1];
    
    NSDate *currentMonthBeginDate = [calendar dateFromComponents:component1];
    NSDate *lastMonthEndDate = [currentMonthBeginDate dateByAddingTimeInterval:-1];
    
    NSDateComponents *component2 = [[NSDateComponents alloc]init];
    
    currentMonth--;
    
    if (currentMonth == 0) {
        currentMonth = 12;
        currentYear--;
    }
    
    [component2 setYear:currentYear];
    [component2 setMonth:currentMonth];
    [component2 setDay:1];
    
    NSDate *lastMonthStartDate = [calendar dateFromComponents:component2];
    
    NSString *lastMonthBeginString = [self stringFromDate:lastMonthStartDate withDateFormatType:DateFormatTypeYearMonthDate];
    
    NSString *lastMonthEndString = [self stringFromDate:lastMonthEndDate withDateFormatType:DateFormatTypeYearMonthDate];
    
    return @[[NSString stringWithFormat:@"%@ 00:00:00",lastMonthBeginString], [NSString stringWithFormat:@"%@ 23:59:59", lastMonthEndString]];
    
}

- (NSString *)timeStatusWithTimeStamp:(NSTimeInterval)timestamp {
    
    NSString *status = @"";
    
    NSDate *nowDate = [NSDate new];
    
    NSDate *targetDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSTimeInterval nowTimeInterval = [nowDate timeIntervalSinceDate:targetDate];
    
    if (nowTimeInterval < 60) {
        status = @"刚刚";
    }else if(nowTimeInterval >= 60 && nowTimeInterval < 3600){
        
        int min = (int)(nowTimeInterval / 60.0);
        
        status = [NSString stringWithFormat:@"%d分钟前",min];
        
    }else if(nowTimeInterval >= 3600 && nowTimeInterval <= 24 * 60 * 60 ) {
        
        int hour = (int)(nowTimeInterval / (60 * 60.0));
        
        status = [NSString stringWithFormat:@"%d小时前",hour];
    }else {
        
        NSString *relaitonStr = [self holidayForDate];
        
        if (relaitonStr) {
            
            status = [NSString stringWithFormat:@"%@ %@",relaitonStr,[self stringFromDateWithDateFormat:@"HH:mm"]];
            
        }else {
            
            status = [self stringFromDateWithDateFormat:@"MM-dd HH:mm"];
        }
        
    }
    
    return status;
    
}

- (NSString *)stringFromDateWithDateFormat:(NSString *)dateFormat {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter shareInstance];
    
    [dateFormatter setDateFormat:dateFormat];
    
    return [dateFormatter stringFromDate:[NSDate new]];
}

- (NSString *)holidayForDate {
    
    NSDate *nowdate = [NSDate date];
    
    NSDateComponents *dateCom = [[NSCalendar currentCalendar]components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nowdate];
    
    NSDateComponents *nowDateCom = [[NSCalendar currentCalendar]components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nowdate];
    
    NSString *holidayStr = nil;
    
    NSDate *nowDate = [[NSCalendar currentCalendar] dateFromComponents:nowDateCom];
    
    NSTimeInterval timeInterval = [nowdate timeIntervalSinceDate:nowDate];
    
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

@end
