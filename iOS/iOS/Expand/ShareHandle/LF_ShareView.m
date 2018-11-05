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
     
        [self addSubview:self.shareHeadView];
        [self.shareHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@0);
            make.height.mas_equalTo(@0);
            make.width.mas_equalTo(LF_SCREEN_WIDTH);
        }];
        
        [self addSubview:self.shareFootView];
        [self.shareFootView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@0);
            make.left.equalTo(@0);
            make.width.mas_equalTo(LF_SCREEN_WIDTH);
            make.height.mas_equalTo(@0);
        }];
        
        [self addSubview:self.shareCollectionView];
        [self.shareCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.shareHeadView.mas_bottom).offset(0);
            make.left.equalTo(@0);
            make.bottom.equalTo(self.shareFootView.mas_top).offset(0);
            make.width.mas_equalTo(LF_SCREEN_WIDTH);
        }];
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

- (UIView *)shareHeadView {
    
    if (!_shareHeadView) {
        
        _shareHeadView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _shareHeadView;
}

- (UIView *)shareFootView {
    
    if (!_shareFootView) {
        
        _shareFootView = [[UIView alloc] initWithFrame:CGRectZero];

    }
    return _shareFootView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
