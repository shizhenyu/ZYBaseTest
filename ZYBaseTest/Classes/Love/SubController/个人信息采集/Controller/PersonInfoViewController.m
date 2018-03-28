//
//  PersonInfoViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/28.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "PersonInfoTableViewCell.h"

@interface PersonInfoViewController ()<UITableViewDelegate, UITableViewDataSource, PersonInfoTableViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *placeholderArr;
@property (nonatomic, strong) NSMutableDictionary *infoDic;
@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"个人信息";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[PersonInfoTableViewCell class] forCellReuseIdentifier:@"PersonInfoTableViewCell"];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PersonInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonInfoTableViewCell" forIndexPath:indexPath];
    
    cell.delegate = self;
    
    cell.indexPath_Row = indexPath.row;
    
    cell.titleStr = [self.titleArr objectAtIndex:indexPath.row];
    
    cell.placeholderStr = [self.placeholderArr objectAtIndex:indexPath.row];
    
    cell.contentStr = [self.infoDic objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewCell Delegate
- (void)textFieldContentDidChange:(NSString *)text inIndexPath:(NSInteger)indexPath {
    
    [self.infoDic setObject:text forKey:[NSString stringWithFormat:@"%ld",indexPath]];
}

#pragma mark - 懒加载
- (NSMutableArray *)titleArr {
    
    if (!_titleArr) {
        
        NSArray *arr = @[@"姓名", @"昵称", @"手机号", @"性别", @"星座", @"出生年月", @"身份证号码", @"邮编", @"住宅电话", @"个人主页", @"毕业院校", @"薪资要求"];
        
        _titleArr = [[NSMutableArray alloc] init];
        
        [_titleArr addObjectsFromArray:arr];
        [_titleArr addObjectsFromArray:arr];
    }
    
    return _titleArr;
}
- (NSMutableArray *)placeholderArr {
    
    if (!_placeholderArr) {
        
        NSArray *arr = @[@"请填写姓名", @"请填写昵称", @"请填写手机号", @"请填写性别", @"请填写星座", @"请填写出生年月", @"请填写身份证号", @"请填写邮编", @"请填写住宅电话", @"请填写个人主页", @"请填写毕业院校", @"请填写薪资要求"];
        
        _placeholderArr = [[NSMutableArray alloc] init];
        
        [_placeholderArr addObjectsFromArray:arr];
        
        [_placeholderArr addObjectsFromArray:arr];
    }
    
    return _placeholderArr;
}
- (NSMutableDictionary *)infoDic {
    
    if (!_infoDic) {
        
        _infoDic = [[NSMutableDictionary alloc] init];
        
        for (NSInteger i = 0; i < self.titleArr.count; i++) {
            
            [_infoDic setObject:@"" forKey:[NSString stringWithFormat:@"%ld",i]];
        }
    }
    
    return _infoDic;
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
