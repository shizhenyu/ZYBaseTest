//
//  DiscussViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "DiscussViewController.h"
#import "DiscussTabBarController.h"

@interface DiscussViewController ()

/** 是否从次级TabBar返回 */
@property (nonatomic, assign) BOOL isFromSubTabBar;

@end

@implementation DiscussViewController

#pragma mark - Life Cycle
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (self.isFromSubTabBar) {
        
    }
}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if (self.isFromSubTabBar) {
        
        self.isFromSubTabBar = NO;
        self.tabBarController.selectedIndex = 0;
        
    }else {
        
        DiscussTabBarController *tabBarVC = [[DiscussTabBarController alloc] init];
        
        [self.navigationController.navigationBar setHidden:YES];
        
        [self.tabBarController.tabBar setHidden:YES];
        
        [self.navigationController pushViewController:tabBarVC animated:YES];
    }
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:PopFromSubTabBar object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isFromSubTabBar = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(FromSubTabBar) name:PopFromSubTabBar object:nil];
}

#pragma mark - Notification Event Response
- (void)FromSubTabBar {
   
    self.isFromSubTabBar = YES;
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
