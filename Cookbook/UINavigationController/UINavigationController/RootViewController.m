//
//  RootViewController.m
//  UINavigationController
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize secondViewController;

-(void)pushSecondController
{
    if (!self.secondViewController) {
        self.secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    }
    [self.navigationController pushViewController:self.secondViewController animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(pushSecondController) withObject:nil afterDelay:5.0f];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"First Controller";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

























