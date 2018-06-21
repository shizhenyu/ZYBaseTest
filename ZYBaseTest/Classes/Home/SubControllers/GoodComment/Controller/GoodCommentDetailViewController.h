//
//  GoodCommentDetailViewController.h
//  ZYBaseTest
//
//  Created by youyun on 2018/6/21.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductCommentModel.h"

@interface GoodCommentDetailViewController : UIViewController

@property (nonatomic, strong) ProductCommentModel *model;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) NSInteger indexPath;

@end
