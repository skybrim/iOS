//
//  UIView+singleCorner.h
//  KMPharmacy
//
//  Created by mac on 2018/7/28.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (singleCorner)


/**
 设置一个单独的圆角

 @param cornerRadius cornerRadius
 @param borderWidth borderWidth
 @param borderColor borderColor
 @param corners corners
 */
- (void)setBorderWithCornerRadius:(CGFloat)cornerRadius
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
                             type:(UIRectCorner)corners;

@end
