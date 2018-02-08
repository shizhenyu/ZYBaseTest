//
//  OrderListViewModel.h
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderListModel.h"

@interface OrderListViewModel : NSObject

- (NSMutableArray <OrderListModel *>*)fetchOrderListData;

@end
