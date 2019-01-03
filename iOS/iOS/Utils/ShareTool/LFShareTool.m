//
//  LF_ShareHandle.m
//  iOS
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
    
    if (shareFootView == nil) {
        
        [LFShareTool sharedLFShareTool].shareFatherView.footHeight = 0;
    }
    [LFShareTool sharedLFShareTool].shareFatherView.shareHeadView = shareFootView;
}

- (void)setShareContentView:(UIView *)shareContentView {
    
    if (shareContentView == nil) {
        
        [LFShareTool sharedLFShareTool].shareFatherView.contentHeight = 0;
    }
    [LFShareTool sharedLFShareTool].shareFatherView.shareHeadView = shareContentView;
}

- (void)setShareHeadHeight:(CGFloat)headHeight {
    
    [LFShareTool sharedLFShareTool].shareFatherView.headHeight = headHeight;
}

- (void)setShareFootHeight:(CGFloat)footHeight {
    
    [LFShareTool sharedLFShareTool].shareFatherView.footHeight = footHeight;
}

- (void)setShareContentHeight:(CGFloat)contentHeight {
    
    [LFShareTool sharedLFShareTool].shareFatherView.contentHeight = contentHeight;
}


#pragma mark - getter
- (LFShareFatherView *)shareFatherView {
    
    if (!_shareFatherView) {
        
        _shareFatherView= [[LFShareFatherView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    }
    return _shareFatherView;
}
@end
