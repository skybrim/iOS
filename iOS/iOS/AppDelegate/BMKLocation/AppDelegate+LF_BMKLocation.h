//
//  AppDelegate+LF_BMKLocation.h
//  iOS
//
//  Created by mac on 2018/11/21.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+LF_BMKLocationExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (LF_BMKLocation)

- (void)LF_startBaiduMap;

- (void)LF_getLocation;


@end

NS_ASSUME_NONNULL_END
