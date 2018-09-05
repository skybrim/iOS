//
//  Tools+UpdateVersion.h
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools.h"

@interface Tools (UpdateVersion)

/**
 *  获取本地版本号
 *
 *  @return 本地版本号
 */
+ (NSString *)getLocalVersion;

/**
 *  根据appstore中版本号与本地版本号对比判断是否需要更新
 */
+ (void)updateVersion:(NSString *)appstoreID;

@end
