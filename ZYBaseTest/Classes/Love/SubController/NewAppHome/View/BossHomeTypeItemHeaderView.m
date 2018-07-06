//
//  BossHomeTypeItemHeaderView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/30.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "BossHomeTypeItemHeaderView.h"

@interface BossHomeTypeItemHeaderViewItemCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation BossHomeTypeItemHeaderViewItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.mas_equalTo(0);
                        
            make.top.mas_equalTo(kWidth(10));
            
            make.width.height.mas_equalTo(kWidth(30));
            
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.iconImageView.mas_bottom).offset(kWidth(5));
            
            make.leading.trailing.mas_equalTo(0);
            
            make.height.mas_equalTo(15);
            
        }];
        
    }
    return self;
}

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] init];
        
        _iconImageView.image = kImage(@"签约状态-MC");
        
        [self.contentView addSubview:_iconImageView];
    }
    
    return _iconImageView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = @"订单查询";
        
        _titleLabel.textColor = [UIColor zy_colorWithHex:0x333434];
        
        _titleLabel.font = kFont(15);
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}


@end

@interface BossHomeTypeItemHeaderView ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation BossHomeTypeItemHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.mas_equalTo(0);
            
        }];
    }
    
    return self;
}

#pragma mark - UICollectionView Delegate && DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BossHomeTypeItemHeaderViewItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BossHomeTypeItemHeaderViewItemCell" forIndexPath:indexPath];
        
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 5, 0, 5);
}

#pragma mark - Setter && Getter
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat itemWidth = (kScreenWidth - kWidth(30)) / 3.0;
        
        flowLayout.itemSize = CGSizeMake(itemWidth, kWidth(70));
        
        flowLayout.minimumInteritemSpacing = 5;
        
        flowLayout.minimumLineSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.delegate = self;
        
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[BossHomeTypeItemHeaderViewItemCell class] forCellWithReuseIdentifier:@"BossHomeTypeItemHeaderViewItemCell"];
        
        [self addSubview:_collectionView];
    }
    
    return _collectionView;
}

@end
