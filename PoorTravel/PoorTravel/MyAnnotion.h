//
//  MyAnnotion.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotion : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, readonly, copy, nullable) NSString *title;
@property (nonatomic, readonly, copy, nullable) NSString *subtitle;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, strong) UIImage *pinImage;

@end
