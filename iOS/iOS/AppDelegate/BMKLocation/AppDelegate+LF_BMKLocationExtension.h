//
//  AppDelegate+LF_BMKLocationExtension.h
//  iOS
//
//  Created by mac on 2018/11/21.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "AppDelegate.h"
#import <BMKLocationKit/BMKLocationComponent.h>//引入定位所有的头文件

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate ()<BMKLocationManagerDelegate,BMKLocationAuthDelegate>

@property (nonatomic,strong) BMKLocationManager *locationManager;
//@property (nonatomic,strong) BMKReverseGeoCodeSearchResult *result;

@property (nonatomic,assign) CLLocationCoordinate2D baiduCurrentLocation;//通过百度地图定位获取的经纬度

@end

NS_ASSUME_NONNULL_END
