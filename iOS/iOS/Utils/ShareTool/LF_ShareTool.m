//
//  LF_ShareHandle.m
//  iOS
//
//  Created by mac on 2018/10/19.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareTool.h"

@implementation LF_ShareTool

singletonImplemention(LF_ShareTool);

- (void)showShareView {
    
    [[LF_ShareTool sharedLF_ShareTool].shareFatherView layoutPages];
    
    UIWindow *mainWindow = [UIApplication sharedApplication].windows[0];
    [mainWindow addSubview:self.shareFatherView];
}

- (void)hideShareView {
    
    [[LF_ShareTool sharedLF_ShareTool].shareFatherView removeFromSuperview];
}

#pragma mark - setter
- (void)setShareHeadView:(UIView *)shareHeadView {
    
    if (shareHeadView == nil) {
        
        [LF_ShareTool sharedLF_ShareTool].shareFatherView.headHeight = 0;
    }
    [LF_ShareTool sharedLF_ShareTool].shareFatherView.shareHeadView = shareHeadView;
    
}

- (void)setShareFootView:(UIView *)shareFootView {
    
    if (shareFootView == nil) {
        
        [LF_ShareTool sharedLF_ShareTool].shareFatherView.footHeight = 0;
    }
    [LF_ShareTool sharedLF_ShareTool].shareFatherView.shareHeadView = shareFootView;
}

- (void)setShareContentView:(UIView *)shareContentView {
    
    if (shareContentView == nil) {
        
        [LF_ShareTool sharedLF_ShareTool].shareFatherView.contentHeight = 0;
    }
    [LF_ShareTool sharedLF_ShareTool].shareFatherView.shareHeadView = shareContentView;
}

- (void)setShareHeadHeight:(CGFloat)headHeight {
    
    [LF_ShareTool sharedLF_ShareTool].shareFatherView.headHeight = headHeight;
}

- (void)setShareFootHeight:(CGFloat)footHeight {
    
    [LF_ShareTool sharedLF_ShareTool].shareFatherView.footHeight = footHeight;
}

- (void)setShareContentHeight:(CGFloat)contentHeight {
    
    [LF_ShareTool sharedLF_ShareTool].shareFatherView.contentHeight = contentHeight;
}


#pragma mark - getter
- (LF_ShareFatherView *)shareFatherView {
    
    if (!_shareFatherView) {
        
        _shareFatherView= [[LF_ShareFatherView alloc] initWithFrame:CGRectMake(0, 0, LF_SCREEN_WIDTH, LF_SCREEN_HEIGHT)];
    }
    return _shareFatherView;
}
@end
