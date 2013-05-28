//
//  ViewController.h
//  createAMap
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>

@property (nonatomic,strong) MKMapView *myMapView;

@property (nonatomic,strong) CLLocationManager *myLocationManager;

@property (nonatomic,strong) MyAnnotation *myAnnotation;
@end
