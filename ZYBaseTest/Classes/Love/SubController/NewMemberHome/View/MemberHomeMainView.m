//
//  MemberHomeMainView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/29.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MemberHomeMainView.h"
#import "MemberHomeListSectionReusableView.h"
#import "MemberHomeIntroduceReusableView.h"
#import "MemberHomeTypesReusableView.h"
#import "MemberHomeItemCollectionViewCell.h"

@interface MemberHomeMainView ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) MemberHomeListSectionReusableView *listSectionHeaderView;

@property (nonatomic, strong) MemberHomeIntroduceReusableView *introduceSectionHeaderView;

@property (nonatomic, strong) MemberHomeTypesReusableView *typeSectionHeaderView;

@property (nonatomic, strong) NSMutableArray *imageURLArr;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation MemberHomeMainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.mas_equalTo(0);
            
        }];
        
    }
    return self;
}

#pragma mark - UICollectionView Delegate && DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0 || section == 1) {
        
        return 0;
        
    }else {
        
        return [self.dataSource[section] count];
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MemberHomeItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MemberHomeItemCollectionViewCell" forIndexPath:indexPath];
    
    cell.infoDic = [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if (indexPath.row % 2  == 1) {
        
        [cell hideRightLineView];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreenWidth / 2.0, kWidth(68));
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsZero;
}

#pragma mark - Section Header && Footer View
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            
            MemberHomeListSectionReusableView *listSectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MemberHomeListSectionReusableView" forIndexPath:indexPath];
                        
            listSectionHeaderView.imageURLArr = self.imageURLArr;
            
            return listSectionHeaderView;
            
        }else if (indexPath.section == 1) {
            
            MemberHomeIntroduceReusableView *introduceSectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MemberHomeIntroduceReusableView" forIndexPath:indexPath];
            
            return introduceSectionHeaderView;
            
        }else if (indexPath.section == 2) {
            
            MemberHomeTypesReusableView *typeSectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MemberHomeTypesReusableView" forIndexPath:indexPath];
            
            typeSectionHeaderView.titleStr = @"会员数据";
            
            return typeSectionHeaderView;
            
        }else {
            
            MemberHomeTypesReusableView *typeSectionHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MemberHomeTypesReusableView" forIndexPath:indexPath];
            
            typeSectionHeaderView.titleStr = @"会员活动";
            
            return typeSectionHeaderView;
        }
    }else {
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        footerView.backgroundColor = [UIColor zy_colorWithHex:0xf7f9fa];
        
        return footerView;
    }
    
    return nil;

}

#pragma mark - Section Header && Footer Size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0 || section == 1) {
        
      return CGSizeMake(kScreenWidth, kWidth(84));
        
    }

    return CGSizeMake(kScreenWidth, kWidth(39));
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    return CGSizeMake(kScreenWidth, kWidth(15));
}

#pragma mark - Setter && Getter
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.minimumLineSpacing = 0.0; // 同一组当中，行与行之间的最小行间距
        
        flowLayout.minimumInteritemSpacing = 0.0; // 同一行的cell中互相之间的最小间隔
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.delegate = self;
        
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[MemberHomeListSectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MemberHomeListSectionReusableView"];
        
        [_collectionView registerClass:[MemberHomeIntroduceReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MemberHomeIntroduceReusableView"];
        
        [_collectionView registerClass:[MemberHomeTypesReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MemberHomeTypesReusableView"];
        
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
        
        [_collectionView registerClass:[MemberHomeItemCollectionViewCell class] forCellWithReuseIdentifier:@"MemberHomeItemCollectionViewCell"];
        
        [self addSubview:_collectionView];
    }
    
    return _collectionView;
}

- (NSMutableArray *)imageURLArr {
    
    if (!_imageURLArr) {
        
        _imageURLArr = [[NSMutableArray alloc] initWithObjects:
                        @"http://admin.dears.cc/Upload/APIService/2016-04-13/20160413104022020_New.jpg",
                        @"http://img2.woyaogexing.com/2017/07/28/507e40111060e4e6!400x400_big.jpg",
                        @"http://img2.woyaogexing.com/2017/07/28/5ba967e00fc0357e!400x400_big.jpg",
                        @"http://img2.woyaogexing.com/2017/07/28/4988988e45fd6799!400x400_big.jpg",
                        @"http://img2.woyaogexing.com/2017/07/28/d03b32b658d9bc4a!400x400_big.jpg",
                        @"http://img2.woyaogexing.com/2017/07/28/507e40111060e4e6!400x400_big.jpg",
                        @"http://img2.woyaogexing.com/2017/07/28/b06111fe44365443!400x400_big.jpg",
                        @"http://p1.qzone.la/upload/5/c6272aaa-7c1a-4d82-bbc0-a1edb3b5eab8.jpg", @"http://p1.qzone.la/upload/9/5442c184-46ea-47ea-adca-316b8210a8ed.jpg", nil];
    }
    
    return _imageURLArr;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        NSArray *arr1 = @[];
        NSArray *arr2 = @[];
        
        NSDictionary *infoDic1 = @{@"title":@"会员列表", @"des":@"会员信息查询", @"icon":@"活动报表"};
        NSDictionary *infoDic2 = @{@"title":@"交易记录", @"des":@"会员交易查询", @"icon":@"交易纪录"};
        NSDictionary *infoDic3 = @{@"title":@"积分记录", @"des":@"会员积分的变动记录", @"icon":@"积分纪录-MC"};
        NSDictionary *infoDic4 = @{@"title":@"核销记录", @"des":@"会员兑换券的核销记录", @"icon":@"核销记录-MC"};
        NSDictionary *infoDic5 = @{@"title":@"交易记录", @"des":@"会员交易查询", @"icon":@"交易纪录"};
        
        NSArray *arr3 = @[infoDic1, infoDic2, infoDic3, infoDic4, infoDic5];
        
        NSDictionary *infoDic6 = @{@"title":@"余利宝", @"des":@"面向商家打造的现金管理工具", @"icon":@"余利宝"};
        NSDictionary *infoDic7 = @{@"title":@"花呗分期", @"des":@"账单分期慢慢还", @"icon":@"花呗分期"};
        NSDictionary *infoDic8 = @{@"title":@"扫码点餐", @"des":@"打造真正意义的智慧餐厅", @"icon":@"扫码点餐MC"};
        NSDictionary *infoDic9 = @{@"title":@"闪购", @"des":@"随时随地购物", @"icon":@"闪购"};
        
        NSArray *arr4 = @[infoDic6, infoDic7, infoDic8, infoDic9];

        _dataSource = [[NSMutableArray alloc] initWithObjects:arr1, arr2, arr3, arr4, nil];
    }
    
    return _dataSource;
}

@end
