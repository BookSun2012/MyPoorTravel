//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "DiscountCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface DiscountCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *discountlable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;


@end
@implementation DiscountCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configData:(DiscountLastminutes*)model {

    [self.pictureImageView sd_setImageWithURL:[NSURL URLWithString:model.pic]];

    self.contentLable.text = model.title;
    
    self.startTimeLable.text = [NSString stringWithFormat:@"🐰 %@",model.departureTime];
    
    self.discountlable.text = model.lastminute_des;
    
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
   
   
   
    self.priceLable.text = [NSString stringWithFormat:@"%@元起",number];
}


@end
