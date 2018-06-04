//
//  JSTabBar.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/31.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "JSTabBar.h"

@interface JSTabBar ()

@property (nonatomic, strong) UIButton *centerButton;

@property (nonatomic, strong) UILabel *centerLabel;

@end

@implementation JSTabBar

#pragma mark - Init Method
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.translucent = NO;
        
        [self centerButton];
        [self centerLabel];
        
    }
    
    return self;
}

#pragma mark - Layout SubViews
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat totalWidth = self.frame.size.width;
    CGFloat totalHeight = self.frame.size.height;
    CGFloat itemWidth = totalWidth / 5;
    
    Class class = NSClassFromString(@"UITabBarButton");
    
    for (UIView *view in self.subviews) {
        
        if ([view isEqual:self.centerLabel]) {
            
            // 中间button的titleLabel
            view.frame = CGRectMake(0, 0, itemWidth, 15);
            view.center = CGPointMake(totalWidth / 2.0, totalHeight - view.frame.size.height + 8);
            
        }else if ([view isEqual:self.centerButton]) {
            
            // 中间button
            view.frame = CGRectMake(0, 0, itemWidth, totalHeight);
            [view sizeToFit];
            view.center = CGPointMake(totalWidth / 2.0, 10);
            
        }else if ([view isKindOfClass:class]) {
            
            // 系统的button
            CGRect frame = view.frame;
            
             // 防止UIView *view in self.subviews 获取到的不是有序的
            int indexFromOrigin = view.frame.origin.x / itemWidth;
            
            if (indexFromOrigin >= 2) {
                
                indexFromOrigin ++;
            }
            
            CGFloat x = indexFromOrigin * itemWidth;
            // 如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
            view.frame = CGRectMake(x, view.frame.origin.y, itemWidth, frame.size.height);
            
            // 调整Badge Postion
            for (UIView *badgeView in view.subviews) {
                
                NSString *className = NSStringFromClass([badgeView class]);
                
                if ([className rangeOfString:@"BadgeView"].location != NSNotFound) {
                    
                    badgeView.layer.transform = CATransform3DIdentity;
                    
                    badgeView.layer.transform = CATransform3DMakeTranslation(-17.0, 1.0, 1.0);
                    
                    break;
                }
            }
        }
    }
    
}

#pragma mark - Hit Test
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    /**
     
     这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的
     self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
     在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
     是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
     
     */
    
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.centerButton];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.centerButton pointInside:newP withEvent:event]) {
            
            return self.centerButton;
            
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            
            return [super hitTest:point withEvent:event];
        }
    }
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        
        return [super hitTest:point withEvent:event];
    }
}

#pragma mark - Button Event Response
- (void)buttonClick:(UIButton *)sender {
    
    [UIView animateWithDuration:0.1 animations:^{
        
        sender.transform = CGAffineTransformMakeScale(1.1, 1.1);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            sender.transform = CGAffineTransformIdentity;
            
        } completion:nil];
        
    }];
    
    if (self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(tabBar:clickCenterButton:)]) {
        
        [self.tabBarDelegate tabBar:self clickCenterButton:sender];
    }
}

#pragma mark - Setter && Getter
- (UIButton *)centerButton {
    
    if (!_centerButton) {
        
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_centerButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_centerButton];
    }
    
    return _centerButton;
}

- (UILabel *)centerLabel {
    
    if (!_centerLabel) {
        
        _centerLabel = [[UILabel alloc] init];
                
        _centerLabel.textColor = [UIColor blackColor];
        
        _centerLabel.font = [UIFont systemFontOfSize:10];
        
        _centerLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_centerLabel];
    }
    
    return _centerLabel;
}

- (void)setCenterButtonIconName:(NSString *)centerButtonIconName {
    
    _centerButtonIconName = centerButtonIconName;
    
    [self.centerButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", centerButtonIconName]] forState:UIControlStateNormal];
    
    [self.centerButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", centerButtonIconName]] forState:UIControlStateHighlighted];
}

- (void)setCenterButtonTitle:(NSString *)centerButtonTitle {
    
    _centerButtonTitle = centerButtonTitle;
    
    self.centerLabel.text = centerButtonTitle;
}

@end
