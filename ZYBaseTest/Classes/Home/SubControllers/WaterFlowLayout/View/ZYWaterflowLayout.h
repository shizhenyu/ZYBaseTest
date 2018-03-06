//
//  ZYWaterflowLayout.h
//  ZYBaseTest
//
//  Created by youyun on 2018/3/5.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZYCollectionWidth self.collectionView.frame.size.width

/** 每一行之间的间距 */
static const CGFloat ZYDefaultRowMargin = 10;

/** 每一列之间的间距 */
static const CGFloat ZYDefaultColumnMargin = 10;

/** 每一列之间的间距 top, left, bottom, right */
static const UIEdgeInsets ZYDefaultInset = {10, 10, 10, 10};

/** 默认的列数 */
static const int ZYDefaultColumnCount = 3;

@interface ZYWaterflowLayout : UICollectionViewLayout

/** 每一列的最大Y值 */
@property (nonatomic, strong) NSMutableArray *columnMaxYs;

/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;

@end
