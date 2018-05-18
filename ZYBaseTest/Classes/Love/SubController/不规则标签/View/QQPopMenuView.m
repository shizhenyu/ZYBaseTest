//
//  QQPopMenuView.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "QQPopMenuView.h"

static CGFloat const kQQPopMenuCellHeight = 44.f;

@interface QQPopMenuViewTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation QQPopMenuViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubViewConstraints];
    }
    
    return self;
}

#pragma mark - Add SubViewConstraints
- (void)addSubViewConstraints {
  
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.frame = CGRectMake(15, (kQQPopMenuCellHeight - 20)/2, 20, 20);
    [self.contentView addSubview:self.iconImageView];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame) + 5, self.iconImageView.frame.origin.y, 0, 0);
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.contentLabel];
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        
    }else {
        
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end

@interface QQPopMenuView ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *tableViewData;

@property (nonatomic, assign) CGPoint trianglePoint;

@property (nonatomic, copy) void (^action)(NSInteger index);

@end

@implementation QQPopMenuView

#pragma mark - Init Method
- (instancetype)initWithItems:(NSArray <NSDictionary *>*)array
                        width:(CGFloat)width trianglePoint:(CGPoint)point
                       action:(void (^)(NSInteger index))action {
    
    if (array.count == 0) return nil;
    
    if (self = [super init]) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        self.alpha = 0;
        
        self.tableViewData = [array copy];
        self.trianglePoint = point;
        self.action = action;
        
        // 添加全屏手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        
        // 创建tableView
        CGRect frame = CGRectMake(kScreenWidth - width - 5, point.y + 10, width, kQQPopMenuCellHeight * array.count);
        self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.layer.cornerRadius = 5;
        self.tableView.layer.masksToBounds = YES;
        self.tableView.rowHeight = kQQPopMenuCellHeight;
        self.tableView.scrollEnabled = NO;
        [self.tableView registerClass:[QQPopMenuViewTableViewCell class] forCellReuseIdentifier:@"QQPopMenuViewTableViewCell"];
        [self addSubview:self.tableView];
    }
    
    return self;
}

+ (void)initWithItems:(NSArray <NSDictionary *>*)array
                width:(CGFloat)width trianglePoint:(CGPoint)point
               action:(void (^)(NSInteger index))action {
    
    QQPopMenuView *menuView = [[QQPopMenuView alloc] initWithItems:array width:width trianglePoint:point action:action];
    
    [menuView show];
}

#pragma mark - Public Method
- (void)show {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    // 设置右上角为transform的起点（默认是中心点）
    self.tableView.layer.position = CGPointMake(kScreenWidth - 5, self.trianglePoint.y + 10);
    // 向右下transform
    self.tableView.layer.anchorPoint = CGPointMake(1, 0);
    self.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
        self.tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}

- (void)hide {
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.alpha = 0;
        self.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        
    } completion:^(BOOL finished) {
        
        [self.tableView removeFromSuperview];
        [self removeFromSuperview];
        
        if (self.hideHandle) {
            self.hideHandle();
        }
    }];
}

- (void)drawRect:(CGRect)rect {
    
    // 设置背景色
    [[UIColor whiteColor] set];
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(context);
    CGPoint point = self.trianglePoint;
    // 设置起点
    CGContextMoveToPoint(context, point.x, point.y);
    // 画线
    CGContextAddLineToPoint(context, point.x - 10, point.y + 10);
    CGContextAddLineToPoint(context, point.x + 10, point.y + 10);
    CGContextClosePath(context);
    // 设置填充色
    [[UIColor whiteColor] setFill];
    // 设置边框颜色
    [[UIColor whiteColor] setStroke];
    // 绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark - UIGesture Delegate && Action
- (void)tap:(UITapGestureRecognizer *)tap {
    
    [self hide];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([touch.view isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]) {
        
        return NO;
    }
    
    return YES;
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tableViewData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QQPopMenuViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QQPopMenuViewTableViewCell" forIndexPath:indexPath];
    
    NSDictionary *dic = [self.tableViewData objectAtIndex:indexPath.row];
    
    cell.iconImageView.image = [UIImage imageNamed:dic[@"icon"]];
    
    cell.contentLabel.text = dic[@"title"];
    
    [cell.contentLabel sizeToFit];
    
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsZero;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.action) {
        
        self.action(indexPath.row);
    }
    
    [self hide];
}

@end
