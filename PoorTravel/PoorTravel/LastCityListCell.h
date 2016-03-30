//
//  LastCityListCell.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LastCityModel.h"
#import "UIImageView+WebCache.h"
@interface LastCityListCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLanle;
@property (weak, nonatomic) IBOutlet UILabel *discontLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
- (void)configerData:(LastCityModel *)model;
@end
