//
//  Tools+Date.m
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools+Date.h"

@implementation Tools (Date)


#pragma mark - 格式化日期字符串
+ (NSString *)getCurrentDateStringByFormat:(NSString *)format
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    NSString *strTime = [formatter stringFromDate:date];
    
    return strTime;
}

#pragma mark - date转string
+ (NSString *)getDateStringWithDate:(NSDate *)date Format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    NSString *strTime = [formatter stringFromDate:date];
    
    return strTime;
}

#pragma mark - 字符串转时间
+ (NSDate *)dateWithDateString:(NSString *)dateString Format:(NSString *)format {
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:format];//设定时间格式,这里可以设置成自己需要的格式
    
    NSDate *date =[dateFormat dateFromString:dateString];
    
    return date;
}

+ (NSString *)dateStringWithTimeInterval:(NSString *)timeInterval format:(NSString *)format
{
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeInterval doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (long)compareDate1:(NSDate *)date1 withDate2:(NSDate *)date2 type:(int)type
{
    NSTimeInterval  timeInterval = [date1 timeIntervalSinceDate:date2];
    timeInterval = -timeInterval;
    long result = 0;
    switch (type) {
        case 1:
            result = (long)timeInterval;    //秒
            break;
        case 2:
            result = (long)timeInterval/60;    //分
            break;
        case 3:
            result = (long)timeInterval/60/60;    //时
            break;
        case 4:
            result = (long)timeInterval/60/60/24;    //天
            break;
        case 5:
            result = (long)timeInterval/60/60/24/30;    //月
            break;
        case 6:
            result = (long)timeInterval/60/60/24/365;    //年
            break;
        default:
            break;
    }
    return result;
}



- (NSString*)getWeekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shenzhen"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

@end
