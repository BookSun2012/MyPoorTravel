//
//  CityListCell.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SModel.h"
#import "UIImageView+WebCache.h"
@interface CityListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLable;
@property (weak, nonatomic) IBOutlet UILabel *disCountLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
- (void)configerData:(New_DiscountModel1 *)model;
@end
