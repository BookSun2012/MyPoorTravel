//
//  LocalModel.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "JSONModel.h"

@interface LocalModel : JSONModel
/*
 "id": "50",
 "cnname": "\u9999\u6e2f",
 "enname": "Hong Kong",
 "lat": "22.396427",
 "lng": "114.109497",
 "is_recommend": true,
 "planto": 0,
 "beento": 0,
 "beenstr": "182064\u4eba\u53bb\u8fc7",
 "photo": "http://pic4.qyer.com/album/user/370/89/Qk5V

 */

@property (nonatomic, copy) NSString *beenstr;

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, copy) NSString *enname;


@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *is_recommend;

@property (nonatomic, copy) NSString *lat;

@property (nonatomic, copy) NSString *lng;



@property (nonatomic, copy) NSString *photo;




@end
