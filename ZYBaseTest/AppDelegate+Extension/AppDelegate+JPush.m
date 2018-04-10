//
//  AppDelegate+JPush.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/7.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "AppDelegate+JPush.h"
#import <AVFoundation/AVFoundation.h>

// iOS10注册APNs所需头 件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@implementation AppDelegate (JPush)

#pragma mark - 注册JPush服务
- (void)initJPushService:(NSDictionary *)launchOptions {
    
    [self initAVSpeech]; // 注册音频播放服务
    
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    [JPUSHService setupWithOption:launchOptions appKey:appKey channel:nil apsForProduction:isProduction advertisingIdentifier:nil];
    
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        
        if(resCode == 0){
            NSLog(@"registrationID获取成功：%@",registrationID);
            
        }
        else{
            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
        
    }];
    
}

#pragma mark - 配置AVSpeech
- (void)initAVSpeech {
    
    NSError *activeErr = nil;
    NSError *cateroyErr = nil;
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&cateroyErr];
    [[AVAudioSession sharedInstance] setActive:YES error:&activeErr];
}

- (void)JPush_application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)JPush_application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)JPush_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [JPUSHService handleRemoteNotification:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);

    NSUserDefaults *stand = [[NSUserDefaults alloc] initWithSuiteName:kNotificationServiceGroupName];
    
    if ([stand boolForKey:kUserIsCloseVoiceSpeak]) {
    
        // 用户关闭了语音播报，不播报
        
    }else if ([stand boolForKey:kUserIsOpenSimpleVoiceSpeak]) {
     
        // 用户开启了语音播报，但是是简易的语音播报
        
        // 如果iOS系统低于10.0，则没有通知扩展服务，采用直接播报
        if ([[[UIDevice currentDevice] systemVersion] doubleValue] < 10.0) {
            
            [self speakNotifiVoice:kSimpleVoiceSpeakContent];
        }

    }else {
        
        // 用户开启了完全体的语音播报
        
        // 如果iOS系统低于10.0，则没有通知扩展服务，采用直接播报
        if ([[[UIDevice currentDevice] systemVersion] doubleValue] < 10.0) {
            
            NSString *voice = userInfo[@"aps"][@"alert"][@"body"];
            
            [self speakNotifiVoice:voice];
        }
    }
}

- (void)JPush_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    [JPUSHService handleRemoteNotification:userInfo];
}

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#pragma mark- JPUSHRegisterDelegate
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    UNNotificationRequest *request = notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 前台收到远程通知");
        
    }
    else {
        // 判断为本地通知
        NSLog(@"iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 收到远程通知");
        
        
    }
    else {
        // 判断为本地通知
        NSLog(@"iOS10 收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    }
    
    completionHandler();  // 系统要求执行这个方法
}
#endif

- (void)JPush_cleanApplicationBadge:(UIApplication *)application {

    [application setApplicationIconBadgeNumber:0];
    
    [JPUSHService setBadge:0];
}

#pragma mark - 语音合成播报
- (void)speakNotifiVoice:(NSString *)content {
    
    if (content && content.length > 0) {
        
        AVSpeechSynthesizer *player  = [[AVSpeechSynthesizer alloc]init];
        
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:content];//设置语音内容
        
        utterance.voice  = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置语言
        
        utterance.rate   = 0.5;  //设置语速
        
        utterance.volume = 1;  //设置音量（0.0~1.0）默认为1.0
        
        utterance.pitchMultiplier    = 1;  //设置语调 (0.5-2.0)
        
        utterance.postUtteranceDelay = 1; //目的是让语音合成器播放下一语句前有短暂的暂停
        
        [player speakUtterance:utterance];
    }
}

@end
