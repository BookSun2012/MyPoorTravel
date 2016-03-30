//
//  CustomMyAnnotionView.h
//  06MKMapViewCustom
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MyAnnotation.h"//类似TableViewCell 中的Model
@interface CustomMyAnnotionView : MKAnnotationView

//用类方法 去初始化对象
+(instancetype)myAnnotationView:(MKMapView*)mapView;

//配置大头针上面的数据
- (void)configerData:(MyAnnotation *)myAnnotation;
@end
