//
//  HotTravelTabView.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotNoteTravelModel.h"
typedef void (^eventBlock)(NSURL *url);

@interface HotTravelTabView : UITableView

@property (nonatomic, copy) eventBlock block;

- (void)referch;

- (void)setBlock:(eventBlock)block;

@end
