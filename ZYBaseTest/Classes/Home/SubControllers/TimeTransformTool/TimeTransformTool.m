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
    
    return @[todayEnd];
}

@end
