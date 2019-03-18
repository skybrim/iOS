//
//  AppDelegate+AMAPExtension.h
//  iOS-ObjectC
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019 skybrim. All rights reserved.
//

#import "AppDelegate.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate ()

/**
 AMapLocationManager类
 */
@property (nonatomic,strong) AMapLocationManager *locationManager;

/**
 *  后台定位是否返回逆地理信息，默认NO。
 */
@property (nonatomic, assign) BOOL locatingWithReGeocode;

@end

NS_ASSUME_NONNULL_END
