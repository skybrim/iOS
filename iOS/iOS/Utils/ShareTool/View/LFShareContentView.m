//
//  LF_ShareContentView.m
//  iOS
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LFShareContentView.h"
#import "LFShareItemCell.h"
#import "LFShareItem.h"

static  NSString * const SHARE_VIEW_CELL = @"LF_ShareViewCell.h";

@implementation LFShareContentView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        self.userInteractionEnabled = YES;

        [self addSubview:self.shareCollectionView];
        [self.shareCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.left.equalTo(@0);
            make.bottom.equalTo(@0);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        }];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LFShareItemCell *shareItemCell = [collectionView dequeueReusableCellWithReuseIdentifier:SHARE_VIEW_CELL forIndexPath:indexPath];
    
    if (indexPath.item == 0) {
        
        shareItemCell.shareItemImageView.image = [UIImage imageNamed:[@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"WeChat"]];
        shareItemCell.shareItemLabel.text = @"微信";
    }
    else if (indexPath.item == 1) {
        
        shareItemCell.shareItemImageView.image = [UIImage imageNamed:[@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"WeChat_moments"]];

        shareItemCell.shareItemLabel.text = @"朋友圈";
    }
    else if (indexPath.item == 2) {
        
        shareItemCell.shareItemImageView.image = [UIImage imageNamed:[@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"QQ"]];

        shareItemCell.shareItemLabel.text = @"QQ";
    }
    else if (indexPath.item == 3) {
        
        shareItemCell.shareItemImageView.image = [UIImage imageNamed:[@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"Qzone"]];

        shareItemCell.shareItemLabel.text = @"QQ空间";
    }
    else if (indexPath.item == 4) {
        
        shareItemCell.shareItemImageView.image = [UIImage imageNamed:[@"LFShareViewResource.bundle" stringByAppendingPathComponent:@"Weibo"]];

        shareItemCell.shareItemLabel.text = @"微博";
    }
    
    return shareItemCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width/4.0, 125);
    
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.shareItemClick) {
        self.shareItemClick(indexPath);
    }
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
        
        [_shareCollectionView registerClass:[LFShareItemCell class] forCellWithReuseIdentifier:SHARE_VIEW_CELL];
        
    }
    return _shareCollectionView;
}

- (NSMutableArray *)itemArray {
    
    if (_itemArray == nil) {
        
        _itemArray = [NSMutableArray array];
        
        
    }
    return _itemArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
