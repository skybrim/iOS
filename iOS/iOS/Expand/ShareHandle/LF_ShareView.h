//
//  LF_ShareView.h
//  iOS
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LF_ShareView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *shareCollectionView;
@property (nonatomic,strong) UIView *shareHeadView;
@property (nonatomic,strong) UIView *shareFootView;

@end

NS_ASSUME_NONNULL_END
