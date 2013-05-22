//
//  ViewController.m
//  UIButtonDemo
//
//  Created by 陈 海涛 on 13-5-22.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myButton;

-(void)buttonIsPressed:(UIButton *)sender
{
    NSLog(@"button is pressed");
}

-(void)buttonIsTapped:(UIButton *)sender
{
    NSLog(@"button is tapped");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //UIButton默认高度为37
    self.myButton.frame = CGRectMake(11.0f, 200.0f, 100.0f, 37.0f);
    
    [self.myButton setTitle:@"press me" forState:UIControlStateNormal];
    [self.myButton setTitle:@"i'm pressed" forState:UIControlStateHighlighted];
    
    [self.myButton addTarget:self action:@selector(buttonIsPressed:) forControlEvents:UIControlEventTouchDown];
    [self.myButton addTarget:self action:@selector(buttonIsTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.myButton];
    
    
    //一个按钮也可以提供一个图片。图片将会被改变按钮默认的外观。当你要给不同状态下按钮定义不同的图 片时,要确保你的按钮是属于 UIBttonTypeCustom 类型的。
    UIImage *normalImage = [UIImage imageNamed:@"NormalBlueButton"];
    UIImage *highlightedImage = [UIImage imageNamed:@"HighlightedBlueButton"];
    self.myCustomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.myCustomButton.frame = CGRectMake(110.0f, 200.0f, 100.0f, 37.0f);
    
    [self.myCustomButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self.myCustomButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [self.myCustomButton setTitle:@"Normal" forState:UIControlStateNormal];
    [self.myCustomButton setTitle:@"Highlighted" forState:UIControlStateHighlighted];
    
    //如果图片上已经包含了title，就可以使用下列api
    //self.myCustomButton setImage:<#(UIImage *)#> forState:<#(UIControlState)#>
    
    [self.view addSubview:self.myCustomButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
