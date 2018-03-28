//
//  PhotoPickerHomeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/21.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "PhotoPickerHomeViewController.h"
#import "HXPhotoManager.h"
#import "HXPhotoViewController.h"
#import "ZyNavigationController.h"

@interface PhotoPickerHomeViewController ()<HXPhotoViewControllerDelegate>

@property (nonatomic, strong) HXPhotoManager *manager;

@end

@implementation PhotoPickerHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"照片选择器";
}

- (void)setupUI
{
    UIButton *btn1 = [UIButton new];
    btn1.backgroundColor = [UIColor cyanColor];
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton new];
    btn2.backgroundColor = [UIColor cyanColor];
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
   
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(70);
        
        make.width.height.mas_equalTo(50);
        
    }];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        
        make.top.mas_equalTo(130);
        
        make.width.height.mas_equalTo(50);
        
    }];
    
}

- (void)buttonClick:(UIButton *)sender
{
    switch (sender.tag) {
        case 1:
        {
            [self selectPhoto];
        }
            break;
            
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }
}

- (void)selectPhoto
{
    self.manager.openCamera = YES;
    
    self.manager.photoMaxNum = 9;
    self.manager.videoMaxNum = 5;
    self.manager.rowCount = 4;
    
    HXPhotoViewController *photoVC = [[HXPhotoViewController alloc] init];
    photoVC.delegate = self;
    photoVC.manager = self.manager;
    
    [self presentViewController:[[ZyNavigationController alloc] initWithRootViewController:photoVC] animated:YES completion:nil];
}

- (void)selectAlbum
{

}
- (void)photoViewControllerDidNext:(NSArray<HXPhotoModel *> *)allList Photos:(NSArray<HXPhotoModel *> *)photos Videos:(NSArray<HXPhotoModel *> *)videos Original:(BOOL)original
{
    
}

/**
 点击取消执行的代理
 */
- (void)photoViewControllerDidCancel
{
    
}

#pragma mark - 懒加载
- (HXPhotoManager *)manager {
    
    if (!_manager) {
        
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        
        _manager.maxNum = 5;
    }
    
    return _manager;
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
