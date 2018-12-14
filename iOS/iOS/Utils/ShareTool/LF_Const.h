//
//  LF_Const.h
//  iOS
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/message.h>

//屏幕宽高
#define LF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LF_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//颜色
#define LF_ColorFromHEX(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]
#define LF_ColorFromRGB(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

//强引用和弱引用
#ifndef weakifyObject
#if __has_feature(objc_arc)
#define weakifyObject(object) LF_ext_keywordify __weak __typeof__(object) weak##_##object = object;
#else
#define weakifyObject(object) LF_ext_keywordify __block __typeof__(object) block##_##object = object;
#endif
#endif

#ifndef strongifyObject
#if __has_feature(objc_arc)
#define strongifyObject(object) LF_ext_keywordify __strong __typeof__(object) object = weak##_##object;
#else
#define strongifyObject(object)                                                                    \
LF_ext_keywordify __strong __typeof__(object) object = block##_##object;
#endif
#endif

#undef LF_WEAK_SELF
#define LF_WEAK_SELF(...) @weakifyObject(__VA_ARGS__)

#undef LF_STRONG_SELF
#define LF_STRONG_SELF(...) @strongifyObject(__VA_ARGS__)

#ifdef RELEASE
#define LF_ext_keywordify try {} @catch (...) {}
#else
#define LF_ext_keywordify autoreleasepool {}
#endif
