//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import <UIKit/UIKit.h>
#import "HomePageScrollerModel.h"

@interface FirstPageHeaderViewController : UIViewController

@property (nonatomic, strong) HomePageScrollerModel *model;

- (void)configData;

@end
