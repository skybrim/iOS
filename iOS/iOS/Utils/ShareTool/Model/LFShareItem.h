//
//  LFShareItem.h
//  iOS
//
//  Created by mac on 2019/1/3.
//  Copyright © 2019 Mr.T. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 默认分享样式

 - kPlatformWeixinSession: 微信会话
 - kPlatformWeixinTimeline: 微信朋友圈
 - kPlatformQQFriends: QQ好友
 - kPlatformQQZone: QQ空间
 - kPlatformWeibo: 微博
 */
typedef NS_ENUM(NSInteger,LFSharePlatform){
    kPlatformWeixinSession  = 1,
    kPlatformWeixinTimeline = 2,
    kPlatformQQFriends      = 3,
    kPlatformQQZone         = 4,
    kPlatformWeibo          = 5,
};

NS_ASSUME_NONNULL_BEGIN

@interface LFShareItem : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,copy) void(^shareItemAction)(void);

@property (nonatomic,copy) void(^actionWeixinSession)(void);
@property (nonatomic,copy) void(^actionWeixinTimeline)(void);
@property (nonatomic,copy) void(^actionQQFriends)(void);
@property (nonatomic,copy) void(^actionQQZone)(void);
@property (nonatomic,copy) void(^actionWeibo)(void);


/**
 默认初始化

 @return item
 */
- (instancetype)init;

/**
 根据默认样式初始化

 @param platform 分享平台
 @return item
 */
- (instancetype)initWithPlatform:(LFSharePlatform)platform;

/**
 自定义item

 @param title 标题
 @param imageName 图片名称
 @param action 点击方法
 @return item
 */
- (instancetype)initWithTitle:(NSString *)title
                    imageName:(NSString *)imageName
                       action:(void(^)(void))action;
    
@end

NS_ASSUME_NONNULL_END
