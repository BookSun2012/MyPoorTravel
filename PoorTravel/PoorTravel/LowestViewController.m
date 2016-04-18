//
//  LowestViewController.m
//  PoorTravel
//
//  Created by 周书阳 on 16/4/8.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "LowestViewController.h"

@interface LowestViewController ()

@end

@implementation LowestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView*) errorView {
    
    return nil;
}

-(UIView*) loadingView {
    
    return nil;
}

-(void) showLoadingAnimated:(BOOL) animated {
    
    UIView *loadingView = [self loadingView];
    loadingView.alpha = 0.0f;
    [self.view addSubview:loadingView];
    [self.view bringSubviewToFront:loadingView];
    
    double duration = animated ? 0.4f:0.0f;
    [UIView animateWithDuration:duration animations:^{
        loadingView.alpha = 1.0f;
    }];
}

-(void) hideLoadingViewAnimated:(BOOL) animated {
    
    UIView *loadingView = [self loadingView];
    
    double duration = animated ? 0.4f:0.0f;
    [UIView animateWithDuration:duration animations:^{
        loadingView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [loadingView removeFromSuperview];
    }];
}

-(void) showErrorViewAnimated:(BOOL) animated {
    
    UIView *errorView = [self errorView];
    errorView.alpha = 0.0f;
    [self.view addSubview:errorView];
    [self.view bringSubviewToFront:errorView];
    
    double duration = animated ? 0.4f:0.0f;
    [UIView animateWithDuration:duration animations:^{
        errorView.alpha = 1.0f;
    }];
}

-(void) hideErrorViewAnimated:(BOOL) animated {
    
    UIView *errorView = [self errorView];
    
    double duration = animated ? 0.4f:0.0f;
    [UIView animateWithDuration:duration animations:^{
        errorView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [errorView removeFromSuperview];
    }];
}

@end
