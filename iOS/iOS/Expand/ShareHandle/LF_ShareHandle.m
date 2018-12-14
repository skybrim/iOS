//
//  LF_ShareHandle.m
//  iOS
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareHandle.h"
#import "LF_ShareTool.h"

@implementation LF_ShareHandle

+ (void)showShareView {

    [[LF_ShareTool sharedLF_ShareTool] showShareView];
}

+ (void)hideShareView {
    
    [[LF_ShareTool sharedLF_ShareTool] hideShareView];
}

@end
