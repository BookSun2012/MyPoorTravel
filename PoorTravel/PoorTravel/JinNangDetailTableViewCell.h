//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import <UIKit/UIKit.h>
#import "IdeaDetailModel.h"

@interface JinNangDetailTableViewCell : UITableViewCell

@property (nonatomic, strong) IdeaDetailMobileGuides *mobile;



- (void)configData:(IdeaDetailRelated_Guides*)model;

@end
