//
//  NextViewController.m
//  UIScrollViewDemo
//
//  Created by 陈 海涛 on 13-5-22.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController
@synthesize myScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    UIImage *iphone = [UIImage imageNamed:@"iphone"];
    UIImage *ipad = [UIImage imageNamed:@"ipad"];
    UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir"];
    
    CGRect scrollViewRect = self.view.bounds;
    self.myScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.contentSize = CGSizeMake(scrollViewRect.size.width *3.0f, scrollViewRect.size.height);
    [self.view addSubview:self.myScrollView];
    
    CGRect imageViewRect = self.view.bounds;
    UIImageView *iPhoneImageView = [[UIImageView alloc] initWithFrame:imageViewRect];
    iPhoneImageView.image = iphone;
    iPhoneImageView.contentMode =  UIViewContentModeScaleAspectFit;
    [self.myScrollView addSubview:iPhoneImageView];
    
    imageViewRect.origin.x +=imageViewRect.size.width;
    UIImageView *iPadImageView = [[UIImageView alloc] initWithFrame:imageViewRect];
    iPadImageView.image = ipad;
    iPadImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.myScrollView addSubview:iPadImageView];
    
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *macBookAirImageView = [[UIImageView alloc] initWithFrame:imageViewRect];
    macBookAirImageView.image = macBookAir;
    macBookAirImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.myScrollView addSubview:macBookAirImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end


























