//
//  Tools+Image.h
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools.h"

@interface Tools (Image)

/**
 *  改变image的alpha
 *
 *  @param alpha alpha
 *  @param image 原图
 *
 *  @return 改变alpha值的图片
 */
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;


/**
 *  根据颜色值获取image
 *
 *  @param color 指定颜色
 *
 *  @return image
 */
+ (UIImage *)imageFromColor:(UIColor *)color;


/**
 *  图片压缩方法
 *
 *  @param orignalImage 原图
 *  @param percent      缩放压缩质量
 *
 *  @return image
 */
+ (UIImage *)compressImageWithImage:(UIImage *)orignalImage ScalePercent:(CGFloat)percent;

/**
 *  压缩图片质量
 *
 *  @param image   原图
 *  @param percent 压缩质量
 *
 *  @return image
 */
+ (UIImage *)reduceImage:(UIImage *)image percent:(float)percent;

/**
 *  压缩图片尺寸
 *
 *  @param image   原图
 *  @param newSize new Size
 *
 *  @return image
 */
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

@end
