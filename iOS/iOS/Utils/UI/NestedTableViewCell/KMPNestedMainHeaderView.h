//
//  KMPCMProductHeaderView.h
//  KMPharmacy
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DLCustomSlideView.h"
#import "DLLRUCache.h"
#import "DLScrollTabbarView.h"

@interface KMPNestedMainHeaderView : UIView<DLCustomSlideViewDelegate>

@property (nonatomic,strong) DLCustomSlideView *slideView;
@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,copy) void(^slideSelectIndexBlock)(NSInteger index);

- (void)showSlide:(NSArray *)dataArray;
- (void)changeSlideSelectIndex:(NSInteger)index;

@end
