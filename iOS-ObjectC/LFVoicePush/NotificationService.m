//
//  NotificationService.m
//  LFVoicePush
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019 skybrim. All rights reserved.
//

#import "NotificationService.h"
#import <AVFoundation/AVFoundation.h>

@interface NotificationService ()<AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@property (nonatomic, strong) AVSpeechSynthesisVoice *synthesisVoice;
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    //静止原来的音效
    self.bestAttemptContent.sound = nil;
    // 播报语音
    [self playVoiceWithContent: self.bestAttemptContent.body];
    
    // 这行代码需要注释，当我们想解决当同时推送了多条消息，这时我们想多条消息一条一条的挨个播报，我们就需要将此行代码注释
    //    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    self.contentHandler(self.bestAttemptContent);
}


- (void)playVoiceWithContent:(NSString *)content {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:content];
    utterance.rate = 0.5;
    utterance.voice = self.synthesisVoice;
    [self.synthesizer speakUtterance:utterance];
}

// 新增语音播放代理函数，在语音播报完成的代理函数中，我们添加下面的一行代码
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    self.contentHandler(self.bestAttemptContent);
}

- (AVSpeechSynthesisVoice *)synthesisVoice {
    if (!_synthesisVoice) {
        _synthesisVoice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    }
    return _synthesisVoice;
}

- (AVSpeechSynthesizer *)synthesizer {
    if (!_synthesizer) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        _synthesizer.delegate = self;
    }
    return _synthesizer;
}


@end
