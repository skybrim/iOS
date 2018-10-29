//
//  LF_ShareView.m
//  iOS
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareView.h"
#import "LF_ShareViewCell.h"

static  NSString * const SHARE_VIEW_CELL = @"LF_ShareViewCell.h";

@implementation LF_ShareView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark - UICollectionViewDelegate UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    return nil;
}

#pragma mark - getter
- (UICollectionView *)shareCollectionView {
    
    if (!_shareCollectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //设置2个item左右之间的最小间隙，
        flowLayout.minimumInteritemSpacing = CGFLOAT_MIN;
        //设置2个item上下之间的最小间隙
        flowLayout.minimumLineSpacing = CGFLOAT_MIN;
        
        _shareCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _shareCollectionView.delegate = self;
        _shareCollectionView.dataSource = self;
        _shareCollectionView.backgroundColor = [UIColor clearColor];
        _shareCollectionView.showsVerticalScrollIndicator = NO;
        
        [_shareCollectionView registerClass:[LF_ShareViewCell class] forCellWithReuseIdentifier:SHARE_VIEW_CELL];
        
    }
    return _shareCollectionView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
