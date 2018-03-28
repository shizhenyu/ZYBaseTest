//
//  PersonInfoTableViewCell.h
//  ZYBaseTest
//
//  Created by youyun on 2018/3/28.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonInfoTableViewCellDelegate <NSObject>

- (void)textFieldContentDidChange:(NSString *)text inIndexPath:(NSInteger)indexPath;

@end

@interface PersonInfoTableViewCell : UITableViewCell

@property (nonatomic, weak) id <PersonInfoTableViewCellDelegate> delegate;

@property (nonatomic, assign) NSInteger indexPath_Row;

@property (nonatomic, copy) NSString *titleStr;

@property (nonatomic, copy) NSString *placeholderStr;

@property (nonatomic, copy) NSString *contentStr;

@end
