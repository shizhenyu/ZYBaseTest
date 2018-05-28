//
//  ZyNavigationController.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "ZyNavigationController.h"
#import "ZYNavigationInteractiveTransition.h"

@interface ZyNavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIPanGestureRecognizer *popGestureRecognizer;

@property (nonatomic, strong) ZYNavigationInteractiveTransition *navTransition;

@end

@implementation ZyNavigationController

+ (void)load {
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];

    [navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor zy_colorWithHex:0xf2f7fa]] forBarMetrics:UIBarMetricsDefault];

    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor zy_colorWithHex:0x333434]}];

    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor zy_colorWithHex:0x333434],NSFontAttributeName:[UIFont systemFontOfSize:15 weight:UIFontWeightMedium]} forState:UIControlStateNormal];

    navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    /**
     
    // 全屏滑动返回
    self.interactivePopGestureRecognizer.enabled = YES;
    
    // 将返回按钮替换为我们的自定义按钮，并使滑动返回重新生效
    self.interactivePopGestureRecognizer.delegate = (id)self;
     
     */
    
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    UIView *gestureView = gesture.view;
    
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] init];
    popRecognizer.delegate = self;
    popRecognizer.maximumNumberOfTouches = 1;
    popRecognizer.delaysTouchesEnded = YES;
    [gestureView addGestureRecognizer:popRecognizer];
    
    _navTransition = [[ZYNavigationInteractiveTransition alloc] initWithViewController:self];
    [popRecognizer addTarget:_navTransition action:@selector(handleControllerPop:)];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.frame = CGRectMake(0, 0, kWidth(35), kWidth(35));
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        // 隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - orientation

#pragma mark - 设置是否允许自动旋转
- (BOOL)shouldAutorotate {
    
    return YES;
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    if (self.visibleViewController) {
        return self.visibleViewController.preferredStatusBarStyle;
    }
    
    return UIStatusBarStyleLightContent;
}

//修复有水平方向滚动的ScrollView时边缘返回手势失效的问题
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
