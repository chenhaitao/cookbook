//
//  ViewController.m
//  UIImageViewDemo
//
//  Created by 陈 海涛 on 13-5-22.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
	UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir"];
    self.myImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.myImageView.image = macBookAir;
    /*
     typedef NS_ENUM(NSInteger, UIViewContentMode) {
     UIViewContentModeScaleToFill,          //这个值会将图片视图里的图片将图片视图填满。
     UIViewContentModeScaleAspectFit,      // 这个值会确保图片视图里的图片有正确的长宽比,并且会确保图片适应图片视图的边界。
     UIViewContentModeScaleAspectFill,     // 这个值会确保说图片视图里的图片有正确的长宽比,并且使图片充满整个图片视图的边界。为了能使这个 值正常工作,,确保将 clipsToBounds 这个属性值设置为YES。
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     };
     */
    self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.myImageView.center = self.view.center;
    [self.view addSubview:self.myImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
