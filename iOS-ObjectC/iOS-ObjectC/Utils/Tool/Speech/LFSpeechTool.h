//
//  LFSpeechTool.h
//  iOS-ObjectC
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019 skybrim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFSpeechTool : NSObject<AVSpeechSynthesizerDelegate>

singletonInterface(LFSpeechTool);

@property (nonatomic,strong) AVSpeechSynthesizer *avSpeaker;

- (void)beginSpeakingWithContent:(NSString *)speechContent;

- (void)pauseSpeaking;

- (void)continueSpeaking;

- (void)stopSpeaking;

@end

NS_ASSUME_NONNULL_END
