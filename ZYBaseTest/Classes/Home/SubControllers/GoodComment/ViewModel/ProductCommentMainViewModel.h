//
//  ProductCommentMainViewModel.h
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductCommentModel.h"

@interface ProductCommentMainViewModel : NSObject

- (NSMutableArray <ProductCommentModel *> *)fetchProcommentData;

@end
