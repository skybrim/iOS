//
//  KMPCMProductCollectionViewCell.h
//  KMPharmacy
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMPPassTableView.h"

@interface KMPNestedSubCollectionViewCell : UICollectionViewCell<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) KMPPassTableView *subTableView;

@property (nonatomic,assign) BOOL isSubTableViewCanScroll;

@property (nonatomic,copy) void(^footerRefreshBlock)(void);

@property (nonatomic,assign) NSInteger rowsCount;
@property (nonatomic,assign) CGFloat rowHeight;
@property (nonatomic,strong) NSString *cellClassName;
@property (nonatomic,copy) void(^showSubTableViewCellBlock)(UITableViewCell *subTableViewCell,NSInteger subTableViewIndex);
- (void)registerCellClass:(NSString *)cellClassName;

@property (nonatomic,copy) void(^subTableViewCellClickBlock)(NSInteger subTableViewIndex);


@end
