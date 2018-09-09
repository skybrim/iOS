//
//  KMPShareHandle.h
//  KMPharmacy
//
//  Created by mac on 2018/8/24.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFMShareView.h"

@interface KMPShareHandle : NSObject
singletonInterface(KMPShareHandle)

/*
 使用示例
 [KMPShareHandle sharedKMPShareHandle].shareTitle = @"shareTitle";
 //内容在30字以内
 [KMPShareHandle sharedKMPShareHandle].shareContent = @"shareContent";
 [KMPShareHandle sharedKMPShareHandle].shareImage = [UIImage imageNamed:@"placeholder"];
 [KMPShareHandle sharedKMPShareHandle].shareUrl = @"https://www.baidu.com";
 [[KMPShareHandle sharedKMPShareHandle] showWithVC:self];
 
 [[KMPShareHandle sharedKMPShareHandle] setSuccessBlock:^{
 
 NSLog(@"share-success");
 }];
 
 [[KMPShareHandle sharedKMPShareHandle] setFailureBlock:^(NSError *error) {
 
 NSLog(@"%@",error);
 }];
 */

@property (nonatomic,strong) IFMShareView *shareView;
@property (nonatomic,strong) UIView *shareFooterView;

@property (nonatomic,strong) IFMShareItem *weixinTimelineItem;
@property (nonatomic,strong) IFMShareItem *weixinSessionItem;
@property (nonatomic,strong) IFMShareItem *QQSessionItem;
@property (nonatomic,strong) IFMShareItem *QQTimelineItem;
@property (nonatomic,strong) IFMShareItem *weiboItem;


@property (nonatomic,strong) NSString *shareTitle;

/**
 限制字数，30字以内
 */
@property (nonatomic,strong) NSString *shareContent;
@property (nonatomic,strong) NSString *shareUrl;
@property (nonatomic,strong) UIImage *shareImage;


@property (nonatomic,copy) void(^successBlock)(void);
@property (nonatomic,copy) void(^failureBlock)(NSError *error);

/**
 展示分享页面

 @param VC 分享页面所在VC
 */
- (void)showWithVC:(UIViewController *)VC;

@end
