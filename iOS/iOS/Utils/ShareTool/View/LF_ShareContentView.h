//
//  LF_ShareContentView.h
//  iOS
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LF_Const.h"

NS_ASSUME_NONNULL_BEGIN

@interface LF_ShareContentView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *shareCollectionView;

@property (nonatomic,copy) void(^shareItemClick)(NSIndexPath *clickIndexPath);

@end

NS_ASSUME_NONNULL_END
