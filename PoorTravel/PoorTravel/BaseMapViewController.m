
//
//  BaseMapViewController.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "BaseMapViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotion.h"
#import "MyAnnotionView.h"
@interface BaseMapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic, strong) CLLocationManager *manager;

@property (nonatomic, strong) MKMapView *mapView;


@end

@implementation BaseMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUserLocation];
    // Do any additional setup after loading the view.
}

- (void)updateUserLocation {

    _manager = [[CLLocationManager alloc] init];
    _manager.distanceFilter = 1000;
    _manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    _manager.delegate = self;
    if ([_manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        
        [_manager requestWhenInUseAuthorization];
    }
    
    [_manager startUpdatingHeading];
}

//获取用户当前的位置信息
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation  *location = [locations lastObject];

   // CLLocationCoordinate2D cor = location.coordinate;
    
    
    CLGeocoder *gcoder = [[CLGeocoder alloc] init];
    
    [gcoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *place = [placemarks lastObject];
    }];
}

//创建地图

- (void)loadMapView {

    _mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    _mapView.mapType = MKMapTypeStandard;
    _mapView.showsUserLocation = YES;
    
    _mapView.userTrackingMode = MKUserTrackingModeFollow;

    _mapView.delegate = self;
    
    [self.view addSubview:_mapView];
}
//自定义大头针视图
- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    MyAnnotionView *view = [MyAnnotionView myAnnotionView:mapView];
    [view configData:annotation];
    
    return view;
}

- (void)searchInfo:(NSString*)title {

    [_mapView removeAnnotations:_mapView.annotations];

    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = title;
    request.region = MKCoordinateRegionMake(_mapView.userLocation.coordinate, MKCoordinateSpanMake(0.02, 0.02));
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
