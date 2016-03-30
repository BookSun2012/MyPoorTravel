//
//  MyAnnotionView.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "MyAnnotionView.h"

@implementation MyAnnotionView


+ (instancetype)myAnnotionView:(MKMapView*)mapView {

    MyAnnotionView *view = (MyAnnotionView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"id"];
    
    if (!view) {
        view = [[MyAnnotionView alloc] initWithAnnotation:nil reuseIdentifier:@"id"];
        view.canShowCallout = YES;
    }
    return view;
}

- (void)configData:(MyAnnotion*)myAnnotion {
    
    self.annotation = myAnnotion;

    self.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    self.image = myAnnotion.image;

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
