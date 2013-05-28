//
//  NextViewController.m
//  GeocoderDemo
//
//  Created by 陈 海涛 on 13-5-28.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "NextViewController.h"
#import  <CoreLocation/CoreLocation.h>

@interface NextViewController()
@property (nonatomic,strong)CLGeocoder *myGeocoder;
@end

@implementation NextViewController
@synthesize myGeocoder;

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSString *address = @"1005 Gravenstein Highway North, Sebastopol, CA 95472, USA";
    
    self.myGeocoder = [CLGeocoder new];
    [self.myGeocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks,NSError *error){
        if (placemarks.count && error == nil) {
            CLPlacemark *placemark = [placemarks lastObject];
            NSLog(@"(%f,%f)",placemark.location.coordinate.longitude,placemark.location.coordinate.latitude);
        }else{
            NSLog(@"%@",[error localizedDescription]);
        }
    }];
}

@end
