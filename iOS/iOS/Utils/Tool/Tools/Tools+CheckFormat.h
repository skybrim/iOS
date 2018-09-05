//
//  Tools+CheckFormat.h
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools.h"

@interface Tools (CheckFormat)

/**
 *  正则验证手机号码
 *
 *  @param phoneNumber 手机号码
 *
 *  @return 手机号真假
 */
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber;

/**
 *  身份证验证
 *
 *  @param cardNo 身份证号
 *
 *  @return 身份证格式正确与否
 */
+(BOOL)checkIdentityCardNo:(NSString*)cardNo;

+ (BOOL)isEmail:(NSString *)email;
+ (BOOL)isPassword:(NSString *)password;

+ (BOOL)isUserName:(NSString *)userName;
+ (BOOL)isChineseUserName:(NSString *)chineseUserName;
+ (BOOL)isQQ:(NSString *)QQ;
+ (BOOL)isUrlAddress:(NSString *)urlAddress;

@end
