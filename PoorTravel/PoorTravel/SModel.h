//
//  SModel.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "JSONModel.h"

@protocol DataModel1
@end

@protocol Hot_MguideModel1
@end

@protocol New_DiscountModel1
@end

@protocol Hot_CityModel1
@end

@interface Hot_CityModel1 : JSONModel

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *enname;

@property (nonatomic, copy) NSString *photo;

@end

@interface New_DiscountModel1 : JSONModel

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *priceoff;

@property (nonatomic, copy) NSString *expire_date;

@end

@interface Hot_MguideModel1 : JSONModel

@property (nonatomic, copy) NSString *username;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger user_id;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *avatar;

@end

@interface DataModel1 : JSONModel

@property (nonatomic, copy) NSString *id;

@property (nonatomic, assign) BOOL has_guide;

@property (nonatomic, assign) BOOL has_trip;

@property (nonatomic, strong) NSArray<Hot_CityModel1> *hot_city;

@property (nonatomic, strong) NSArray<Hot_MguideModel1> *hot_mguide;

@property (nonatomic, strong) NSArray<New_DiscountModel1> *appnew_discount;

@property (nonatomic, copy) NSString *enname;

@property (nonatomic, assign) NSInteger planto;

@property (nonatomic, copy) NSString *entryCont;

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, copy) NSString *overview_url;

@property (nonatomic, assign) NSInteger beento;

@property (nonatomic, strong) NSArray<NSString *> *photos;

@property (nonatomic, assign) BOOL has_plan;

@end


@interface SModel : JSONModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) DataModel1 *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *ra_referer;

@end








