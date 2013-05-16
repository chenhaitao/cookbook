//
//  ViewController.m
//  UISegmentControlDemo
//
//  Created by 陈 海涛 on 13-5-16.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mySegmentedControl;

-(void)segmentControlChagned:(UISegmentedControl *)sender
{
    if ([sender isEqual:self.mySegmentedControl]) {
        NSInteger selectedSegmentIndex = [sender selectedSegmentIndex];
        NSString *selectedSegmentText = [sender titleForSegmentAtIndex:selectedSegmentIndex];
        NSLog(@"segment %ld with %@ text is selected",(long)selectedSegmentIndex,selectedSegmentText);
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *segments = [[NSArray alloc] initWithObjects:@"iphone",@"ipad",@"ipod",@"imac", nil];
    self.mySegmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
    self.mySegmentedControl.center = self.view.center;
    [self.view addSubview:self.mySegmentedControl];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end






































