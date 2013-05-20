//
//  ViewController.m
//  UILabelDemo
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    CGRect labelFrame = CGRectMake(0.0f, 0.0f, 100.0f, 50.0f);
    self.myLabel = [[UILabel alloc]initWithFrame:labelFrame];
    //设置文本字体是否要减小来适应label的区域.只有当label的行数事1时有效.字体一直减小到你设置的最小字体值.
   // self.myLabel.adjustsFontSizeToFitWidth = YES;
    self.myLabel.text = @"ios 5 programming cookbook";
    self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    self.myLabel.center = self.view.center;
    //在不知道内容会显示多少行的情况下，将其设置为0，UILabel会根据内容的多少以适当的行来显示
    self.myLabel.numberOfLines = 0;
    
    
    [self.view addSubview:self.myLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
