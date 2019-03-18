//
//  KMPCMProductHeaderView.m
//  KMPharmacy
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "KMPNestedMainHeaderView.h"

@implementation KMPNestedMainHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)showSlide:(NSArray *)dataArray {
    
    self.dataArray = dataArray;
    
    [self addSubview:self.slideView];
    [self.slideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (void)changeSlideSelectIndex:(NSInteger)index {
    
    self.slideView.selectedIndex = index;
}

#pragma mark - DLCustomSlideViewDelegate
- (NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender{
    
    return self.dataArray.count;
}

- (UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index {
    
    return nil;
}

- (void)DLCustomSlideView:(DLCustomSlideView *)sender didSelectedAt:(NSInteger)index {
    
    if (self.slideSelectIndexBlock) {
        self.slideSelectIndexBlock(index);
    }
    

    [self bk_performBlock:^(id obj) {
        
//        [[NSNotificationCenter defaultCenter] postNotificationName:KMPCMRefreshSubScrollEnableNotification object:nil];
    } afterDelay:0.5];
}

#pragma mark - getter
- (DLCustomSlideView *)slideView {
    if (!_slideView) {
        
        _slideView = [[DLCustomSlideView alloc] init];
        DLLRUCache *cache = [[DLLRUCache alloc] initWithCount:self.dataArray.count];
        DLScrollTabbarView *tabbar = [[DLScrollTabbarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        tabbar.tabItemNormalColor = [UIColor blackColor];
        tabbar.tabItemSelectedColor = [UIColor blueColor];
        tabbar.tabItemNormalFontSize = 14.0f;
        tabbar.trackColor = [UIColor blueColor];
        tabbar.backgroundColor = [UIColor whiteColor];
        
        NSMutableArray *tmpArray = [NSMutableArray array];
        
        for (NSString *name in self.dataArray) {
            DLScrollTabbarItem *item = [DLScrollTabbarItem itemWithTitle:name width:SCREEN_WIDTH/5.0];
            [tmpArray addObject:item];
        }
        
        tabbar.tabbarItems = tmpArray;
        
        _slideView.delegate = self;
        _slideView.tabbar = tabbar;
        _slideView.cache = cache;
        _slideView.tabbarBottomSpacing = 5;
//        _slideView.baseViewController = self;
        [_slideView setup];
        _slideView.selectedIndex = 0;
    }
    return _slideView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
