//
//  LF_ShareView.h
//  iOS-ObjectC
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LFShareHeadView.h"
#import "LFShareFootView.h"
#import "LFShareContentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFShareFatherView : UIView

@property (nonatomic,strong) UIControl *backgroundView;

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
