//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import <UIKit/UIKit.h>
#import "IdeaDetailModel.h"
@interface TableHeaderView : UIView

@property (nonatomic, strong) IdeaDetailModel *model;

@property (nonatomic, strong) IdeaDetailAuthors *author;

@property (nonatomic) CGFloat Heigh;

- (void)configData;

@end
