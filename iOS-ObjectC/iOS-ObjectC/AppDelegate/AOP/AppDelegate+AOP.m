//
//  AppDelegate+AOP.m
//  iOS-ObjectC
//
//  Created by mac on 2018/9/6.
//  Copyright © 2018年 Mr.T. All rights reserved.
//

#import "AppDelegate+AOP.h"
#import "Aspects.h"
#import "UIViewController+NaviBarButton.h"

@implementation AppDelegate (AOP)

- (void)aop_viewDidLoad {
    
    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo) {
        
        UIViewController * vc = aspectInfo.instance;
        
        if (vc == nil) {
            return ;
        }
        
//        //屏蔽一些系统界面
//        if ([aspectInfo.instance isKindOfClass:NSClassFromString(@"UIInputWindowController")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"UIWindow")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"UINavigationController")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"UITabBarController")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"UINavigationController")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"UICompatibilityInputViewController")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"_UIRemoteInputViewController")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"UIApplicationRotationFollowingControllerNoTouches")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"UIApplicationRotationFollowingController")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"UIAlertController")] ||
//            [aspectInfo.instance isKindOfClass:NSClassFromString(@"_UIAlertControllerTextFieldViewController")]) {
//
//            return;
//        }
        
        if (vc.navigationController.viewControllers.count> 1) {
            [vc addLeftBarButtonWithImage:[UIImage imageNamed:@"icon-fh"] action:@selector(popNavi)];
        }
        vc.view.backgroundColor = ColorFromHEX(0xf5f5f5, 1);
        vc.navigationController.navigationBar.translucent = NO;
        vc.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        
    } error:NULL];
}

@end
