//
//  AppDelegate+AMAP.m
//  iOS-ObjectC
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019 skybrim. All rights reserved.
//

#import "AppDelegate+AMAP.h"

@implementation AppDelegate (AMAP)

- (void)LF_AMAPInitialization {
    
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    [AMapServices sharedServices].apiKey = @"ac0636ad86cb9c682b03d7f7dc10b88b";
    
    
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    
//    self.locationManager.distanceFilter ＝ 200;
    
    //高德提供了 kCLLocationAccuracyBest 参数，设置该参数可以获取到精度在10m左右的定位结果，但是相应的需要付出比较长的时间（10s左右），越高的精度需要持续定位时间越长。
    //kCLLocationAccuracyHundredMeters，一次还不错的定位，偏差在百米左右，超时时间设置在2s-3s左右即可。
    //带逆地理信息的一次定位（返回坐标和地址信息）
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    //定位超时时间，最低2s，此处设置为2s
    self.locationManager.locationTimeout =2;
    //逆地理请求超时时间，最低2s，此处设置为2s
    self.locationManager.reGeocodeTimeout = 2;

}

- (void)LF_stopUpdatingLocation {
    
    [self.locationManager stopUpdatingLocation];
}

//单次定位
- (void)LF_getCurrentLocationWithSuccess:(void(^)(CLLocation *location, AMapLocationReGeocode *regeocode))success
                                 failure:(void(^)(NSError *error))failure {
    
    // 带逆地理（返回坐标和地址信息）。将下面代码中的 YES 改成 NO ，则不会返回地址信息。
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error) {
            
            if (failure) {
                failure(error);
            }
            
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            if (error.code == AMapLocationErrorLocateFailed) {
                return;
            }
        }
        
        if (success) {
            success(location,regeocode);
        }
        
        NSLog(@"location:%@", location);
        if (regeocode) {
            NSLog(@"reGeocode:%@", regeocode);
        }
        
  
    }];
}

//持续定位
//iOS定位SDK提供后台持续定位的能力，可持久记录位置信息，适用于记轨迹录。
- (void)lf_startUpdatingLocation {
    //修改info.plist
    //TARGETS->Capabilities->Background Modes,勾选 Location updates（后台定位需要打开）

    //iOS 9（不包含iOS 9） 之前设置允许后台定位参数，保持不会被系统挂起
//    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    //iOS 9（包含iOS 9）之后新特性：将允许出现这种场景，同一app中多个locationmanager：一些只能在前台定位，另一些可在后台定位，并可随时禁止其后台定位。
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
        self.locationManager.allowsBackgroundLocationUpdates = YES;
    }
    
    //如果需要持续定位返回逆地理编码信息
//    [self.locationManager setLocatingWithReGeocode:YES];
    
    //开始持续定位
    [self.locationManager startUpdatingLocation];
    
}

#pragma mark - AMapLocationManagerDelegate
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode {
    
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
    if (reGeocode)
    {
        NSLog(@"reGeocode:%@", reGeocode);
    }
}

@end
