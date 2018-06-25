//
//  QBHomeViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/8.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "QBHomeViewController.h"

@interface QBHomeViewController ()

@property (nonatomic, strong) UILabel *centerLabel;

@end

@implementation QBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

#pragma mark - 设置导航栏
- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton new];
    [backButton setImage:kImage(@"navigationButtonReturn") forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, kWidth(35), kWidth(35));
    [backButton addTarget:self action:@selector(backToRootViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(learnTryCatch)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

#pragma mark - 返回主 tabBarController
- (void)backToRootViewController {
    
    [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - 学习Try Catch
- (void)learnTryCatch {

    /*
     
     catch是抓取代码块1中的异常
     
     代码块2是出异常后的处理
     
     代码块3是不管出不出异常都会执行，如果代1或代2中有return，代3会在return后执行
     
     1、不管有木有出现异常，finally块中代码都会执行；
     
     2、当try和catch中有return时，finally仍然会执行；
     
     3、finally是在return后面的表达式运算后执行的（此时并没有返回运算后的值，而是先把要返回的值保存起来，管finally中的代码怎么样，返回的值都不会改变，任然是之前保存的值），所以函数返回值是在finally执行前确定的；
     
     4、finally中最好不要包含return，否则程序会提前退出，返回值不是try或catch中保存的返回值。
     
     这个异常捕获机制就是哪里用到就写到那里
     
     */
    
    NSMutableString *tmpStr = [[NSMutableString alloc] initWithString:@"abc"];
    
    @try {
        
        [tmpStr substringFromIndex:11];
        
        [tmpStr appendString:@" + try"];
        
    } @catch (NSException *exception) {
        
        NSLog(@"%@",exception);
        
        [tmpStr appendString:@" + append exception"];
        
    } @finally {
        
        NSLog(@"result:%@", tmpStr);
        
    }
    
    NSArray *arr = @[@"000", @"111", @"222", @"333", @"444", @"555", @"666", @"777", @"888", @"999"];
    
    @try {
        // 执行的代码，其中可能有异常。一旦发现异常，则立即跳到catch执行。否则不会执行catch里面的内容
        
        self.centerLabel.text = arr[10];
        
    } @catch(NSException *exception) {
        
        // 除非try里面执行代码发生了异常，否则这里的代码不会执行
        NSLog(@"文本内容有问题，请稍后重试");
        
    } @finally {
        
        // 不管什么情况都会执行，包括try catch 里面用了return ,可以理解为只要执行了try或者catch，就一定会执行 finally
        
        self.centerLabel.text = [arr lastObject];
    }
    
}

- (void)setupUI {
    
    self.centerLabel = [[UILabel alloc] init];
    self.centerLabel.center = self.view.center;
    self.centerLabel.bounds = CGRectMake(0, 0, 180, 40);
    self.centerLabel.backgroundColor = [UIColor orangeColor];
    self.centerLabel.textAlignment = NSTextAlignmentCenter;
    self.centerLabel.font = kFont(17);
    [self.view addSubview:self.centerLabel];
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
