//
//  Tools+String.m
//  KMPharmacy
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "Tools+String.h"

@implementation Tools (String)

#pragma mark - 根据文本计算文本高度
+ (CGFloat)calculateHeightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font {
    
    CGFloat height = 0.0;
    
    CGRect  rect = [text boundingRectWithSize:CGSizeMake(width, 0)
                                      options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName:font}
                                      context:nil];
    height = ceil(rect.size.height);
    return height;
}

#pragma mark - 根据文本计算文本高度
+ (CGFloat)calculateHeightWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font lineHeight:(CGFloat)lineHeight
{
    CGFloat height = 0;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.maximumLineHeight = lineHeight;
    style.minimumLineHeight = lineHeight;
    
    CGRect  rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style}
                                      context:nil];
    height = ceil(rect.size.height);
    return height;
}

+ (CGFloat)getHeightForAttributedText:(NSAttributedString *)attributedText
                            textWidth:(CGFloat)textWidth
{
    CGSize constraint = CGSizeMake(textWidth , CGFLOAT_MAX);
    CGSize title_size;
    CGFloat totalHeight;
    title_size = [attributedText boundingRectWithSize:constraint
                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                              context:nil].size;
    
    totalHeight = ceil(title_size.height);
    
    return totalHeight;
}

+ (CGFloat)getWidthForAttributedText:(NSAttributedString *)attributedText
                          textHeight:(CGFloat)textHeight
{
    CGSize constraint = CGSizeMake(CGFLOAT_MAX , textHeight);
    CGSize title_size;
    CGFloat width;
    title_size = [attributedText boundingRectWithSize:constraint
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                              context:nil].size;
    
    width = ceil(title_size.width);
    return width;
}

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

@end
