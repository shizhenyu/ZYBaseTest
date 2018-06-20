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
    
    cell.contentLabel.attributedText = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

#pragma mark - Custom Method
- (NSMutableAttributedString *)customMethod0 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_font = kFont(17);
    
    text.yy_lineSpacing = 0; //行间距
    
    return text;
}

- (NSMutableAttributedString *)customMethod1 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    /*
     NSCaseInsensitiveSearch 不区分大小写比较
     NSLiteralSearch    区分大小写比较
     NSBackwardsSearch  从字符串末尾开始搜索
     NSAnchoredSearch   搜索限制范围的字符串
     */
    
    NSRange range = [originStr rangeOfString:ObjectiveCStr options:NSCaseInsensitiveSearch];
    
    [text yy_setFont:kFont(20) range:range];
    
    [text yy_setColor:[UIColor redColor] range:range];
    
    [text yy_setKern:@(2) range:range]; //文字间距
    
    return text;
}

- (NSMutableAttributedString *)customMethod2 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    NSRange range = [originStr rangeOfString:SwiftStr options:NSCaseInsensitiveSearch];
    
    // 文字描边(空心字)默认黑色， 必须设置宽度
    [text yy_setStrokeColor:[UIColor orangeColor] range:range];
    
    [text yy_setStrokeWidth:@(5) range:range];
    
    return text;
}

- (NSMutableAttributedString *)customMethod3 {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:originStr];
    
    text.yy_color = [UIColor blueColor];
    
    NSRange range = [originStr rangeOfString:SwiftStr options:NSCaseInsensitiveSearch];
    
    YYTextDecoration *decora = [YYTextDecoration decorationWithStyle:YYTextLineStylePatternDot];
    
    decora.color = [UIColor redColor];
    
    decora.width = @(2);
    
    [text yy_setTextUnderline:decora range:range];
    
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
        
        _dataSource = [[NSMutableArray alloc] initWithObjects:[self customMethod0], [self customMethod1], [self customMethod2], [self customMethod3], nil];
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
