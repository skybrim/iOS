//
//  LF_ShareHandle.m
//  iOS
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareHandle.h"
#import "LFShareTool.h"

@implementation LF_ShareHandle

+ (void)showShareView {

    [[LFShareTool sharedLFShareTool] showShareView];
}

+ (void)hideShareView {
    
    [[LFShareTool sharedLFShareTool] hideShareView];
}

+ (void)head {
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"adasda ddawdadaa ";
    [label sizeToFit];
    
    [[LFShareTool sharedLFShareTool] setShareHeadView:label];
}

@end
