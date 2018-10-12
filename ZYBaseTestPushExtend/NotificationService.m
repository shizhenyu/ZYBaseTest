//
//  NotificationService.m
//  ZYBaseTestPushExtend
//
//  Created by youyun on 2018/3/16.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "NotificationService.h"
#import <AVFoundation/AVFoundation.h>
#import "ZYUseDefine.h"

typedef void(^PlayVoiceBlock)(void);

@interface NotificationService ()<AVSpeechSynthesizerDelegate, AVAudioPlayerDelegate>

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

// AVSpeechSynthesisVoice 播放完毕之后的回调block
@property (nonatomic, copy) PlayVoiceBlock finshBlock;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    // Modify the notification content here...
    self.bestAttemptContent.title = self.bestAttemptContent.title;
    
    NSUserDefaults *stand = [[NSUserDefaults alloc] initWithSuiteName:kNotificationServiceGroupName];
    
    if ([stand boolForKey:kUserIsCloseVoiceSpeak]) {

        // 用户关闭了语音播报，不播报
        
    }else if ([stand boolForKey:kUserIsOpenSimpleVoiceSpeak]){
        
        // 用户开启了语音播报，但是是简易的语音播报
        
        __weak typeof(self)weakSelf = self;
        
        [self playVoiceWithAVSpeechSynthesisVoiceWithContent:kSimpleVoiceSpeakContent finshBlock:^{
            
            weakSelf.contentHandler(self.bestAttemptContent);
        }];

    }else {
        
        // 用户开启了完全体的语音播报
        __weak typeof(self)weakSelf = self;
        
        [self playVoiceWithAVSpeechSynthesisVoiceWithContent:self.bestAttemptContent.body finshBlock:^{
            
            weakSelf.contentHandler(self.bestAttemptContent);
        }];
    }

    self.contentHandler(self.bestAttemptContent);
}

#pragma mark- AVSpeechSynthesisVoice文字转语音进行播放，成功
- (void)playVoiceWithAVSpeechSynthesisVoiceWithContent:(NSString *)content finshBlock:(PlayVoiceBlock)finshBlock {
    
    if (content.length == 0) {
        return;
    }
    if (finshBlock) {
        self.finshBlock = finshBlock;
    }
    
    AVSpeechSynthesizer *player  = [[AVSpeechSynthesizer alloc]init];
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:content];//设置语音内容
    
    utterance.voice  = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-TW"];//设置语言
    
    utterance.rate   = 0.5;  //设置语速
    
    utterance.volume = 1;  //设置音量（0.0~1.0）默认为1.0
    
    utterance.pitchMultiplier    = 1;  //设置语调 (0.5-2.0)
    
    utterance.postUtteranceDelay = 1; //目的是让语音合成器播放下一语句前有短暂的暂停
    
    [player speakUtterance:utterance];
    
}

#pragma mark - AVSpeechSynthesizerDelegate
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance
{
    NSLog(@"开始");
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    self.finshBlock();
    NSLog(@"结束");
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance
{
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance
{
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance
{
    
}
- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    self.contentHandler(self.bestAttemptContent);
}

@end
