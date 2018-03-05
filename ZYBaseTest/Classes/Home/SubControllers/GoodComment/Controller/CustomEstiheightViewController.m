//
//  CustomEstiheightViewController.m
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/2.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "CustomEstiheightViewController.h"
#import "CustomHeightTableViewCell.h"

@interface CustomEstiheightViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CustomEstiheightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
    
    [self createData];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"cell自适应";
}

- (void)setupUI
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(0);
        
    }];
}

- (void)createData
{
    NSString *str1 = @"太满意了，和图片上看到的一样，手感也很好，拍摄效果赞！背后个性签名超满意，礼品也都是精品，慢慢的爱意，强烈推荐！！";
    NSString *str2 = @"掌柜服务态度非常好。商品质量也非常不错。顶你了";
    NSString *str3 = @"掌柜太善良了，真是干一行懂一行呀。在掌柜的指导下我都快变内行人士了，真是一个好卖家。以后有这方面宝贝的需求还得找你哦，呵呵。商品这么快就到了，还不错哦，下次来你可要优惠哦^_";
    NSString *str4 = @"太满意了，和图片上看到的一样，手感也很好，拍摄效果赞！背后个性签名超满意，礼品也都是精品，慢慢的爱意，强烈推荐！！，宝贝质量不错，很喜欢了。谢谢掌柜。";
    
    NSArray *arr = @[str1, str2, str3, str4];
    
    for (int i = 0; i < 5; i ++) {
        
        [self.dataSource addObjectsFromArray:arr];
    }
    
    [self.tableView reloadData];
    
    [self.dataSource addObjectsFromArray:arr];
}

#pragma mark - UITableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomHeightTableViewCell" forIndexPath:indexPath];
    
    cell.titleLabel.text = @"用户评价";
    
    cell.miaoShuLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

// 预览界面时需要实现的功能
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {

    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"选项一" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"选项二" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"选项三" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    return @[action1, action2, action3];
}

#pragma mark - Lazy Load
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        /*
         
           关键点1：必须重写estimatedHeightForRowAtIndexPath方法
        
        这个方法是iOS7.0之后才出现的，如果不重写此方法，仅重写heightForRowAtIndexPath，那么大家会发现，cell并不会根据label的内容，自适应高度。
         
        原因：系统是先获取cell的高度，再获取cell的view。也就是先调用heightForRowAtIndexPath，再调用cellForRowAtIndexPath。在cellForRowAtIndexPath被调用之前，你的label是没有被设置文本内容的，因此它获取到的高度，并不是你想要的。那么我们必须想办法让系统在获取了cell之后，再获取cell的高度
         
        解决方案：重写estimatedHeightForRowAtIndexPath，顾名思义，它会返回一个估计高度，有了这个方法后，tableview会先调用它获取估计高度，然后获取cell，最后获取真实高度。estimatedHeightForRowAtIndexPath的返回值可以随意，返回多少都可以，只是给tableview一个安慰而已，让它延迟获取真实的高度。
         
         
         */
        
        _tableView.estimatedRowHeight = 44.f; //推测高度，必须有，可以随便写多少

        _tableView.rowHeight =UITableViewAutomaticDimension;//iOS8之后默认就是这个值，可以省略
        
        [_tableView registerNib:[UINib nibWithNibName:@"CustomHeightTableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomHeightTableViewCell"];
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [[NSMutableArray alloc]init];
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
