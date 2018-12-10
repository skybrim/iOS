//
//  LF_ShareView.h
//  iOS
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LF_ShareHeadView.h"
#import "LF_ShareFootView.h"
#import "LF_ShareContentView.h"

#define LF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LF_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface LF_ShareFatherView : UIView

@property (nonatomic,strong) UIView *shareHeadView;
@property (nonatomic,strong) UIView *shareFootView;
@property (nonatomic,strong) UIView *shareContentView;
@property (nonatomic,strong) UIButton *cancelBtn;

@property (nonatomic,assign) CGFloat headHeight;
@property (nonatomic,assign) CGFloat footHeight;
@property (nonatomic,assign) CGFloat contentHeight;

@property (nonatomic,strong) UIView *topSeparatorLine;
@property (nonatomic,strong) UIView *bottomSeparatorLine;

- (void)layoutPages;

@end

NS_ASSUME_NONNULL_END
