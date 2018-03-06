//
//  ZYWaterflowLayout.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/5.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ZYWaterflowLayout.h"

@implementation ZYWaterflowLayout

#pragma mark - Private Method

/**
 * 决定了collectionView的contentSize
 */
- (CGSize)collectionViewContentSize {
    
    // 找出最长那一列的最大Y值
    CGFloat desMaxY = [self.columnMaxYs[0] doubleValue];
    
    for (NSUInteger i = 0; i < self.columnMaxYs.count; i ++) {
        
        // 取出第i列的最大Y值
        CGFloat colomnMaxY = [self.columnMaxYs[i] doubleValue];
        
        // 找出数组中的最大Y值
        if (colomnMaxY > desMaxY) {
            
            desMaxY = colomnMaxY;
        }
    }
    
    return CGSizeMake(0, desMaxY + ZYDefaultInset.bottom);
}

- (void)prepareLayout
{
    /*
     * prepareLayout方法每次刷新都会调用  init方法只有在创建布局对象的时候执行一次
     */
    
    [super prepareLayout];
    
    // 重置每一列的最大Y值
    [self.columnMaxYs removeAllObjects];
    
    for (NSUInteger i = 0; i < ZYDefaultColumnCount; i ++) {
        
        [self.columnMaxYs addObject:@(ZYDefaultInset.top)];
    }
    
    // 计算所有Cell的布局属性
    [self.attrsArray removeAllObjects];
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (NSUInteger i = 0; i < count; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [self.attrsArray addObject:attribute];
    }
}

/**
 * 说明所有元素（比如cell、补充控件、装饰控件）的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 * cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    /** 计算indexPath位置上cell的布局属性 */
    
    // 水平方向上的总间距
    CGFloat xMargin = ZYDefaultInset.left + ZYDefaultInset.right + (ZYDefaultColumnCount - 1) * ZYDefaultColumnMargin;
    
    // cell的宽度
    CGFloat w = (ZYCollectionWidth - xMargin) / ZYDefaultColumnCount;
    
    // cell的高度，测试数据，随机数
    CGFloat h = 50 + arc4random_uniform(150);
    
    // 找出最短那一列的 列号 和 最大Y值
    CGFloat destMaxY = [self.columnMaxYs[0] doubleValue];
    
    NSUInteger destColumn = 0;
    
    for (NSUInteger i = 1; i<self.columnMaxYs.count; i++) {
        
        // 取出第i列的最大Y值
        CGFloat columnMaxY = [self.columnMaxYs[i] doubleValue];
        
        // 找出数组中的最小值
        if (destMaxY > columnMaxY) {
            
            destMaxY = columnMaxY;
            
            destColumn = i;
        }
    }
    
    // cell的x值
    CGFloat x = ZYDefaultInset.left + destColumn * (w + ZYDefaultColumnMargin);
    
    // cell的y值
    CGFloat y = destMaxY + ZYDefaultRowMargin;
    
    // cell的frame
    attribute.frame = CGRectMake(x, y, w, h);
    
    // 更新数组中的最大Y值
    self.columnMaxYs[destColumn] = @(CGRectGetMaxY(attribute.frame));
    
    return attribute;
}

#pragma mark - Lazy Load
- (NSMutableArray *)columnMaxYs {
    
    if (!_columnMaxYs) {
        
        _columnMaxYs = [[NSMutableArray alloc]init];
        
    }
    
    return _columnMaxYs;
}

- (NSMutableArray *)attrsArray {
    
    if (!_attrsArray) {
        
        _attrsArray = [[NSMutableArray alloc]init];
    }
    
    return _attrsArray;
}

@end
