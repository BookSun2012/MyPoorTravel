//

//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "CommonModel.h"

@class DiscountData,DiscountLastminutes;
@interface DiscountModel : CommonModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) DiscountData *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *ra_referer;

@end
@interface DiscountData : CommonModel

@property (nonatomic, copy) NSString *orderName;

@property (nonatomic, copy) NSString *sequence;

@property (nonatomic, copy) NSString *kw;

@property (nonatomic, strong) NSArray *recommend;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *is_ra;

@property (nonatomic, copy) NSString *orderValue;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSArray<DiscountLastminutes *> *lastminutes;

@property (nonatomic, copy) NSString *trace_switch;

@end

@interface DiscountLastminutes : CommonModel

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *departureTime;

@property (nonatomic, copy) NSString *productType;

@property (nonatomic, copy) NSString *booktype;

@property (nonatomic, assign) NSInteger first_pub;

@property (nonatomic, copy) NSString *end_date;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *lastminute_des;

@property (nonatomic, copy) NSString *buy_price;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger self_use;

@property (nonatomic, assign) NSInteger perperty_today_new;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *sale_count;

@property (nonatomic, copy) NSString *firstpay_end_time;

@property (nonatomic, copy) NSString *list_price;

@end

