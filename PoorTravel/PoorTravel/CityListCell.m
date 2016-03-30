//
//  CityListCell.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "CityListCell.h"

@implementation CityListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configerData:(New_DiscountModel1 *)model {

    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:model.photo]];
    self.descriptionLable.text = model.title;
    self.disCountLable.text    = model.priceoff;
    
    
    NSScanner *sc = [NSScanner scannerWithString:model.price];
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSString *temp = @"";
    NSMutableString *number = [NSMutableString string];
    while (![sc isAtEnd]) {
        [sc scanUpToCharactersFromSet:set intoString:NULL];
        [sc scanCharactersFromSet:set intoString:&temp];
        [number appendString:temp];
        temp = @"";
    }

    self.priceLable.text= [NSString stringWithFormat:@"%@元起 ",number];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
