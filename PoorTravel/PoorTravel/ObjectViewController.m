//
//  ObjectViewController.m
//  PoorTravel
//
//  Created by 周书阳 on 16/4/6.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "ObjectViewController.h"

@interface ObjectViewController ()
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@end

@implementation ObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatWebView];
    
}
- (void)creatWebView {
    _webView  = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-114)];
    [self.view addSubview:_webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_webUrl]];
    [_webView loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
