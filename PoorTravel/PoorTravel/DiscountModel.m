//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "DiscountModel.h"

@implementation DiscountModel

@end
@implementation DiscountData

+ (NSDictionary *)objectClassInArray{
    return @{@"lastminutes" : [DiscountLastminutes class]};
}

@end


@implementation DiscountLastminutes

@end


