//
//  KMPCMProductTableViewCell.m
//  KMPharmacy
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "KMPNestedMainTableViewCell.h"

static  NSString * const SUB_COLLECTIONVIEW_CELL = @"KMPNestedSubCollectionViewCell.h";

@implementation KMPNestedMainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        WEAK_SELF(self);
        [self.contentView addSubview:self.headerView];
        [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            STRONG_SELF(self);
            make.left.top.right.equalTo(self);
            make.height.mas_equalTo(40);
        }];
        
        [self.contentView addSubview:self.subCollectionView];
        [self.subCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            STRONG_SELF(self);
            make.top.equalTo(@40);
            make.left.right.equalTo(self);
            make.height.mas_equalTo(SCREEN_HEIGHT-kNavBarHeight-kStatusBarHeight-kTabBarHeight-40);
        }];
    
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.nameArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KMPNestedSubCollectionViewCell *subCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:SUB_COLLECTIONVIEW_CELL forIndexPath:indexPath];
    
    if (self.showMainCellBlock) {
        self.showMainCellBlock(subCollectionCell,indexPath.row);
    }
        
    return subCollectionCell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

//每个item 的视图的宽高  只有宽高，没有frame
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-kNavBarHeight-kStatusBarHeight-kTabBarHeight-40);
    return size;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self.headerView changeSlideSelectIndex:scrollView.contentOffset.x/SCREEN_WIDTH];
}

#pragma mark -
- (void)showProductListCell:(NSArray *)nameArray {

    self.nameArray = nameArray;

    [self.headerView showSlide:nameArray];
}

#pragma mark - getter
- (UICollectionView *)subCollectionView {
    
    if (!_subCollectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _subCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
        _subCollectionView.backgroundColor = [UIColor whiteColor];
        _subCollectionView.pagingEnabled = YES;
        _subCollectionView.delegate = self;
        _subCollectionView.dataSource = self;
        
        [_subCollectionView registerClass:[KMPNestedSubCollectionViewCell class] forCellWithReuseIdentifier:SUB_COLLECTIONVIEW_CELL];
        
    }
    return _subCollectionView;
}

- (KMPNestedMainHeaderView *)headerView {
    
    if (!_headerView) {
        
        _headerView = [[KMPNestedMainHeaderView alloc] initWithFrame:CGRectZero];
        
        WEAK_SELF(self);
        [_headerView setSlideSelectIndexBlock:^(NSInteger index) {
            STRONG_SELF(self);
            [self.subCollectionView setContentOffset:CGPointMake(index*SCREEN_WIDTH, 0)];
        }];
    }
    return _headerView;
}

#pragma mark -
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
