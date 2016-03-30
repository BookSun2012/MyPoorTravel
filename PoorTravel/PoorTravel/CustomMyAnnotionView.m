//
//  CustomMyAnnotionView.m
//  06MKMapViewCustom
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "CustomMyAnnotionView.h"

@implementation CustomMyAnnotionView

//用类方法 初始化对象
+(instancetype)myAnnotationView:(MKMapView *)mapView {
    //先去检查复用队列里面有没有可用的大头针视图
    CustomMyAnnotionView *anView = (CustomMyAnnotionView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"id"];
    //如果不存在 就去创建
    if (!anView) {
        anView = [[CustomMyAnnotionView alloc]initWithAnnotation:nil reuseIdentifier:@"id"];
        //显示提示视图
        anView.canShowCallout = YES;
        //在这里可以定制左右视图 (格式比较固定的视图 可以在这里定制)
    }
    return anView;

}

//
- (void)configerData:(MyAnnotation *)myAnnotation {
    self.annotation = myAnnotation;
    //需要自定义视图的话(图片不是固定的,比如店铺的照片)
    self.leftCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"location"]];
    //设置大头针的图片
    self.image = myAnnotation.image;
    
}



@end
