//
//  KMPCMProductTableViewCell.h
//  KMPharmacy
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMPNestedMainHeaderView.h"
#import "KMPNestedSubCollectionViewCell.h"

@interface KMPNestedMainTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) KMPNestedMainHeaderView *headerView;
@property (nonatomic,strong) UICollectionView *subCollectionView;

@property (nonatomic,copy) void(^showMainCellBlock)(KMPNestedSubCollectionViewCell *subCollectionViewCell, NSInteger subCollectionViewIndex);

@property (nonatomic,strong) NSArray *nameArray;
- (void)showProductListCell:(NSArray *)nameArray;

@end
