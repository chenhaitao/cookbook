//
//  SecondViewController.m
//  UINavigationController
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)goback
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(goback) withObject:nil afterDelay:5.0f];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Second Controller";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
