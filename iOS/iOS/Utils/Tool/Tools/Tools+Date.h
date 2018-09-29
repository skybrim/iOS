//
//  Tools+Date.h
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools.h"

@interface Tools (Date)

/**
 *  格式化当前时间
 *
 *  @param format 格式
 *
 *  @return 格式化后的时间
 */
+ (NSString *)getCurrentDateStringByFormat:(NSString *)format;

/**
 *  格式化时间
 *
 *  @param date   时间
 *  @param format 格式
 *
 *  @return 格式化后的时间
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date Format:(NSString *)format;


/**
 string转date
 
 @param dateString 时间字符串
 @param format 格式
 @return date
 */
+ (NSDate *)dateWithDateString:(NSString *)dateString Format:(NSString *)format;

/**
 时间戳转格式化dateString

 @param timeInterval 时间戳
 @param format 格式
 @return 格式化后的时间
 */
+ (NSString *)dateStringWithTimeInterval:(NSString *)timeInterval format:(NSString *)format;

/**
 计算两个时间的差值
 
 @param date1 时间1
 @param date2 时间2
 @param type 类型 1秒 2分 3时 4天 5月 6年
 @return 时间差值
 */
+ (long)compareDate1:(NSDate *)date1 withDate2:(NSDate *)date2 type:(int)type;


/**
 判断星期几
 
 @param inputDate 时间
 @return 星期几
 */
- (NSString*)getWeekdayStringFromDate:(NSDate*)inputDate;
@end
