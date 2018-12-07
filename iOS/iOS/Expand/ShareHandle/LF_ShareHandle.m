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
    
    [self.shareFatherView layoutPages];
    
    UIWindow *mainWindow = [UIApplication sharedApplication].windows[0];
    [mainWindow addSubview:self.shareFatherView];
}


#pragma mark - getter
- (LF_ShareFatherView *)shareFatherView {
    
    if (!_shareFatherView) {
        
        _shareFatherView= [[LF_ShareFatherView alloc] initWithFrame:CGRectMake(0, 0, LF_SCREEN_WIDTH, LF_SCREEN_HEIGHT)];
    }
    return _shareFatherView;
}
@end
