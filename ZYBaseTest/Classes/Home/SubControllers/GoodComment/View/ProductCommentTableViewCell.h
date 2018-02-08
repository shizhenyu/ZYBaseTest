//
//  ProductCommentTableViewCell.h
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductCommentModel.h"

@interface ProductCommentTableViewCell : UITableViewCell

@property (nonatomic, strong) ProductCommentModel *model;

@property (nonatomic, strong, readonly) UIButton *zanCountLabel;

@end
