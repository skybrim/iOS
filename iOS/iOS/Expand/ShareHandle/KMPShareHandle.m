//
//  KMPShareHandle.m
//  KMPharmacy
//
//  Created by mac on 2018/8/24.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "KMPShareHandle.h"
#import "OpenShareHeader.h"

@implementation KMPShareHandle
singletonImplemention(KMPShareHandle)

- (void)showWithVC:(UIViewController *)VC {

    [self.shareView showFromControlle:VC];
}
#pragma mark - private
- (void)shareToWeixinTimeLine {

    OSMessage *msg=[[OSMessage alloc]init];
    msg.title = self.shareTitle;
    msg.desc = self.shareContent;
    msg.image = self.shareImage;
    msg.link = self.shareUrl;
    msg.multimediaType = OSMultimediaTypeNews;
    [OpenShare shareToWeixinTimeline:msg Success:^(OSMessage *message) {
        
        if (self.successBlock) {
            self.successBlock();
        }
    } Fail:^(OSMessage *message, NSError *error) {
        
        if (self.failureBlock) {
            self.failureBlock(error);
        }
    }];
}

- (void)shareToWeixinSession {
    
    OSMessage *msg=[[OSMessage alloc]init];
    msg.title = self.shareTitle;
    msg.desc = self.shareContent;
    msg.image = self.shareImage;
    msg.link = self.shareUrl;
    msg.multimediaType = OSMultimediaTypeNews;
    [OpenShare shareToWeixinSession:msg Success:^(OSMessage *message) {
        
        if (self.successBlock) {
            self.successBlock();
        }
    } Fail:^(OSMessage *message, NSError *error) {
        
        if (self.failureBlock) {
            self.failureBlock(error);
        }
    }];
}

- (void)shareToQQSession {
    
    OSMessage *msg=[[OSMessage alloc]init];
    msg.title = self.shareTitle;
    msg.desc = self.shareContent;
    msg.image = self.shareImage;
    msg.link = self.shareUrl;
    msg.multimediaType = OSMultimediaTypeNews;
    [OpenShare shareToQQFriends:msg Success:^(OSMessage *message) {
        
        if (self.successBlock) {
            self.successBlock();
        }
    } Fail:^(OSMessage *message, NSError *error) {
        
        if (self.failureBlock) {
            self.failureBlock(error);
        }
    }];
}

- (void)shareToQQTimeLine {
    
    OSMessage *msg=[[OSMessage alloc]init];
    msg.title = self.shareTitle;
    msg.desc = self.shareContent;
    msg.image = self.shareImage;
    msg.link = self.shareUrl;
    msg.multimediaType = OSMultimediaTypeNews;
    [OpenShare shareToQQZone:msg Success:^(OSMessage *message) {
        
        if (self.successBlock) {
            self.successBlock();
        }
    } Fail:^(OSMessage *message, NSError *error) {
        
        if (self.failureBlock) {
            self.failureBlock(error);
        }
    }];
}

- (void)shareToWeibo {
    
    OSMessage *msg=[[OSMessage alloc]init];
    msg.title = [NSString stringWithFormat:@"【药葫芦】%@",self.shareTitle];
    msg.desc = self.shareContent;
    msg.image = self.shareImage;
    msg.link = self.shareUrl;
    msg.multimediaType = OSMultimediaTypeNews;
    [OpenShare shareToWeibo:msg Success:^(OSMessage *message) {
        
        if (self.successBlock) {
            self.successBlock();
        }
    } Fail:^(OSMessage *message, NSError *error) {
        
        if (self.failureBlock) {
            self.failureBlock(error);
        }
    }];
}

#pragma mark - getter

- (IFMShareView *)shareView {
    
    if (!_shareView) {
        _shareView = [[IFMShareView alloc] initWithItems:@[self.weixinTimelineItem,self.weixinSessionItem,self.QQSessionItem,self.QQTimelineItem,self.weiboItem] countEveryRow:3];
        _shareView.containViewColor = [UIColor whiteColor];
        _shareView.showBorderLine = NO;
        _shareView.footerView = self.shareFooterView;
        
        WEAK_SELF(self);
//        [_shareView setCancelBlock:^{
//            STRONG_SELF(self);
//            self.shareView = nil;
//        }];
    }
    return _shareView;
}

- (UIView *)shareFooterView {
    
    if (!_shareFooterView) {
        
        _shareFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44+kBottomSafeHeight)];
        _shareFooterView.backgroundColor = [UIColor whiteColor];
//        [_shareFooterView setTopBorderWithColor:BASE_LINE_COLOR width:SCREEN_WIDTH height:0.5];

        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        contentLabel.text = @"取消分享";
//        contentLabel.font = [UIFont fontWithName:AppFontHelvetica size:17];
//        contentLabel.textColor = STRING_DARK_COLOR;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        [_shareFooterView addSubview:contentLabel];
        
        WEAK_SELF(self);
        [_shareFooterView bk_whenTapped:^{
            STRONG_SELF(self);
            [self.shareView dismiss:YES];
            self.shareView = nil;
        }];
    }
    return _shareFooterView;
}

- (IFMShareItem *)weixinTimelineItem {
    
    if (!_weixinTimelineItem) {
        WEAK_SELF(self);
        _weixinTimelineItem = [[IFMShareItem alloc]
                               initWithImage:[UIImage imageNamed:@"xh_icon_moments"]
                               title:@"朋友圈"
                               action:^(IFMShareItem * _Nonnull item) {
                                   STRONG_SELF(self);
                                   [self shareToWeixinTimeLine];
                               }];
    }
    return _weixinTimelineItem;
}

- (IFMShareItem *)weixinSessionItem {
    
    if (!_weixinSessionItem) {
        WEAK_SELF(self);
        _weixinSessionItem = [[IFMShareItem alloc]
                              initWithImage:[UIImage imageNamed:@"xh_icon_wechat"]
                              title:@"微信好友"
                              action:^(IFMShareItem * _Nonnull item) {
                                  STRONG_SELF(self);
                                  [self shareToWeixinSession];
                              }];
    }
    return _weixinSessionItem;
}

- (IFMShareItem *)QQSessionItem {
    
    if (!_QQSessionItem) {
        WEAK_SELF(self);
        _QQSessionItem = [[IFMShareItem alloc]
                          initWithImage:[UIImage imageNamed:@"xh_icon_QQ"]
                          title:@"QQ好友"
                          action:^(IFMShareItem * _Nonnull item) {
                              STRONG_SELF(self);
                              [self shareToQQSession];
                          }];
    }
    return _QQSessionItem;
}



- (IFMShareItem *)QQTimelineItem {
    
    if (!_QQTimelineItem) {
        WEAK_SELF(self);
        _QQTimelineItem = [[IFMShareItem alloc]
                           initWithImage:[UIImage imageNamed:@"xh_icon_Qzone"]
                           title:@"QQ空间"
                           action:^(IFMShareItem * _Nonnull item) {
                               STRONG_SELF(self);
                               [self shareToQQTimeLine];
                           }];
    }
    return _QQTimelineItem;
}

- (IFMShareItem *)weiboItem {
    
    if (!_weiboItem) {
        WEAK_SELF(self);
        _weiboItem = [[IFMShareItem alloc]
                      initWithImage:[UIImage imageNamed:@"xh_icon_weibo"]
                      title:@"微博"
                      action:^(IFMShareItem * _Nonnull item) {
                          STRONG_SELF(self);
                          [self shareToWeibo];
                      }];
    }
    return _weiboItem;
}
@end
