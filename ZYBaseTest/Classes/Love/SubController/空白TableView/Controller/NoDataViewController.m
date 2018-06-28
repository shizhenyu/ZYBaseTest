//
//  NoDataViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/5/6.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "NoDataViewController.h"

@interface NoDataViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *selectorArr;

@end

@implementation NoDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.navigationItem.title = @"PerformSelector";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *changeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(changeTableViewState)];
    self.navigationItem.rightBarButtonItem = changeButton;
}

#pragma mark - Nav Response
- (void)changeTableViewState {
 
}

- (void)setupUI {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.selectorArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.selectorArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectorName = [self.selectorArr objectAtIndex:indexPath.row];
    
    SEL selector = NSSelectorFromString(selectorName);
    
    SuppressPerformSelectorLeakWarning([self performSelector:selector withObject:nil]);
}

#pragma mark - 方法创建
- (void)mainMethod0 {
    
    [self performSelector:@selector(test) withObject:nil afterDelay:1];
    
    NSLog(@"调用方法--开始");
    
    sleep(2);
    
    NSLog(@"调用方法--结束");
    
    /**
     
     打印结果 @“调用方法--开始” -> @"调用方法--结束"  -> @"执行perform方法"
     
     这个方法其实是增加了一个定时器，而这时aSelector应该是被添加到了队列的最后面，所以要等当前调用此方法的函数执行完毕后，selector方法才会执行
     */
}

- (void)mainMethod1 {
    
    [self performSelectorInBackground:@selector(test) withObject:nil];
    
    NSLog(@"调用方法--开始");
    
    sleep(2);
    
    NSLog(@"调用方法--结束");
    
    /**
     
     打印结果 @“调用方法--开始” -> @"执行perform方法" -> @"调用方法--结束"
     
     这个方法是直接在后台线程运行
     */
}

- (void)mainMethod2 {
    
    [self performSelectorOnMainThread:@selector(test) withObject:nil waitUntilDone:YES];
    
    NSLog(@"调用方法--开始");
    
    sleep(2);
    
    NSLog(@"调用方法--结束");
    
    /**
     
     打印结果 @"执行perform方法" -> @“调用方法--开始” -> @"调用方法--结束"
     
     这个方法是表示在主线程执行方法。然后参数wait如果为YES表示是否等待方法执行完毕再往下执行
     */
}

- (void)mainMethod3 {
    
    [self performSelectorOnMainThread:@selector(test) withObject:nil waitUntilDone:NO];
    
    NSLog(@"调用方法--开始");
    
    sleep(2);
    
    NSLog(@"调用方法--结束");
    
    /**
     
     打印结果 @“调用方法--开始” -> @"调用方法--结束" -> @"执行perform方法"
     
     如果为NO，还是跟原来使用afterDelay:(NSTimeInterval)delay方式一样，要等当前调用此方法的函数执行完毕后，selector方法才会执行
     */
}

- (void)mainMethod4 {
    
    [self performSelector:@selector(test) withObject:nil];
    
    NSLog(@"调用方法--开始");
    
    sleep(2);
    
    NSLog(@"调用方法--结束");
    
    /**
     
     打印结果 @"执行perform方法" -> @“调用方法--开始” -> @"调用方法--结束"
     
     这个是直接调用的，所以可以优先执行
     */
}

- (void)mainMethod5 {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self respondsToSelector:@selector(test)]) {
            
            [self performSelector:@selector(test) withObject:nil];
        }
    });
    
    NSLog(@"调用方法--开始");
    
    sleep(5);
    
    NSLog(@"调用方法--结束");
    
    /**
     
     打印结果 @“调用方法--开始” -> @"调用方法--结束" -> @"执行perform方法"
     
     */
}

- (void)mainMethod6 {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if ([self respondsToSelector:@selector(test)]) {
            
            [self performSelector:@selector(test) withObject:nil];
        }
        
    });
    
    NSLog(@"调用方法--开始");
    
    sleep(5);
    
    NSLog(@"调用方法--结束");
    
    /**
     
     打印结果 @“调用方法--开始” -> @"执行perform方法" -> @"调用方法--结束"
     
     是在全部队列中 执行
     */
}

- (void)mainMethod7 {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"1");
        
        [self performSelector:@selector(test) withObject:nil afterDelay:0];
        
        NSLog(@"3");
    });
    
    /**
     
     打印结果 1、3
     
     1、afterDelay方式是使用当前线程的RunLoop中  根据afterDelay参数创建一个Timer定时器在一定时间后调用SEL，NO AfterDelay方式是直接调用SEL。
     
     2、子线程中默认是没有runloop的，需要手动创建，只要调用获取当前线程RunLoop方法即可创建。
    
     */
}

- (void)mainMethod8 {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"1");
        
        [self performSelector:@selector(test) withObject:nil];
        
        NSLog(@"3");
    });
    
    /**
     
     打印结果    1 -> 执行perform方法 -> 2
    
     perform方法是在  全局队列中 执行的
    
     */
}

- (void)mainMethod9 {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self performSelector:@selector(test) withObject:nil afterDelay:0];
        
        [[NSRunLoop currentRunLoop] run];
        
        NSLog(@"调用方法--开始");
        
        sleep(5);
        
        NSLog(@"调用方法--结束");
    });
    
    /**
     
     打印结果  @“执行perform方法” -> @“调用方法--开始” -> @“调用方法--结束”
     
     创建子线程的runloop 用于执行perform 方法
     */
}

- (void)test {
    
    NSLog(@"执行perform方法");
}

- (NSMutableArray *)selectorArr {
    
    if (!_selectorArr) {
        
        _selectorArr = [[NSMutableArray alloc] initWithObjects:@"mainMethod0", @"mainMethod1", @"mainMethod2", @"mainMethod3", @"mainMethod4", @"mainMethod5", @"mainMethod6", @"mainMethod7", @"mainMethod8", @"mainMethod9",  nil];
    }
    
    return _selectorArr;
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
