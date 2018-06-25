//
//  YYTextViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/13.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "YYTextViewController.h"
#import "YYTextTableViewCell.h"

static NSString *const originStr = @"Objective-C和Swift，哪一个更好";
static NSString *const ObjectiveCStr = @"Objective-C";
static NSString *const AndString = @"和";
static NSString *const SwiftStr = @"Swift";
static NSString *const AnotherOne = @"哪一个";
static NSString *const BetterStr = @"更好";

@interface YYTextViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YYTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"YYText";
}

- (void)setupUI {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YYTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YYTextTableViewCell" forIndexPath:indexPath];
    
    cell.label.attributedText = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

#pragma mark - 设置行间距
- (NSMutableAttributedString *)customMethod0 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_font = kFont(15);
    
    text.yy_lineSpacing = 5; //行间距
    
    return text;
}

#pragma mark - 设置文字间距
- (NSMutableAttributedString *)customMethod1 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    /*
     NSCaseInsensitiveSearch 不区分大小写比较
     NSLiteralSearch    区分大小写比较
     NSBackwardsSearch  从字符串末尾开始搜索
     NSAnchoredSearch   搜索限制范围的字符串
     */
    
    NSRange range = [originStr rangeOfString:ObjectiveCStr options:NSCaseInsensitiveSearch];
    
    text.yy_font = kFont(15);
    
    [text yy_setFont:kFont(20) range:range];
    
    [text yy_setColor:[UIColor redColor] range:range];  // 选定字的颜色
    
    [text yy_setKern:@(5) range:range]; //文字间距
    
    return text;
}

#pragma mark - 设置空心字
- (NSMutableAttributedString *)customMethod2 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    NSRange range = [originStr rangeOfString:SwiftStr options:NSCaseInsensitiveSearch];
    
    text.yy_font = kFont(15);
    
    // 文字描边(空心字)默认黑色， 必须设置宽度
    [text yy_setStrokeColor:[UIColor orangeColor] range:range];
    
    [text yy_setStrokeWidth:@(5) range:range]; // 设置文字描边的宽度
    
    return text;
}

#pragma mark - 设置下划线
- (NSMutableAttributedString *)customMethod3 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_color = [UIColor blueColor];
    
    text.yy_font = kFont(15);
    
    NSRange range = [originStr rangeOfString:SwiftStr options:NSCaseInsensitiveSearch];
    
    YYTextDecoration *decora = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle];
    
    decora.color = [UIColor redColor];
    
    decora.width = @(1);
    
    [text yy_setTextUnderline:decora range:range]; // 下划线
    
    return text;
}

#pragma mark - 设置删除线
- (NSMutableAttributedString *)customMethod4 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_color = [UIColor blueColor];
    
    text.yy_font = kFont(15);
    
    NSRange range = [originStr rangeOfString:SwiftStr options:NSCaseInsensitiveSearch];
    
    YYTextDecoration *decora = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle];
    
    decora.color = [UIColor redColor];
    
    decora.width = @(1);
    
    [text yy_setTextStrikethrough:decora range:range]; // 删除样式
    
    return text;
}

#pragma mark - 设置边框线
- (NSMutableAttributedString *)customMethod5 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_color = [UIColor blueColor];
    
    text.yy_font = kFont(15);
    
    NSString *tempStr = [NSString stringWithFormat:@"%@%@", AnotherOne, BetterStr];
    
    NSRange range = [originStr rangeOfString:tempStr options:NSCaseInsensitiveSearch];
    
    // 边框
    YYTextBorder *border = [[YYTextBorder alloc] init];
    
    border.strokeColor = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000]; // 边框线颜色
    
    border.strokeWidth = 2; // 边框线宽度
    
    border.lineStyle = YYTextLineStylePatternCircleDot;
    
    border.cornerRadius = 3;  // 边框线圆角
    
    border.insets = UIEdgeInsetsMake(0, -2, 0, -2); // 边框线距离字体的间距
    
    [text yy_setTextBorder:border range:range];
    
    return text;
}

#pragma mark - 设置阴影
- (NSMutableAttributedString *)customMethod6 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_color = [UIColor blueColor];
    
    text.yy_font = kFont(15);
    
    NSString *tempStr = [NSString stringWithFormat:@"%@%@", AnotherOne, BetterStr];
    
    NSRange range = [originStr rangeOfString:tempStr options:NSCaseInsensitiveSearch];
    
    // 阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    
    [shadow setShadowColor:[UIColor orangeColor]]; // 阴影的颜色
    
    [shadow setShadowBlurRadius:1.0];  // 阴影的圆角
    
    [shadow setShadowOffset:CGSizeMake(2, 2)]; // 阴影的偏移量
    
    [text yy_setShadow:shadow range:range];
    
    return text;
}

#warning 有问题，正在修改
#pragma mark - 设置文本内阴影
- (NSMutableAttributedString *)customMethod7 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_color = [UIColor blackColor];
    
    text.yy_font = kFont(15);
    
    NSString *tempStr = [NSString stringWithFormat:@"%@%@", AnotherOne, BetterStr];
    
    NSRange range = [originStr rangeOfString:tempStr options:NSCaseInsensitiveSearch];
    
    // 阴影
    YYTextShadow *shadow = [YYTextShadow shadowWithColor:[UIColor redColor] offset:CGSizeMake(2, 2) radius:1.f];
    
    shadow.blendMode = kCGBlendModeColorBurn;
    
    [text yy_setTextInnerShadow:shadow range:range];
    
    return text;
}

#pragma mark - 简单文本高亮
- (NSMutableAttributedString *)customMethod8 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_color = [UIColor blackColor];
    
    text.yy_font = kFont(15);
    
    NSRange range = [originStr rangeOfString:ObjectiveCStr options:NSCaseInsensitiveSearch];
    
    [text yy_setTextHighlightRange:range color:[UIColor colorWithRed:0.093 green:0.492 blue:1.0 alpha:1.0] backgroundColor:[UIColor colorWithWhite:0.0 alpha:0.2] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
       
        [[MBProgressTool sharedMBTool] showMessageInWindowMiddle:@"点击“高亮文本”"];
    }];
    
    return text;
}

#pragma mark - 文本高亮 Pro
- (NSMutableAttributedString *)customMethod9 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    UIColor *normalColor = [UIColor colorWithRed:0.093 green:0.492 blue:1.0 alpha:1.0]; // 正常状态颜色
    UIColor *highLightColor = [UIColor purpleColor];  // 高亮状态颜色
    
    NSRange range = [originStr rangeOfString:SwiftStr options:NSCaseInsensitiveSearch];
    
    YYTextDecoration *noramlDecora = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1.5) color:normalColor];
    YYTextDecoration *highlightDecora = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle width:@(1.5) color:highLightColor];
    
    [text yy_setColor:normalColor range:range]; // 未点击时颜色
    [text yy_setTextUnderline:noramlDecora range:range]; // 未点击时下划线
    
    // 高亮状态
    YYTextHighlight *highlight = [[YYTextHighlight alloc] init];
    [highlight setColor:highLightColor];
    [highlight setUnderline:highlightDecora];
    
    highlight.tapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        
        [[MBProgressTool sharedMBTool] showMessageInWindowMiddle:@"点击了Swift"];
    };
    
    [text yy_setTextHighlight:highlight range:range];
    
    return text;
}

- (NSMutableAttributedString *)customMethod10 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    return text;
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[YYTextTableViewCell class] forCellReuseIdentifier:@"YYTextTableViewCell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc] initWithObjects:[self customMethod0], [self customMethod1], [self customMethod2], [self customMethod3], [self customMethod4], [self customMethod5], [self customMethod6], [self customMethod7], [self customMethod8], [self customMethod9],  nil];
    }
    
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
