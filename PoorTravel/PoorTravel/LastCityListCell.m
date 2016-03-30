//
//  LastCityListCell.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "LastCityListCell.h"

@implementation LastCityListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configerData:(LastCityModel *)model {
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:model.photo]];
    self.descriptionLanle.text = model.representative;
    self.priceLable.text   = model.beenstr;
    self.discontLable.text = model.catename;
}
@end
