//
//  ViewController.m
//  GeocoderDemo
//
//  Created by 陈 海涛 on 13-5-28.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myGeocoder;

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:+38.4112810
                                                      longitude:-122.8409780f];
    self.myGeocoder = [CLGeocoder new];
    [self.myGeocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks,NSError *error){
        if (placemarks.count) {
            CLPlacemark *placemark = [placemarks lastObject];
            NSLog(@"%@,%@,%@",placemark.country,placemark.postalCode,placemark.locality);
        }else{
            NSLog(@"%@",[error localizedDescription]);
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end





























