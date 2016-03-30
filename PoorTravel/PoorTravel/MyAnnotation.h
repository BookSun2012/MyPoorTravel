//
//  MyAnnotation.h
//  06MKMapViewCustom
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotation : NSObject<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
// nullable 可以为空
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;

//可以用固定左边的图片
@property (nonatomic,copy,nullable)UIImage *image;
//可以用大头针的图片
@property (nonatomic,copy,nullable)UIImage *pinImage;
//可以用图片的网址
@property (nonatomic,copy,nullable)NSString *imageUrlStr;


@end
