//
//  ProductCommentMainViewModel.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ProductCommentMainViewModel.h"

@implementation ProductCommentMainViewModel

- (NSMutableArray *)fetchProcommentData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ProductCommentList" ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    NSArray *productCommentArr = [dict objectForKey:@"commentData"];
    
    NSMutableArray *dataArr = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in productCommentArr) {
        
        ProductCommentModel *model = [ProductCommentModel mj_objectWithKeyValues:dic];
        
        [dataArr addObject:model];
    }
    
    return dataArr;
}

@end
