//
//  TipGatherTableViewCell.h
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TipGatherTableViewCellDelegate <NSObject>

- (void)didSelectedIndexPathRow:(NSInteger)selectRow tipTag:(NSInteger)selectTag;

@end

@interface TipGatherTableViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray *tipArr;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) NSInteger indexPath_Row;
@property (nonatomic, weak) id <TipGatherTableViewCellDelegate> delegate;

@end
