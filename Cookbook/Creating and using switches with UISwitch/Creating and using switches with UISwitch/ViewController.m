//
//  ViewController.m
//  Creating and using switches with UISwitch
//
//  Created by 陈 海涛 on 13-5-15.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mySwitch;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    self.mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    [self.view addSubview:self.mySwitch];
  //  [self.mySwitch setOn:YES];
    [self.mySwitch setOn:YES animated:YES];//启用动画设置switch的状态
    
    //UISwitch常用API
    if ([self.mySwitch isOn]) {
        NSLog(@"The switch is on");
    }else{
        NSLog(@"The switch is off");
    }
    
    [self.mySwitch addTarget:self action:@selector(switchIsChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void)switchIsChanged:(UISwitch *)sender
{
    NSLog(@"sender is %@",sender);
    if ([sender isOn]) {
        NSLog(@"The Switch is turned on");
    }else{
        NSLog(@"The Switch is turned off");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

































