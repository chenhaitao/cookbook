//
//  ViewController.m
//  createAMap
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myMapView;
@synthesize myLocationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.myMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    
    /*
     enum {
     MKMapTypeStandard = 0, 标准地图
     MKMapTypeSatellite,    卫星图
     MKMapTypeHybrid        混合地图
     };
     */
    self.myMapView.mapType = MKMapTypeSatellite;
    
    self.myMapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.myMapView.delegate = self;
    [self.view addSubview:self.myMapView];
    
    
    if ([CLLocationManager locationServicesEnabled]) {
        self.myLocationManager = [CLLocationManager new];
        self.myLocationManager.delegate = self;
        
       // self.myLocationManager.purpose = @".....";
        
        [self.myLocationManager startUpdatingLocation];
    }else{
        NSLog(@"Location service are not enabled ");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.myMapView = nil;
        [self.myLocationManager stopUpdatingLocation];
        self.myLocationManager = nil;
    }
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *result = nil;
    if (![annotation isKindOfClass:[MyAnnotation class]]) {
        return result;
    }
    if (![myMapView isEqual:self.myMapView]) {
        return  result;
    }
    
    MyAnnotation *myAnnotation = (MyAnnotation *)annotation;
    NSString *pinReusableIdentifier = [MyAnnotation reusableIdentifierForPinColor:myAnnotation.pinColor];
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinReusableIdentifier];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:pinReusableIdentifier];
        [annotationView setCanShowCallout:YES];
    }
    annotationView.pinColor = myAnnotation.pinColor;
    result = annotationView;
    return result;
}

#pragma mark -
#pragma mark MKMapViewDelegate methods
/*
 mapViewWillStartLoadingMap:    这个方法是当地图界面将要加载的时候会调用。
 
 mapView:viewForAnnotation: 这个方法是当地图上有一些动画效果 展示或者加载的时候会调用这个方法。
 
 mapViewWillStartLocatingUser:这个方法是准备进行一个位置定位的时候会调用的方法。
 
 mapView:regionDidChangeAnimated:这个方法调用,一般是当用户的地理位置发生变化的时候会调用。
*/


#pragma mark -
#pragma mark CLLocationManagerDelegate methods
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSTimeInterval  eventInterval = [location.timestamp timeIntervalSinceNow];
    if (abs(eventInterval) < 30.0) {
        if (location.horizontalAccuracy < 0) {
            return;
        }
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
        self.myAnnotation =  [[MyAnnotation alloc] initWithCoordinates:coordinate title:@"title" subtitle:@"subtitle"];
        self.myAnnotation.pinColor = MKPinAnnotationColorPurple;
        [self.myMapView addAnnotation:self.myAnnotation];
    }
    
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"fial to location");
}



















@end
