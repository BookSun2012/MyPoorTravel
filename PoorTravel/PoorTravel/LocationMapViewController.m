//
//  LocationMapViewController.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "LocationMapViewController.h"
#import "HttpEngine.h"
#import "Define.h"
#import "LocalModel.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"
#import "CustomMyAnnotionView.h"

@interface LocationMapViewController ()<MKMapViewDelegate>
@property (nonatomic,strong)NSMutableArray *dataSouce;
//地图视图
@property (nonatomic,strong)MKMapView *mapView;
@property (nonatomic,strong)CLLocationManager *locationManager;
@end

@implementation LocationMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatMapView];
    //加载数据
    [self loadDataSouce];
    

    //创建返回按钮
    [self creatButnLocation];
    //授权
    [self creatLocaltionManager];

}
- (void)loadDataSouce {
    _dataSouce = [NSMutableArray array];
    HttpEngine *enger = [HttpEngine shareEngine];
    
    NSString *str = @"###";
    NSRange range = [mapURL rangeOfString:str];
    
    NSString *tureUrl = [mapURL stringByReplacingCharactersInRange:range withString:self.url];
    

    
    [enger GET:tureUrl parameters:nil success:^(id response) {
        NSLog(@"%@ ",response);
        NSError *error = nil;
        _dataSouce = [LocalModel arrayOfModelsFromDictionaries:response[@"data"] error:&error];
        NSLog(@"%ld",_dataSouce.count);
        //添加大头针
        [self addAnimation];
        [self travelLocation ];
    } failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)creatMapView {
    //创建一张地图视图  添加到View上面
    _mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    /*
     MKMapTypeStandard = 0,标准的地图
     MKMapTypeSatellite,卫星地图
     MKMapTypeHybrid,混合地图
     MKMapTypeSatelliteFlyover NS_ENUM_AVAILABLE(10_11, 9_0),
     MKMapTypeHybridFlyover NS_ENUM_AVAILABLE(10_11, 9_0),
     */
    _mapView.mapType =  MKMapTypeStandard;
    //设置代理
    self.mapView.delegate = self;
    //显示用户信息
    _mapView.showsUserLocation = YES;
    
    /*跟踪用户的位置
     MKUserTrackingModeNone = 0, // 不跟踪 the user's location is not followed
     MKUserTrackingModeFollow, //跟踪用户位置 the map follows the user's location
     MKUserTrackingModeFollowWithHeading,跟踪用户位置和方向 // the map follows the user's location and heading
     */
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    
    
    
    
    [self.view addSubview:_mapView];
    
    
}

//用户授权
- (void)creatLocaltionManager {
    _locationManager = [[CLLocationManager alloc]init];\
    //授权
    //    // 在iOS8之后，需要请求用户授权
    //    // [[[UIDevice currentDevice] systemVersion] floatValue] 获取系统当前的版本
    //判断要不要请求用户权限  除了判断系统版本号，还有一种方法是判断这个方法有没有响应
    //方法一 判断系统版本号
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f) {
        //1  一直定位
        // 需要在info.plist里增加这个key NSLocationAlwaysUsageDescription
//        [_locationManager requestAlwaysAuthorization];
        _locationManager.distanceFilter = 10000000;//精度
        //2 应用在启用的时候才允许定位
        // 需要在info.plist里增加这个key NSLocationWhenInUseUsageDescription
        [self.locationManager requestWhenInUseAuthorization];
    }
    [_locationManager requestAlwaysAuthorization];
    //方法二 判断这个方法有没有响应
    //    if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
    //        [_locationManager requestAlwaysAuthorization];
    //    }
}
#pragma mark- MKMapViewDelegate
//定位到用户位置的时候 会调用这个方法
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    //userLocation 用户的位置  就是地图上看到的小蓝点(大头针)
    //    userLocation.title = @"用户当前位置";
    //    userLocation.subtitle = @"详细位置";
    //    userLocation.location;
    //想要反地理编码
    CLGeocoder *reverseGeoCode = [[CLGeocoder alloc]init];
    [reverseGeoCode reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //没有找到位置
        if (placemarks.count || error) return ;
        CLPlacemark *pm = [placemarks lastObject];
        if (pm.locality) {
            userLocation.title = pm.locality;
        }else{
            //河南省
            userLocation.title = pm.administrativeArea;
        }
        //全部的地址信息
        userLocation.subtitle = pm.name;
        
        NSLog(@"%@ %@ %@",pm.locality,pm.name,pm.administrativeArea);
        
    }];
    
    
}

//增加一个按钮  点击返回当前位置
- (void)creatButnLocation {
    UIButton *butn = [UIButton buttonWithType:UIButtonTypeSystem];
    butn.frame = CGRectMake(330, 670, 50, 50);
    butn.layer.cornerRadius = 25;
    butn.backgroundColor =  [UIColor whiteColor];
    butn.clipsToBounds = YES;
    [butn setTitle:@"返回" forState:UIControlStateNormal];
    [butn addTarget:self action:@selector(back1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butn];
    
}
- (void)travelLocation {
    
    //MKCoordinateRegionMake 表示一个区域，一个区域的中心点，区域的宽度（跨度，经度的差值，纬度的差值）
    LocalModel *model = self.dataSouce[0];
    
    [_mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake([model.lat floatValue], [model.lng floatValue]), MKCoordinateSpanMake(3, 3)) animated:YES];
    
    
}
- (void)back1:(UIButton *)sender {
    
    //MKCoordinateRegionMake 表示一个区域，一个区域的中心点，区域的宽度（跨度，经度的差值，纬度的差值）
    
    [_mapView setRegion:MKCoordinateRegionMake(_mapView.userLocation.coordinate, MKCoordinateSpanMake(0.005, 0.005)) animated:YES];
    
    
}
//添加大头针

- (void)addAnimation {
    
    for (int i=0; i<self.dataSouce.count; i++) {
        if (i<10) {
            LocalModel *model = self.dataSouce[i];
            //创建自定义大头针
            MyAnnotation *an1 = [[MyAnnotation alloc]init];
            float lat = [model.lat floatValue];
            float lng = [model.lng floatValue];
            an1.coordinate = CLLocationCoordinate2DMake(lat,lng);
            an1.title = model.cnname;
            an1.image = [UIImage imageNamed:@"活动"];
            an1.subtitle = model.beenstr;
      
            [_mapView addAnnotation:(id)an1];
        }else {
            LocalModel *model = self.dataSouce[i];
            MyAnnotation *an1 = [[MyAnnotation alloc]init];
            float lat = [model.lat floatValue];
            float lng = [model.lng floatValue];
            an1.coordinate = CLLocationCoordinate2DMake(lat,lng);
            an1.title = model.cnname;
            an1.subtitle = model.beenstr;
            an1.image = [UIImage imageNamed:@"活动_Small"];
            [_mapView addAnnotation:(id)an1];
        }
        

    }
    
    
    
}

//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
//
//    //
//
//    MKAnnotationView *myAnnotation = [mapView dequeueReusableAnnotationViewWithIdentifier:@"id"];
//    if (!myAnnotation) {
//        myAnnotation = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"id"];
//      
//    }
//    //提供的可供定义的视图  左右视图
////    myAnnotation.leftCalloutAccessoryView;
////    myAnnotation.rightCalloutAccessoryView;
//    //大头针的图片
//    myAnnotation.image = [UIImage imageNamed:@"ic_user_footprint"];
//
////    //设置左右的视图
////    UIButton *leftView = [UIButton buttonWithType:UIButtonTypeContactAdd];
////    UIImageView *rightView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"location"]];
////    //添加弹出视图的左右边附加视图
////    myAnnotation.leftCalloutAccessoryView = leftView;
////    myAnnotation.rightCalloutAccessoryView = rightView;
////    //设置可以弹出子标题
////    myAnnotation.canShowCallout = YES;
//    return myAnnotation;
//
//
//
//}
//
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {

    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        
        return nil;
    }
    
    CustomMyAnnotionView *anView = [CustomMyAnnotionView myAnnotationView:mapView];
    NSLog(@"%@",NSStringFromClass([annotation class]));
    [anView configerData:(MyAnnotation*)annotation];
    return anView;



}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

    
}



@end
