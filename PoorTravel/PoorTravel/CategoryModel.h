//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.
#import "CommonModel.h"

@class CategoryData,CategoryTimes_Drange,CategoryFilter_Tags,CategoryType,CategoryDeparture,CategoryPoi,CategoryCountry;
@interface CategoryModel : CommonModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) CategoryData *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *trace_switch;

@property (nonatomic, copy) NSString *ra_referer;

@end
@interface CategoryData : CommonModel

@property (nonatomic, strong) NSArray<CategoryTimes_Drange *> *times_drange;

@property (nonatomic, strong) NSArray<CategoryFilter_Tags *> *filter_tags;

@property (nonatomic, strong) NSArray<CategoryType *> *type;

@property (nonatomic, strong) NSArray<CategoryDeparture *> *departure;

@property (nonatomic, strong) NSArray<CategoryPoi *> *poi;

@end

@interface CategoryTimes_Drange : CommonModel

@property (nonatomic, copy) NSString *times;

@property (nonatomic, copy) NSString *description;

@end

@interface CategoryFilter_Tags : CommonModel

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *description;

@end

@interface CategoryType : CommonModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *catename;

@end

@interface CategoryDeparture : CommonModel

@property (nonatomic, copy) NSString *city_des;

@property (nonatomic, copy) NSString *city;

@end

@interface CategoryPoi : CommonModel

@property (nonatomic, copy) NSString *continent_name;

@property (nonatomic, strong) NSArray<CategoryCountry *> *country;

@property (nonatomic, assign) NSInteger continent_id;

@end

@interface CategoryCountry : CommonModel

@property (nonatomic, copy) NSString *country_name;

@property (nonatomic, assign) NSInteger country_id;

@end

