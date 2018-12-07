//
//  LF_ShareHandle.h
//  iOS
//
//  Created by mac on 2018/10/19.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LF_ShareFatherView.h"



NS_ASSUME_NONNULL_BEGIN

@interface LF_ShareHandle : NSObject

singletonInterface(LF_ShareHandle);

@property (nonatomic,strong) LF_ShareFatherView *shareFatherView;

- (void)show;

@end

NS_ASSUME_NONNULL_END
