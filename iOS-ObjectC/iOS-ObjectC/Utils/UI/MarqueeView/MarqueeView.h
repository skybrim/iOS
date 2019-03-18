//
//  MarqueeView.h
//  KMPharmacy
//
//  Created by mac on 2018/5/10.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MarqueeType) {
    left = 1,
    right = 2,
    reverse = 3,
};

@interface MarqueeView : UIView

@property (nonatomic,assign) MarqueeType type;
@property (nonatomic,assign) CGFloat contentMargin;
@property (nonatomic,assign) int frameInterval;
@property (nonatomic,assign) CGFloat pointsPerFrame;
@property (nonatomic,strong) UIView *contentView;

@end

