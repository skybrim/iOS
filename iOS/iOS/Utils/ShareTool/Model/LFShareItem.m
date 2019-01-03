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
        
    }
    return self;
}

- (instancetype)initWithPlatform:(LFSharePlatform)platform {
    
    self = [super init];
    if (self) {
        
        switch (platform) {
            case kPlatformWeixinSession:
            {
                
            }
                break;
            case kPlatformWeixinTimeline:
            {
                
            }
                break;
            case kPlatformQQFriends:
            {
                
            }
                break;
            case kPlatformQQZone:
            {
                
            }
                break;
            case kPlatformWeibo:
            {
                
            }
                break;
        }
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                    imageName:(NSString *)imageName
                       action:(void(^)(void))action {
    
    self = [super init];
    if (self) {
        
        self.title = title;
        self.imageName = imageName;
        self.shareItemAction = action;
    }
    return self;
}
@end
