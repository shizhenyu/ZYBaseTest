//
//  OrderListViewModel.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "OrderListViewModel.h"

@implementation OrderListViewModel

- (NSMutableArray *)fetchOrderListData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"OrderListData" ofType:@"plist"];
    
    NSArray *sourceArr = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *dataArr = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in sourceArr) {
        
        OrderListModel *model = [OrderListModel mj_objectWithKeyValues:dic];
        
        [dataArr addObject:model];
    }
    
    return dataArr;
}

@end
