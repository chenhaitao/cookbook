//
//  ViewController.m
//  UISliderDemo
//
//  Created by 陈 海涛 on 13-5-16.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mySlider;

-(void)sliderValueChanged:(UISlider *)sender
{
    if ([sender isEqual:self.mySlider]) {
        NSLog(@"New value = %f",sender.value);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 23.0f)];
    self.mySlider.center = self.view.center;
    
    self.mySlider.minimumValue = 0.0f;
    self.mySlider.maximumValue = 100.0f;
    self.mySlider.continuous = NO;//默认情况为YES，默认情况thumb滑动时会连续调用slider的回调方法
    
    self.mySlider.value = self.mySlider.maximumValue /2.0;
    [self.view addSubview:self.mySlider];
    
    [self.mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    //自定义UISlider
    //正常状态的thumb，即用户没有点击thumb
    [self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbNormal"] forState:UIControlStateNormal];
    //选中状态的thumb，即用户点击thumb时显示的图片
    [self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbHighlighted"] forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
















































