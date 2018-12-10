//
//  LF_ShareContentView.m
//  iOS
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareContentView.h"
#import "LF_ShareItemCell.h"

static  NSString * const SHARE_VIEW_CELL = @"LF_ShareViewCell.h";

@implementation LF_ShareContentView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];

        [self addSubview:self.shareCollectionView];
        [self.shareCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.left.equalTo(@0);
            make.bottom.equalTo(@0);
            make.width.mas_equalTo(LF_SCREEN_WIDTH);
        }];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LF_ShareItemCell *shareItemCell = [collectionView dequeueReusableCellWithReuseIdentifier:SHARE_VIEW_CELL forIndexPath:indexPath];
    
    return shareItemCell;
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
        
        [_shareCollectionView registerClass:[LF_ShareItemCell class] forCellWithReuseIdentifier:SHARE_VIEW_CELL];
        
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
