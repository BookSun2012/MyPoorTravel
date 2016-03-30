//
//  MyAnnotionView.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "MyAnnotion.h"
@interface MyAnnotionView : MKAnnotationView

+ (instancetype)myAnnotionView:(MKMapView*)mapView;

- (void)configData:(MyAnnotion*)myAnnotion;


@end
