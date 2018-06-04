//
//  JSTabBar.h
//  ZYBaseTest
//
//  Created by youyun on 2018/5/31.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSTabBar;
@protocol JSTabBarDelegate <NSObject>

- (void)tabBar:(JSTabBar *)tabBar clickCenterButton:(UIButton *)sender;

@end

@interface JSTabBar : UITabBar

@property (nonatomic, weak) id <JSTabBarDelegate> tabBarDelegate;

@property (nonatomic, copy) NSString *centerButtonIconName;

@property (nonatomic, copy) NSString *centerButtonTitle;

@end
