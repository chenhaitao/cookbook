//
//  SecondViewController.m
//  CustomNavigationItemDemo
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "SecondViewController.h"
#import "ThreeViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)switchIsChanged:(UISwitch*)sender
{
    if (sender.isOn) {
        NSLog(@"Swtich is on");
        ThreeViewController *threeViewController = [[ThreeViewController alloc] initWithNibName:nil bundle:nil ];
        [self.navigationController pushViewController:threeViewController animated:YES];
    }else{
        NSLog(@"Swtich is off");
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.title = @"Second Controller";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISwitch *simpleSwitch = [[UISwitch alloc] init];
    simpleSwitch.on = YES;
    [simpleSwitch addTarget:self action:@selector(switchIsChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    //initWithCustomView:(UIView *)view 由于这个方法，可以接受任何视图类对象作为rightBarButtonItem的显示内容
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:simpleSwitch];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end





















