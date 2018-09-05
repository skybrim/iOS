//
//  Tools+CheckFormat.m
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools+CheckFormat.h"

@implementation Tools (CheckFormat)

+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber {
    
    //正则表达式验证手机
    NSString *pattern = @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    return isMatch;
}

+(BOOL)checkIdentityCardNo:(NSString*)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

+ (BOOL)isEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isPassword:(NSString *)password
{
    NSString *      regex = @"(^[A-Za-z0-9]{6,12}$)";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:password];
}


+ (BOOL)isUserName:(NSString *)userName
{
    NSString *      regex = @"(^[A-Za-z0-9]{3,20}$)";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:userName];
}

+ (BOOL)isChineseUserName:(NSString *)chineseUserName
{
    NSString *      regex = @"(^[A-Za-z0-9\u4e00-\u9fa5]{3,20}$)";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:chineseUserName];
}


+ (BOOL)isQQ:(NSString *)QQ
{
    NSString *regex = @"^[1-9]\\d{4,10}$";
    NSPredicate *emailTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [emailTest evaluateWithObject:QQ];
}

+ (BOOL)isUrlAddress:(NSString *)urlAddress
{
    NSString *regex = @"[a-zA-z]+://[^\\s]*";
    NSPredicate *emailTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [emailTest evaluateWithObject:urlAddress];
    
}



@end
