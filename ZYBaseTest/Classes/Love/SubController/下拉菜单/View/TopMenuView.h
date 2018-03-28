//
//  TopMenuView.h
//  ZYBaseTest
//
//  Created by youyun on 2018/3/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopMenuViewDelegate <NSObject>

- (void)topMenuViewDidSelectedIndex:(NSInteger)index selectedTitle:(NSString *)selectTitle;

@end

@interface TopMenuView : UIView

@property(nonatomic, weak) id<TopMenuViewDelegate> delegate;

/** 第一个title数组 */
@property (nonatomic, strong) NSMutableArray *titleArr1;

/** 第二个title数组 */
@property (nonatomic, strong) NSMutableArray *titleArr2;

/** show方法 */
- (void)show;

/** hide方法  当页面消失的时候一定要主动调用 */
- (void)hide;

@end
