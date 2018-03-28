//
//  ScrollingViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/24.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ScrollingViewController.h"
#import "SDCycleScrollView.h"

@interface ScrollingViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *imageURLArr;
@end

@implementation ScrollingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
    
    [self loadData];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"滚动轮播图";
}

- (void)setupUI
{
    self.scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 30, kScreenWidth, 250) delegate:self placeholderImage:[UIImage imageWithColor:[UIColor cyanColor]]];
    self.scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    [self.view addSubview:_scrollView];
}

- (void)loadData
{
    self.scrollView.imageURLStringsGroup = self.imageURLArr;
}

#pragma mark - 懒加载
- (NSMutableArray *)imageURLArr {
    
    if (!_imageURLArr) {
        
        _imageURLArr = [[NSMutableArray alloc] initWithObjects:@"http://pic24.photophoto.cn/20120814/0005018348123206_b.jpg", @"http://pic12.photophoto.cn/20090910/0005018303466977_b.jpg", @"http://p1.wmpic.me/article/2017/11/15/1510724610_EyEUUQAP.jpg", @"http://pic19.photophoto.cn/20110409/0005018313026700_b.jpg",  @"http://a3.topitme.com/6/2a/ba/1128751215cdcba2a6l.jpg", nil];
    }
    
    return _imageURLArr;
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
