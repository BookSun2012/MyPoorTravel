//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.
#import "BaseViewController.h"
#import "IdeaDetailModel.h"
#import "CaculateDate.h"
@interface JinNangDetailViewController : BaseViewController

@property (nonatomic, strong) UITableView *tabView;

@property (nonatomic, strong) NSMutableArray *sourceArray;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) IdeaDeatilData *model;


- (void)loadData;
@end
