//
//  LowestViewController.h
//  PoorTravel
//
//  Created by 周书阳 on 16/4/8.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LowestViewController : UIViewController
-(UIView*) errorView;
-(UIView*) loadingView;
-(void) showLoadingAnimated:(BOOL) animated;
-(void) hideLoadingViewAnimated:(BOOL) animated;
-(void) showErrorViewAnimated:(BOOL) animated;
-(void) hideErrorViewAnimated:(BOOL) animated;
@end
