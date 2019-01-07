//
//  LF_ShareHandle.m
//  iOS-ObjectC
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LFShareHandle.h"
#import "LFShareTool.h"

@implementation LFShareHandle

+ (void)showShareView {
    
    [[LFShareTool sharedLFShareTool] showShareView];
}

+ (void)hideShareView {
    
    [[LFShareTool sharedLFShareTool] hideShareView];
}

@end
