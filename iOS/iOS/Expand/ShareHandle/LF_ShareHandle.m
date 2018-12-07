//
//  LF_ShareHandle.m
//  iOS
//
//  Created by mac on 2018/10/19.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareHandle.h"

@implementation LF_ShareHandle

singletonImplemention(LF_ShareHandle);

- (void)show {
    
    [[LF_ShareHandle sharedLF_ShareHandle].shareFatherView layoutPages];
    
    UIWindow *mainWindow = [UIApplication sharedApplication].windows[0];
    [mainWindow addSubview:self.shareFatherView];
}

- (void)hide {
    
    [[LF_ShareHandle sharedLF_ShareHandle].shareFatherView removeFromSuperview];
}

#pragma mark - setter
- (void)setShareHeadView:(UIView *)shareHeadView {
    
    if (shareHeadView == nil) {
        
        [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.headHeight = 0;
    }
    [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.shareHeadView = shareHeadView;
    
}

- (void)setShareFootView:(UIView *)shareFootView {
    
    if (shareFootView == nil) {
        
        [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.footHeight = 0;
    }
    [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.shareHeadView = shareFootView;
}

- (void)setShareContentView:(UIView *)shareContentView {
    
    if (shareContentView == nil) {
        
        [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.contentHeight = 0;
    }
    [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.shareHeadView = shareContentView;
}

- (void)setShareHeadHeight:(CGFloat)headHeight {
    
    [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.headHeight = headHeight;
}

- (void)setShareFootHeight:(CGFloat)footHeight {
    
    [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.footHeight = footHeight;
}

- (void)setShareContentHeight:(CGFloat)contentHeight {
    
    [LF_ShareHandle sharedLF_ShareHandle].shareFatherView.contentHeight = contentHeight;
}


#pragma mark - getter
- (LF_ShareFatherView *)shareFatherView {
    
    if (!_shareFatherView) {
        
        _shareFatherView= [[LF_ShareFatherView alloc] initWithFrame:CGRectMake(0, 0, LF_SCREEN_WIDTH, LF_SCREEN_HEIGHT)];
    }
    return _shareFatherView;
}
@end
