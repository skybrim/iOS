//
//  LF_ShareContentView.h
//  iOS
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFShareContentView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *shareCollectionView;
@property (nonatomic,strong) NSMutableArray *itemArray;

@end

NS_ASSUME_NONNULL_END
