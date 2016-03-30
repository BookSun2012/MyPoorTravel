//
//  HotCityCell.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"
@interface HotCityCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *boomImage;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet UILabel *cnname;
@property (weak, nonatomic) IBOutlet UILabel *enname;


- (void)configerData:(Hot_CountryModel *)model;

@end
