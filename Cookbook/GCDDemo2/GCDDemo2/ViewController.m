//
//  ViewController.m
//  GCDDemo2
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)reloadTableView
{
    NSLog(@"1");
}
-(void)reloadScrollView
{
    NSLog(@"2");
}
-(void)reloadBottomView
{
    NSLog(@"3");
}

-(void)reloadView
{
    dispatch_group_t taskGroup = dispatch_group_create();
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_group_async(taskGroup, mainQueue, ^{
        [self reloadTableView];
    });
    dispatch_group_async(taskGroup, mainQueue, ^{
        [self reloadScrollView];
    });
    
    dispatch_group_async(taskGroup, mainQueue, ^{
        [self reloadBottomView];
    });
    
    dispatch_group_notify(taskGroup, mainQueue, ^{
        [[[UIAlertView alloc] initWithTitle:nil message:@"all task are finished" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
    });
    
  //  dispatch_release(taskGroup);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self reloadView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
