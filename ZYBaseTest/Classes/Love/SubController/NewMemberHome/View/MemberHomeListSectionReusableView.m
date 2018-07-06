//
//  MemberHomeListSectionReusableView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/29.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "MemberHomeListSectionReusableView.h"

@interface MemberHomeListSectionReusableViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *avatarView;

@end

@implementation MemberHomeListSectionReusableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(0);
            
        }];
        
    }
    return self;
}

- (UIImageView *)avatarView {
    
    if (!_avatarView) {
        
        _avatarView = [[UIImageView alloc] init];
        
        _avatarView.backgroundColor = [UIColor clearColor];
        
        _avatarView.layer.cornerRadius = kWidth(25);
        
        _avatarView.layer.masksToBounds = YES;
        
        [self.contentView addSubview:_avatarView];
    }
    
    return _avatarView;
}

@end

@interface MemberHomeListSectionReusableView ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UILabel *mainTitleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation MemberHomeListSectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.mas_equalTo(kWidth(8));
            
            make.leading.mas_equalTo(kWidth(15));
            
            make.height.mas_equalTo(16);
            
        }];
        
        [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerY.equalTo(self.mainTitleLabel.mas_centerY);
            
            make.leading.equalTo(self.mainTitleLabel.mas_trailing).offset(kWidth(3));
            
            make.height.mas_equalTo(13);
            
        }];
        
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.leading.mas_equalTo(kWidth(15));
            
            make.trailing.mas_equalTo(kWidth(-15));
            
            make.top.equalTo(self.mainTitleLabel.mas_bottom).offset(kWidth(5));
            
            make.height.mas_equalTo(kWidth(50));
            
        }];
    }
    
    return self;
}

#pragma mark - Setter && Getter
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MemberHomeListSectionReusableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MemberHomeListSectionReusableViewCell" forIndexPath:indexPath];
    
    NSString *imageURL = [self.dataSource objectAtIndex:indexPath.row];
    
    [cell.avatarView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (UILabel *)mainTitleLabel {
    
    if (!_mainTitleLabel) {
        
        _mainTitleLabel = [[UILabel alloc] init];
        
        _mainTitleLabel.text = @"会员";
        
        _mainTitleLabel.font = kFont(16);
        
        [_mainTitleLabel sizeToFit];
        
        [self addSubview:_mainTitleLabel];
    }
    
    return _mainTitleLabel;
}

- (UILabel *)subTitleLabel {
    
    if (!_subTitleLabel) {
        
        _subTitleLabel = [[UILabel alloc] init];
        
        _subTitleLabel.text = @"会员信息查询";
        
        _subTitleLabel.textColor = [UIColor zy_colorWithRed:138 green:138 blue:138];
        
        _subTitleLabel.font = kFont(13);
        
        [_subTitleLabel sizeToFit];
        
        [self addSubview:_subTitleLabel];
    }
    
    return _subTitleLabel;
}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        flowLayout.itemSize = CGSizeMake(kWidth(50), kWidth(50));
        
        flowLayout.minimumLineSpacing = -kWidth(8);
        
        flowLayout.minimumInteritemSpacing = 0.01;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.alwaysBounceHorizontal = YES;
        
        _collectionView.delegate = self;
        
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[MemberHomeListSectionReusableViewCell class] forCellWithReuseIdentifier:@"MemberHomeListSectionReusableViewCell"];
        
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [self addSubview:_collectionView];
    }
    
    return _collectionView;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc] init];
    }
    
    return _dataSource;
}

- (void)setImageURLArr:(NSMutableArray *)imageURLArr {
    
    _imageURLArr = imageURLArr;
    
    self.dataSource = imageURLArr;
    
    [self.collectionView reloadData];
}

@end
