//
//  AppDelegate+LF_BMKLocation.m
//  iOS
//
//  Created by mac on 2018/11/21.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "AppDelegate+LF_BMKLocation.h"

@implementation AppDelegate (LF_BMKLocation)

- (void)LF_startBaiduMap {
    
    NSString *appKey = @"dIOqlQUH3okbZYA8hABl2iICoORkBIHG";
    
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:appKey authDelegate:self];

    //初始化百度地图定位功能
    if (self.locationManager == nil) {
        
        //初始化实例
        self.locationManager = [[BMKLocationManager alloc] init];
        //设置delegate
        self.locationManager.delegate = self;
        //设置返回位置的坐标系类型
        self.locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        //设置距离过滤参数
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        //设置预期精度参数
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //设置应用位置类型
        self.locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        //设置是否自动停止位置更新
        self.locationManager.pausesLocationUpdatesAutomatically = NO;
        //设置是否允许后台定位
        //_locationManager.allowsBackgroundLocationUpdates = YES;
        //设置位置获取超时时间
        self.locationManager.locationTimeout = 10;
        //设置获取地址信息超时时间
        self.locationManager.reGeocodeTimeout = 10;
    }
    
    [self LF_getLocation];
}

- (void)LF_getLocation {
    
    //开始定位功能
    [self.locationManager requestLocationWithReGeocode:YES withNetworkState:YES completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
        }
        if (location) {//得到定位信息，添加annotation
            
            if (location.location) {
                NSLog(@"LOC = %@",location.location);
            }
            if (location.rgcData) {
                NSLog(@"rgc = %@",[location.rgcData description]);
            }
        }
        NSLog(@"netstate = %d",state);
    }];
}

/**
 *@brief 返回授权验证错误
 *@param iError 错误号 : 为0时验证通过，具体参加BMKLocationAuthErrorCode
 */
- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError {
    
    NSLog(@"baidu地图---返回授权验证错误--%ld",(long)iError);
}

@end
