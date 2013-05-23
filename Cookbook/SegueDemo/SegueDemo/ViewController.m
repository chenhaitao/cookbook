//
//  ViewController.m
//  SegueDemo
//
//  Created by 陈 海涛 on 13-5-23.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *myButton;
@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Source Controller = %@",[segue sourceViewController]);
    NSLog(@"Destination Controller = %@",[segue destinationViewController]);
    NSLog(@"Segue identifier = %@",[segue identifier]);
    
    if ([segue.identifier isEqual:@"showAView"]) {
       //............
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.myButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [self.myButton addTarget:self action:@selector(showAView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.myButton];
}

-(void)showAView:(id)sender
{
    [self performSegueWithIdentifier:@"showAView" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.myButton = nil;
    }
}

@end
