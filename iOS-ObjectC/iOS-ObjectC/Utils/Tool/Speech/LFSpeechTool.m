//
//  LFSpeechTool.m
//  iOS-ObjectC
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019 skybrim. All rights reserved.
//

#import "LFSpeechTool.h"

@implementation LFSpeechTool

singletonImplemention(LFSpeechTool);

- (void)beginSpeakingWithContent:(NSString *)speechContent {
    
    //初始化要说出的内容
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:speechContent];
    //设置语速,语速介于AVSpeechUtteranceMaximumSpeechRate和AVSpeechUtteranceMinimumSpeechRate之间
    //AVSpeechUtteranceMaximumSpeechRate
    //AVSpeechUtteranceMinimumSpeechRate
    //AVSpeechUtteranceDefaultSpeechRate
    utterance.rate = 0.5;
    
    //设置音高,[0.5 - 2] 默认 = 1
    //AVSpeechUtteranceMaximumSpeechRate
    //AVSpeechUtteranceMinimumSpeechRate
    //AVSpeechUtteranceDefaultSpeechRate
    utterance.pitchMultiplier = 1;
    
    //设置音量,[0-1] 默认 = 1
    utterance.volume = 1;
    
    //读一段前的停顿时间
    utterance.preUtteranceDelay = 1;
    //读完一段后的停顿时间
    utterance.postUtteranceDelay = 1;
    
    //设置声音,是AVSpeechSynthesisVoice对象
    //AVSpeechSynthesisVoice定义了一系列的声音, 主要是不同的语言和地区.
    //voiceWithLanguage: 根据制定的语言, 获得一个声音.
    //speechVoices: 获得当前设备支持的声音
    //currentLanguageCode: 获得当前声音的语言字符串, 比如”ZH-cn”
    //language: 获得当前的语言
    //通过特定的语言获得声音
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    //通过voicce标示获得声音
    //AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithIdentifier:AVSpeechSynthesisVoiceIdentifierAlex];
    utterance.voice = voice;
    //开始朗读
    [self.avSpeaker speakUtterance:utterance];
}

- (void)pauseSpeaking {
    //暂停朗读
    //AVSpeechBoundaryImmediate 立即停止
    //AVSpeechBoundaryWord    当前词结束后停止
    [self.avSpeaker pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

- (void)continueSpeaking {
    [self.avSpeaker continueSpeaking];
}

- (void)stopSpeaking {
    //AVSpeechBoundaryImmediate 立即停止
    //AVSpeechBoundaryWord    当前词结束后停止
    [self.avSpeaker stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}


#pragma mark - AVSpeechSynthesizerDelegate
//已经开始
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    
    
}
//已经说完
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    
    //如果朗读要循环朗读，可以在这里再次调用朗读方法
    //[_avSpeaker speakUtterance:utterance];
}
//已经暂停
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
//已经继续说话
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
//已经取消说话
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
//将要说某段话
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance{
    
}

#pragma mark - getter

- (AVSpeechSynthesizer *)avSpeaker {
    
    if (_avSpeaker == nil) {
        
        //初始化语音合成器
        _avSpeaker = [[AVSpeechSynthesizer alloc] init];
        _avSpeaker.delegate = self;
    }
    return _avSpeaker;
}

@end
