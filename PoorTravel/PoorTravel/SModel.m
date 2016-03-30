//
//  SModel.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "SModel.h"

@implementation SModel

@end
@implementation DataModel1
//
//+ (NSDictionary *)objectClassInArray{
//    return @{@"hot_mguide" : [Hot_MguideModel1 class], @"new_discount" : [New_DiscountModel1 class], @"hot_city" : [Hot_CityModel1 class]};
//}



+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
   @"new_discount":@"appnew_discount"
                                                       }];
}
@end


@implementation Hot_MguideModel1

@end


@implementation New_DiscountModel1

@end


@implementation Hot_CityModel1

@end


