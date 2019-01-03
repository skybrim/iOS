//
//  LFShareItem.m
//  iOS
//
//  Created by mac on 2019/1/3.
//  Copyright © 2019 Mr.T. All rights reserved.
//

#import "LFShareItem.h"

@implementation LFShareItem

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.actionWeixinSession = ^{
            NSLog(@"分享到微信会话");
        };
        
        self.actionWeixinTimeline = ^{
            NSLog(@"分享到微信朋友圈");
        };
        
        self.actionQQFriends = ^{
            NSLog(@"分享到QQa好友");
        };
        
        self.actionQQZone = ^{
            NSLog(@"分享到QQ空间");
        };
        
        self.actionWeibo = ^{
            NSLog(@"分享到微博");
        };
    }
    return self;
}


- (instancetype)initWithPlatform:(LFSharePlatform)platform {
    
    self = [self init];
    if (self) {
        
        switch (platform) {
            case kPlatformWeixinSession:
            {
                self.title = @"微信";
                self.imageName = [@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"WeChat"];
                self.shareItemAction = self.actionWeixinSession;
            }
                break;
            case kPlatformWeixinTimeline:
            {
                self.title = @"朋友圈";
                self.imageName = [@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"WeChat_moments"];
                self.shareItemAction = self.actionWeixinTimeline;
            }
                break;
            case kPlatformQQFriends:
            {
                self.title = @"QQ";
                self.imageName = [@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"QQ"];
                self.shareItemAction = self.actionQQFriends;
            }
                break;
            case kPlatformQQZone:
            {
                self.title = @"QQ空间";
                self.imageName = [@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"Qzone"];
                self.shareItemAction = self.actionQQZone;
            }
                break;
            case kPlatformWeibo:
            {
                self.title = @"微博";
                self.imageName = [@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"Weibo"];
                self.shareItemAction = self.actionWeibo;
            }
                break;
        }
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                    imageName:(NSString *)imageName
                       action:(void(^)(void))action {
    
    self = [self init];
    if (self) {
        
        self.title = title;
        self.imageName = imageName;
        self.shareItemAction = action;
    }
    return self;
}
@end
