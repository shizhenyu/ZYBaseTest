//
//  ZYSpeechSynthesizer.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ZYSpeechSynthesizer.h"

@interface ZYSpeechSynthesizer ()<AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) AVSpeechSynthesizer *speechSynthesizer;

@end

@implementation ZYSpeechSynthesizer

#pragma mark - Init Method
+ (instancetype)sharedSpeechSynthesizer {
    
    static ZYSpeechSynthesizer *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[ZYSpeechSynthesizer alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [self initSpeechSynthesizer];
    }
    return self;
}

- (void)initSpeechSynthesizer {
    
    NSAssert([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0, @"Device System Version Must be 7.0 or later");
    
    self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    self.speechSynthesizer.delegate = self;
}

- (void)speakString:(NSString *)string {
    
    if (self.speechSynthesizer) {
        
        AVSpeechUtterance *aUtterance = [AVSpeechUtterance speechUtteranceWithString:string];
        [aUtterance setVoice:[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"]];
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
            
            aUtterance.rate = 0.25;
            
        }else if ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0) {
            
            aUtterance.rate = 0.15;
        }
        
        if ([self.speechSynthesizer isSpeaking]) {
            
            [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        }
        
        [self.speechSynthesizer speakUtterance:aUtterance];
    }
}

- (void)stopSpeak {
    
    if (self.speechSynthesizer) {
        
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

@end
