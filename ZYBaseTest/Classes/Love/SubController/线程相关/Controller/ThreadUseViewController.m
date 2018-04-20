//
//  ThreadUseViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/4/18.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "ThreadUseViewController.h"
#import "QRView.h"

@interface ThreadUseViewController ()<QRViewDelegate>

@property (nonatomic, strong) QRView *qrView;

@end

@implementation ThreadUseViewController

- (QRView *)qrView {
    
    if (!_qrView) {
        
        _qrView = [[QRView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        _qrView.delegate = self;
    }
    
    return _qrView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"线程相关";
}

- (void)setupUI {
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        
        self.qrView = [[QRView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        self.qrView.delegate = self;
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [self.view addSubview:self.qrView];
            
            UILabel *laebl = [[UILabel alloc] initWithFrame:CGRectMake(100, 500, 80, 60)];
            
            laebl.backgroundColor = [UIColor orangeColor];
            
            [self.view addSubview:laebl];
        });
        
    });
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
