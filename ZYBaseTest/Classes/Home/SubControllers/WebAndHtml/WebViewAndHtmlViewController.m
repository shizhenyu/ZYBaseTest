//
//  WebViewAndHtmlViewController.m
//  ZYBaseTest
//
//  Created by youyun on 2018/3/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "WebViewAndHtmlViewController.h"

@interface WebViewAndHtmlViewController ()<UIWebViewDelegate>

@end

@implementation WebViewAndHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     
     参考链接 : https://www.jianshu.com/p/e584eaccb3a6
     
     **/
    
    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"H5交互";
}

- (void)setupUI {
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:@"http://m.dianping.com/tuan/deal/8157270"];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

#pragma mark - UIWebView Delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    // 1.获取页面标题
    NSString *string = @"document.title";
    [webView stringByEvaluatingJavaScriptFromString:string];
    
    // 2.去掉页面标题
    NSMutableString *str = [NSMutableString string];
    
    // 3.根据标签类型获取指定标签的元素 -> 移除头部的导航栏
    [str appendString:@"var header = document.getElementsByTagName(\"header\")[0];"];
    [str appendString:@"header.parentNode.removeChild(header);"];
    
    // 4.根据标签类型获取指定标签的元素 -> 移除尾部的footer
    [str appendString:@"var footer = document.getElementsByClassName(\"footer\")[0];"];
    [str appendString:@"footer.parentNode.removeChild(footer);"];
    
    // 5.去掉最底下的一块区域
    [str appendString:@"var btn = document.getElementsByClassName(\"footer-btn-fix\")[0];"];
    [str appendString:@"btn.parentNode.removeChild(btn);"];
    
    [webView stringByEvaluatingJavaScriptFromString:str];
    
    
    // 6.获取店铺地址
    NSMutableString *address = [NSMutableString string];
    // 6.1首先获取到该标签元素
    [address appendString:@"var address = document.getElementsByClassName(\"blo\")[0];"];
    // 6.2获取到该标签元素的文本内容
    [address appendString:@"address.textContent"];
    // 6.3输出内容
    NSLog(@"%@", [webView stringByEvaluatingJavaScriptFromString:address]);
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
