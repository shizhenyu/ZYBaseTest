//
//  ZYAlertViewController.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "ZYAlertViewController.h"

@interface ZYAlertViewController ()

@end

@implementation ZYAlertViewController

+ (instancetype)alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(nullable NSString *)otherButtonTitles, ... {
    
    ZYAlertViewController *alert = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    if (cancelButtonTitle) {
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            if (alert.handler) {
                alert.handler(0);
            }
            
        }];
        
        [alert addAction:cancleAction];
    }
    
    va_list otherTitles;
    
    NSString *otherTitle;
    
    if (otherButtonTitles) {
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (alert.handler) {
                alert.handler(1);
            }
            
        }];
        
        [alert addAction:otherAction];
        
        
        va_start(otherTitles, otherButtonTitles);
        
        __block NSInteger i = 2;
        
        while ((otherTitle = va_arg(otherTitles, NSString *))) {
            
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if (alert.handler) {
                    alert.handler(i);
                    i++;
                }
                
            }];
            
            [alert addAction:otherAction];
            
        }
        va_end(otherTitles);
    }
    
    return alert;
    
}

@end
