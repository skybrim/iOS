//
//  AppDelegate+AMAP.h
//  iOS-ObjectC
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019 skybrim. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+AMAPExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (AMAP)<AMapLocationManagerDelegate>


/**
 初始化高德地图
 */
- (void)LF_AMAPInitialization;

/**
 停止定位
 */
- (void)LF_stopUpdatingLocation;

/**
 单次定位

 @param success 定位成功
 @param failure 定位失败
 */
- (void)LF_getCurrentLocationWithSuccess:(void(^)(CLLocation *location, AMapLocationReGeocode *regeocode))success
                                 failure:(void(^)(NSError *error))failure;

/**
 持续定位
 */
- (void)lf_startUpdatingLocation;


@end

NS_ASSUME_NONNULL_END
