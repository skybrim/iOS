//
//  Tools+String.h
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools.h"

@interface Tools (String)

/**
 *  根据文本及其宽度与字号计算高度
 *
 *  @param text  文本
 *  @param width 宽度
 *  @param font  字号
 *
 *  @return 文本高度
 */
+ (CGFloat)calculateHeightWithText:(NSString *)text
                             width:(CGFloat)width
                              font:(UIFont *)font;


/**
 *  根据文本及其宽度与字号和行高计算高度
 *
 *  @param text       文本
 *  @param width      宽度
 *  @param font       字号
 *  @param lineHeight 行高
 *
 *  @return 文本高度
 */
+ (CGFloat)calculateHeightWithText:(NSString *)text
                             width:(CGFloat)width
                              font:(UIFont *)font
                        lineHeight:(CGFloat)lineHeight;


/**
 获取属性字符串的高度
 
 @param attributedText 属性字符串
 @param textWidth 宽度
 @return 高度
 */
+ (CGFloat)getHeightForAttributedText:(NSAttributedString *)attributedText
                            textWidth:(CGFloat)textWidth;


/**
 获取属性字符串的宽度

 @param attributedText 属性字符串
 @param textHeight 高度
 @return 宽度
 */
+ (CGFloat)getWidthForAttributedText:(NSAttributedString *)attributedText
                          textHeight:(CGFloat)textHeight;

/**
 获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)

 @param aString 传入汉字字符串
 @return 大写拼音首字母
 */
+ (NSString *)firstCharactor:(NSString *)aString;

@end
