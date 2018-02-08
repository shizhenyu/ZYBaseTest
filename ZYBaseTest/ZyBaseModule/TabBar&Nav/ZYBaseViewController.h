//
//  ZYBaseViewController.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYBaseViewController : UIViewController

/** 当前控制器的背景颜色 */
@property (nonatomic, strong) UIColor *backgroundColor;

/** 当前控制器的title */
@property (nonatomic, copy) NSString *currentVCTitle;

/** 当前控制器的rightBarButton显示的图片 */
@property (nonatomic, copy) NSString *rightBarButtonItemImageName;

/** 当前控制器的rightBarButton显示的标题 */
@property (nonatomic, copy) NSString *rightBarButtonItemTitle;

/** 当前控制器的leftBarButton显示的图片名 */
@property (nonatomic, copy) NSString *leftBarButtonItemImageName;

/** 当前控制器的leftBarButton显示的标题 */
@property (nonatomic, copy) NSString *leftBarButtonItemTitle;

/** 当前控制器的leftBarButton显示的视图 */
@property (nonatomic, strong) UIView *leftBarButtonView;

/** 当前控制器的rightBarButton显示的视图 */
@property (nonatomic, strong) UIView *rightBarButtonView;

/**
 
 左侧侧按钮的点击事件
 
*/
- (void)leftBarButtonItemClick:(UIButton *)button;


/**
 
 右侧按钮的点击事件
 
 */
- (void)rightBarButtonItemClick:(UIButton *)button;
@end
