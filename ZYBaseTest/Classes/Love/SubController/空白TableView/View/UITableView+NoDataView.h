//
//  UITableView+NoDataView.h
//  ZYBaseTest
//
//  Created by youyun on 2018/5/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (NoDataView)

@property (nonatomic, assign) BOOL isShowNoDataView;

@property (nonatomic, copy) NSString *noDataImageName;

@property (nonatomic, copy) NSString *noDataTipStr;

@end
