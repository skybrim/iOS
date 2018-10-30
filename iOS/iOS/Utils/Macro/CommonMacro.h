//
//  CommonMacro.h
//  XMPP
//
//  Created by KM on 16/3/28.
//  Copyright © 2016年 skybrim. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

//mainWindow
#define LF_MAIN_WINDOW [UIApplication sharedApplication].keyWindow

//宽高
#define LF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LF_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//字体
//#define stringFont(s) [UIFont fontWithName:@"Hiragino Kaku Gothic ProN W3" size:s]
#define stringFont(s) [UIFont systemFontOfSize:s]

//颜色
#define LF_ColorFromHEX(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]
#define LF_ColorFromRGB(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
#define LF_RandomColor RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

//判断IOS版本
#define iPhoneSystemVersion ([UIDevice currentDevice].systemVersion.floatValue)

//定义设备的类型
#define iPad   (([[NSUserDefaults standardUserDefaults] integerForKey:@"ImageResolutionHeight"]) == 1024?YES:NO)

#define iPhone4   (([[NSUserDefaults standardUserDefaults] integerForKey:@"ImageResolutionHeight"]) == 960?YES:NO)
#define iPhone5   (([[NSUserDefaults standardUserDefaults] integerForKey:@"ImageResolutionHeight"]) == 1136?YES:NO)
#define iPhone6   (([[NSUserDefaults standardUserDefaults] integerForKey:@"ImageResolutionHeight"]) == 1334?YES:NO)
#define iPhone6p  (([[NSUserDefaults standardUserDefaults] integerForKey:@"ImageResolutionHeight"]) == 2208?YES:NO)
#define iPhoneX   (([[NSUserDefaults standardUserDefaults] integerForKey:@"ImageResolutionHeight"]) == 2436?YES:NO)

/*状态栏高度*/
#define kStatusBarHeight (CGFloat)(iPhoneX?(44.0):(20.0))
/*导航栏高度*/
#define kNavBarHeight (44)
/*状态栏和导航栏总高度*/
#define kStatusAndNavHeight (CGFloat)(iPhoneX?(88.0):(64.0))
/*TabBar高度*/
#define kTabBarHeight (CGFloat)(iPhoneX?(49.0 + 34.0):(49.0))
/*顶部安全区域远离高度*/
#define kTopBarSafeHeight (CGFloat)(iPhoneX?(44.0):(0))
/*底部安全区域远离高度*/
#define kBottomSafeHeight (CGFloat)(iPhoneX?(34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define kTopBarDifHeight (CGFloat)(iPhoneX?(24.0):(0))
/*导航条和Tabbar总高度*/
#define kNavAndTabHeight (kNavBarAndStatusBarHeight + kTabBarHeight)


//设备系统
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
#define IOS_VERSION_9_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)? (YES):(NO))
#define IOS_VERSION_10_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)? (YES):(NO))
#define IOS_VERSION_11_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)? (YES):(NO))

#define IS_IOS10 ([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 10)
#define IS_IOS9 ([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 9)
#define IS_IOS8 ([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 8)
#define IS_IOS7 ([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 7)
#define IS_IOS6 ([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] == 6)

////适配adjustsScrollViewInsets属性
//#define  adjustsScrollViewInsets(scrollView)\
//do {\
//_Pragma("clang diagnostic push")\
//_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
//if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
//NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
//NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
//NSInteger argument = 2;\
//invocation.target = scrollView;\
//invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
//[invocation setArgument:&argument atIndex:2];\
//[invocation retainArguments];\
//[invocation invoke];\
//}\
//_Pragma("clang diagnostic pop")\
//} while (0)


#endif /* CommonMacro_h */
