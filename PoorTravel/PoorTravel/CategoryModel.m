//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "CategoryModel.h"

@implementation CategoryModel

@end
@implementation CategoryData

+ (NSDictionary *)objectClassInArray{
    return @{@"times_drange" : [CategoryTimes_Drange class], @"filter_tags" : [CategoryFilter_Tags class], @"type" : [CategoryType class], @"departure" : [CategoryDeparture class], @"poi" : [CategoryPoi class]};
}

@end


@implementation CategoryTimes_Drange

@synthesize description = _description;

@end


@implementation CategoryFilter_Tags

@end


@implementation CategoryType

@end


@implementation CategoryDeparture

@end


@implementation CategoryPoi

+ (NSDictionary *)objectClassInArray{
    return @{@"country" : [CategoryCountry class]};
}

@end


@implementation CategoryCountry

@end


