//
//  LF_ShareHandle.h
//  iOS
//
//  Created by mac on 2018/10/19.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFShareFatherView.h"

@interface LFShareTool : NSObject

singletonInterface(LFShareTool);

@property (nonatomic,strong) LFShareFatherView *shareFatherView;

/**
 显示分享界面
 */
- (void)showShareView;


/**
 隐藏分享界面
 */
- (void)hideShareView;


/**
 设置分享头部

 @param shareHeadView 自定义分享视图头部，可为空
 */
- (void)setShareHeadView:(UIView *)shareHeadView;


/**
 设置分享底部

 @param shareFootView 自定义分享视图底部,可为空
 */
- (void)setShareFootView:(UIView *)shareFootView;


/**
 设置分享内容区域

 @param shareContentView 自定义分享视图内容区域，可为空
 */
- (void)setShareContentView:(UIView *)shareContentView;


/**
 设置分享头部高度

 @param headHeight 自定义分享头部高度
 */
- (void)setShareHeadHeight:(CGFloat)headHeight;

/**
 设置分享底部高度
 
 @param headHeight 自定义分享底部高度
 */
- (void)setShareFootHeight:(CGFloat)footHeight;

/**
 设置分享内容高度
 
 @param headHeight 自定义分享内容高度
 */
- (void)setShareContentHeight:(CGFloat)contentHeight;
@end
