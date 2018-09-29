//
//  Felix.h
//  KMPharmacy
//
//  Created by mac on 2018/6/21.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Aspects.h"
#import <objc/runtime.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface Felix : NSObject

+ (void)fixIt;
+ (void)evalString:(NSString *)javascriptString;

@end
