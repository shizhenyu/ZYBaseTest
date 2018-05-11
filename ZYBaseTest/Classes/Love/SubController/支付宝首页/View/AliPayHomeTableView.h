//
//  AliPayHomeTableView.h
//  ZYBaseTest
//
//  Created by youyun on 2018/5/10.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AliPayHomeTableView : UITableView

@property (nonatomic, copy) void (^changeContentSize)(CGSize contentSize);

- (void)loadMoreData;

- (void)setScrollViewContentOffSet:(CGPoint)point;

@end
