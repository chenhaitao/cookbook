//
//  ThreeViewController.m
//  CustomNavigationItemDemo
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

-(void)segmentedContolTapped:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"UP");
    }else if(sender.selectedSegmentIndex == 1){
        NSLog(@"DOWN");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"three Controller";
    
    NSArray *items = [NSArray arrayWithObjects:[UIImage imageNamed:@"UpArrow"],[UIImage imageNamed:@"DownArrow"], nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.momentary = YES;
    
    [segmentedControl addTarget:self action:@selector(segmentedContolTapped:) forControlEvents:UIControlEventValueChanged];
    
   // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:segmentedControl] animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end















