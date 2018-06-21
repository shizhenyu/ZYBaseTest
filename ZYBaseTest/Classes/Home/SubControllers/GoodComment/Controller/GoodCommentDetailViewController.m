//
//  GoodCommentDetailViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/21.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "GoodCommentDetailViewController.h"

@interface GoodCommentDetailViewController ()

@end

@implementation GoodCommentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = self.model.userName;
}

- (void)setupUI {
    
    UILabel *label = [[UILabel alloc] init];
    
    label.numberOfLines = 0;
    
    label.text = self.model.content;
    
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(kWidth(15));
        
        make.top.mas_equalTo(kWidth(15));
        
        make.trailing.mas_equalTo(kWidth(-15));
        
    }];
}

// 预览界面时需要实现的功能
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"选项一" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"使用自己名字替换用户名字" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
       
        kWeakSelf;
        
        weakSelf.model.userName = @"涛昇依旧";
        [weakSelf.dataSource replaceObjectAtIndex:weakSelf.indexPath withObject:weakSelf.model];
        
        [ZYNotification postNotificationName:@"changeCommentUserName" object:nil];
        
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"选项三" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    return @[action1, action2, action3];
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
