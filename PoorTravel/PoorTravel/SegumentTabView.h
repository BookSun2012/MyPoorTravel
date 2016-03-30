//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import <UIKit/UIKit.h>
#import "CategoryModel.h"


typedef void (^thingBlock)(NSMutableArray *arr,UITableView *tabView);

@interface SegumentTabView : UITableView


@property (nonatomic, strong) CategoryModel *model;


@property (nonatomic, strong) NSMutableArray *ticket;

@property (nonatomic, strong) NSMutableArray *stopRegion;

@property (nonatomic, strong) NSMutableArray *startRegion;

@property (nonatomic, strong) NSMutableArray *time;

@property (nonatomic, strong) NSMutableArray *sourceArray;


@property (nonatomic, strong) thingBlock block;


- (void)setBlock:(thingBlock)block;
@end
