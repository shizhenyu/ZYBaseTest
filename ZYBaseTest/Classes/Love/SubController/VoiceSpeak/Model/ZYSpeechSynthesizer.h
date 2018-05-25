//
//  ZYSpeechSynthesizer.h
//  ZYBaseTest
//
//  Created by youyun on 2018/5/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface ZYSpeechSynthesizer : NSObject

/**
 单例初始化

 @return ZYSpeechSynthesizer的实例对象
 */
+ (instancetype)sharedSpeechSynthesizer;

/**
 开始播报

 @param string 传进去的内容
 */
- (void)speakString:(NSString *)string;

/**
 停止讲话
 */
- (void)stopSpeak;

@end
