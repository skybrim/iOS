//
//  Assistant.m
//  XMPP
//
//  Created by KM on 16/3/292016.
//  Copyright © 2016年 skybrim. All rights reserved.
//

#import "Tools.h"

#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>
#import <MapKit/MapKit.h>

@implementation Tools

#pragma mark - 获取URL中的参数
+ (NSDictionary *)getParametersWithUrlString:(NSString *)urlString {

    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];

    //获取问号的位置，问号后是参数列表
    NSRange range = [urlString rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return tempDic;
    }
    //获取参数列表
    NSString *propertys = [urlString substringFromIndex:(int)(range.location+1)];
    //进行字符串的拆分，通过&来拆分，把每个参数分开
    NSArray *subArray = [propertys componentsSeparatedByString:@"&"];
    //把subArray转换为字典
    //tempDic中存放一个URL中转换的键值对
    if (subArray.count > 0) {

        for (int j = 0 ; j < subArray.count; j++) {

            //在通过=拆分键和值
            NSArray *dicArray = [subArray[j] componentsSeparatedByString:@"="];
            //给字典加入元素
            [tempDic setObject:dicArray[1] forKey:dicArray[0]];
        }
    }
    NSLog(@"打印URL的参数列表生成的字典：\n%@", tempDic);
    return tempDic;
}



#pragma mark - 倒计时
+ (void)countdownWithTime:(int)time
                      End:(void(^)(void))end
                    going:(void(^)(NSString * time))going {

    __block int timeout = time; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^
    {
        if(timeout<=0) {

            //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^
            {
                //设置界面的按钮显示 根据自己需求设置
                if (end) {
                    end();
                }

            });
        }
        else {

            int seconds = timeout % (time + 1);
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^
            {
                //设置界面的按钮显示 根据自己需求设置
                going(strTime);
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

+ (void)countdownWithDoctorTime:(int)time
                      End:(void(^)(void))end
                    going:(void(^)(NSString * time))going
                    timer:(void(^)(dispatch_source_t timer))timer{
    
    __block int timeout = time; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       //设置界面的按钮显示 根据自己需求设置
                       if (timer) {
                           timer(_timer);
                       }
                       
                   });
    dispatch_source_set_event_handler(_timer, ^
                                      {
                                          
                                          if(timeout<=0) {
                                              
                                              //倒计时结束，关闭
                                              dispatch_source_cancel(_timer);
                                              dispatch_async(dispatch_get_main_queue(), ^
                                                             {
                                                                 //设置界面的按钮显示 根据自己需求设置
                                                                 if (end) {
                                                                     end();
                                                                 }
                                                                 
                                                             });
                                          }
                                          else {
                                              
                                              int seconds = timeout % (time + 1);
                                              NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
                                              dispatch_async(dispatch_get_main_queue(), ^
                                                             {
                                                                 //设置界面的按钮显示 根据自己需求设置
                                                                 going(strTime);
                                                               
                                                             });
                                              timeout--;
                                          }
                                      });
    dispatch_resume(_timer);
}

#pragma mark - 替换手机中间4位
+ (NSString *)replacePhoneMiddleWithPhoneNumber:(NSString *)number {
    
    NSMutableString * phoneNumber = [NSMutableString stringWithString:number];
    NSRange range;
    range.location = 3;
    range.length = 4;
    [phoneNumber replaceCharactersInRange:range withString:@"****"];
    return phoneNumber;
}

#pragma mark - 将对象转化为jsonDic
+ (NSDictionary *)convertFromObjectWith:(id)object{

    NSMutableDictionary * jsonDic = [[NSMutableDictionary alloc] init];
    NSMutableArray * props = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
    for (i = 0; i<outCount; i++) {

        const char* char_f =property_getName(properties[i]);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        [props addObject:propertyName];
    }
    free(properties);

    for (NSString *key in props) {

        [jsonDic setValue:[object valueForKey:key] forKey:key];//从类里面取值然后赋给每个值，取得字典
    }
    return jsonDic;
}

#pragma mark - 去除URL中的特殊符号
+ (NSString *)URLEncodedString:(NSString *)string {
    
    NSString *encodedString = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    return encodedString;
}

#pragma mark - 去HTML标签
+ (NSString *)filterHTML:(NSString *)html {
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO) {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }

    
    return html;
}


#pragma mark - md5加密
+ (NSString *)md5String:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


#pragma mark - 判断字符串是不是NSNull类
+ (BOOL)isNSNullCharacter:(NSString *)string
{
    BOOL isResult = NO;
    
    if ([string isKindOfClass:[NSNull class]]) {
        isResult = YES;
    }
    else if ([string isKindOfClass:[NSString class]]) {
        if ([string isEqualToString:@"(null)"]) {
            isResult = YES;
        }
    }
    
    return isResult;
}

#pragma mark - 跳转到系统设置界面
+ (void)showSettingWithTitle:(NSString *)title
                     message:(NSString *)message
                     failure:(void (^)(void))failure {
    //提示开启定
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (failure) {
            failure();
        }

    }];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    UIWindow *mainWindow = MAIN_WINDOW;
    UIViewController *vc = mainWindow.rootViewController;
    [vc presentViewController:alert animated:YES completion:nil];
}

+ (NSString *)dataTojsonString:(id)object {
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    }
    else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (UIImage *)findFace:(UIImage *)sourceImage
{
    UIImage * image = sourceImage;
    CIImage * coreImage = [[CIImage alloc] initWithImage:image];
    CIContext * context = [CIContext contextWithOptions:nil];
    CIDetector * detector = [CIDetector detectorOfType:@"CIDetectorTypeFace"context:context options:[NSDictionary dictionaryWithObjectsAndKeys:@"CIDetectorAccuracyHigh", @"CIDetectorAccuracy", nil]];
    NSArray * features = [detector featuresInImage:coreImage];


    for(CIFaceFeature* faceFeature in features)
    {
        CGRect origRect = faceFeature.bounds;
        CGRect biggerRect = CGRectInset(origRect
                                        ,origRect.size.width*-0.5
                                        ,origRect.size.height*-0.5);

        CGRect flipRect = biggerRect;
        flipRect.origin.y = image.size.height - (biggerRect.origin.y + biggerRect.size.height);
        flipRect.origin.y = flipRect.origin.y - 4;

        CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], flipRect);
        UIImage* faceImage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);

        sourceImage = faceImage;
        break;
    }

    return sourceImage;
}


+ (UIStoryboard *) getStoryboardInstance
{
    NSString *storyboardName = [self getStoryboardName];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return storyboard;
}

+ (NSString *) getStoryboardName
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        return @"Main";
    }
    else
    {
        return @"Main";
    }
}

+ (UIColor *)getRandomColor
{
    return  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

+ (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//根据自己的需求定义格式
    NSDate* startDate = [formater dateFromString:starTime];
    NSDate* endDate = [formater dateFromString:endTime];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}

+ (NSDate *)stringToNSdate:(NSString *)string {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+ (NSString *)dateToString:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
    
}

+(NSString *)timestampSwitchTime:(long long)timestamp andFormatter:(NSString *)format{
    
    
    
    //    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //
    //    [formatter setDateStyle:NSDateFormatterMediumStyle];
    //
    //    [formatter setTimeStyle:NSDateFormatterShortStyle];
    //
    //    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //
    //    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    //
    //    [formatter setTimeZone:timeZone];
    //
    //    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    //
    //   // NSLog(@"1296035591  = %@",confromTimesp);
    //
    //
    //
    //    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    //  NSString *timeStampString  = @"1495453213000";
    
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    = timestamp / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    
    
    
    //NSLog(@"&&&&&&&confromTimespStr = : %@",confromTimespStr);
    
    
    
    return dateString;
    
}

+ (double)distanceBetweenOrderBylat1:(double)lat1 lat2:(double)lat2 lon1:(double)lon1 lon2:(double)lon2 {
    
    CLLocation *curLocation = [[CLLocation alloc] initWithLatitude:lat1 longitude:lon1];
    
    CLLocation *otherLocation = [[CLLocation alloc] initWithLatitude:lat2 longitude:lon2];
    
    double  distance  = [curLocation distanceFromLocation:otherLocation];
    
    return  distance;
}

@end



