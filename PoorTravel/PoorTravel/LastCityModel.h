//
//  LastCityModel.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "JSONModel.h"

@interface LastCityModel : JSONModel
/*
 "id": "50",
 "catename": "香港",
 "catename_en": "Hong Kong",
 "photo": "http://pic.qyer.com/album/user/370/89/Qk5VShMOaA/index/339x226",
 "lat": "22.396427",
 "lng": "114.109497",
 "ishot": true,
 "beennumber": "181915",
 "beenstr": "181915人去过",
 "representative": "星光大道,太平山山顶,香港海洋公园,香港迪士尼乐园,金紫荆广场",
 "isguide": true
 */

@property  (nonatomic,copy)NSString *id;
@property (nonatomic,copy)NSString *catename;
@property  (nonatomic,copy)NSString *catename_en;
@property (nonatomic,copy)NSString *photo;
@property  (nonatomic,copy)NSString *beenstr;
@property (nonatomic,copy)NSString *beennumber;
@property  (nonatomic,copy)NSString *representative;
@property (nonatomic,copy)NSString *isguide;
@property  (nonatomic,copy)NSString *lat;
@property (nonatomic,copy)NSString *lng;
@end
