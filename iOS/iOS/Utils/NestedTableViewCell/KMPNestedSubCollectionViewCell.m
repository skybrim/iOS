//
//  KMPCMProductCollectionViewCell.m
//  KMPharmacy
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "KMPNestedSubCollectionViewCell.h"

@implementation KMPNestedSubCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.cellClassName = @"cell";
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subTableViewCanScroll:) name:KMPCMSubScrollEnableNotification object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subTableViewScrollToTop) name:KMPCMMainScrollEnableNotification object:nil];

        [self.contentView addSubview:self.subTableView];
        [self.subTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
    }
    return self;
}

#pragma mark - UITableViewDataSource UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.rowsCount;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell * subCell = [tableView dequeueReusableCellWithIdentifier:self.cellClassName forIndexPath:indexPath];
    
    if (self.showSubTableViewCellBlock) {
        self.showSubTableViewCellBlock(subCell, indexPath.section);
    }
    
    return subCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
//    KMPHomeSectionFooter *footer = [[KMPHomeSectionFooter alloc] initWithFrame:CGRectZero];
    
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.subTableViewCellClickBlock) {
        self.subTableViewCellClickBlock(indexPath.section);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat contentYoffset = scrollView.contentOffset.y;

    if (self.isSubTableViewCanScroll == NO) {
        
        [scrollView setContentOffset:CGPointZero];
        return;
    }
    
    if (contentYoffset <= 0) {
        
        self.isSubTableViewCanScroll = NO;
//        [[NSNotificationCenter defaultCenter] postNotificationName:KMPCMMainScrollEnableNotification object:@(YES)];
    }
}

#pragma mark -
- (void)registerCellClass:(NSString *)cellClassName {
    
    self.cellClassName = cellClassName;
    [self.subTableView registerClass:NSClassFromString(cellClassName) forCellReuseIdentifier:cellClassName];
}


#pragma mark - action
- (void)subTableViewCanScroll:(NSNotification *)noti {
    
    self.isSubTableViewCanScroll = [noti.object boolValue];
}

- (void)subTableViewScrollToTop {
    
    [self.subTableView setContentOffset:CGPointZero];
}

#pragma mark - getter
- (KMPPassTableView *)subTableView {
    
    if (!_subTableView) {
        _subTableView = [[KMPPassTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _subTableView.backgroundColor = UIColorFromHEX(0xf5f5f5, 1);
        _subTableView.showsVerticalScrollIndicator = NO;
        _subTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _subTableView.rowHeight = self.rowHeight;
        
        _subTableView.delegate = self;
        _subTableView.dataSource = self;
        
        [_subTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        _subTableView.tableFooterView = [[UIView alloc] init];
        
        WEAK_SELF(self);
        _subTableView.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
            
            STRONG_SELF(self);
            if (self.footerRefreshBlock) {
                self.footerRefreshBlock();
            }
        }];
    }
    return _subTableView;
}


@end
