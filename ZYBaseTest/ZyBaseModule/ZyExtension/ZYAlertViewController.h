//
//  ZYAlertViewController.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYAlertViewController : UIAlertController

@property (nonatomic,copy)void(^handler)(NSInteger buttonIndex);

+ (instancetype)alertWithTitle:( NSString *)title message:( NSString *)message preferredStyle:( UIAlertControllerStyle)preferredStyle cancelButtonTitle:( NSString *)cancelButtonTitle otherButtonTitles:( NSString *)otherButtonTitles, ...;

@end
