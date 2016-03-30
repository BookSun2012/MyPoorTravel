//
//  CityDetailViewController.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "CityDetailViewController.h"

@interface CityDetailViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)UIActivityIndicatorView *active;
@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    [self creatWebView];
    [self creatView];
}
- (void)creatWebView {
    NSURL *url =[NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    _webView = [[UIWebView alloc]init];
    _webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    for (id subview in _webView.subviews){  //webView是要被禁止滚动和回弹的UIWebView
        if ([[subview class] isSubclassOfClass: [UIScrollView class]])
            ((UIScrollView *)subview).bounces = NO;
    }
    _webView.delegate = self;
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
}


- (void)creatView {
    /**
     UIActivityIndicatorViewStyleWhiteLarge,
     UIActivityIndicatorViewStyleWhite,
     UIActivityIndicatorViewStyleGray,
     */
    
    _active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _active.frame = CGRectMake(0, 0, 80, 80);
    _active.center = self.view.center;
    _active.tag = 100;
    [self.webView addSubview:_active];
   
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"将要开始连接请求");
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"已经开始加载请求");
    [_active startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"已经完成加载");
    [_active stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载出错");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
