//
//  LoginViewController.m
//  PoorTravel
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "LoginViewController.h"
#import "ZSY_Factory.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:[ZSY_Factory buttonWithFrame:CGRectMake(10, 20, 50, 30) Type:UIButtonTypeCustom Title:@"返回" fontSize:20 titleColor:[UIColor redColor] bgColor:[UIColor orangeColor] target:self selector:@selector(dismiss:) layer:3 tag:100 supperView:self.view]];
    
}
- (void)dismiss:(UIButton *)butn {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
