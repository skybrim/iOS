//
//  LF_ShareHandle.m
//  iOS-ObjectC
//
//  Created by mac on 2018/10/19.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LFShareTool.h"

@implementation LFShareTool

singletonImplemention(LFShareTool);

- (void)showShareView {
    
    [[LFShareTool sharedLFShareTool].shareFatherView layoutPages];
    
    UIWindow *mainWindow = [UIApplication sharedApplication].windows[0];
    [mainWindow addSubview:self.shareFatherView];
}

- (void)hideShareView {
    
    [[LFShareTool sharedLFShareTool].shareFatherView removeFromSuperview];
}

#pragma mark - setter
- (void)setShareHeadView:(UIView *)shareHeadView {
    
    [LFShareTool sharedLFShareTool].shareFatherView.headHeight = CGRectGetHeight(shareHeadView.frame);
    [LFShareTool sharedLFShareTool].shareFatherView.shareHeadView = shareHeadView;
}

- (void)setShareFootView:(UIView *)shareFootView {
    
    [LFShareTool sharedLFShareTool].shareFatherView.footHeight = CGRectGetHeight(shareFootView.frame);
    [LFShareTool sharedLFShareTool].shareFatherView.shareFootView = shareFootView;
}

- (void)setShareContentView:(UIView *)shareContentView {
    
    [LFShareTool sharedLFShareTool].shareFatherView.contentHeight = CGRectGetHeight(shareContentView.frame);
    [LFShareTool sharedLFShareTool].shareFatherView.shareContentView = shareContentView;
}

#pragma mark - getter
- (LFShareFatherView *)shareFatherView {
    
    if (!_shareFatherView) {
        
        _shareFatherView= [[LFShareFatherView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    }
    return _shareFatherView;
}
@end
