//
//  ViewController.m
//  点击手势
//
//  Created by 陈 海涛 on 13-5-29.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITapGestureRecognizer *tapGestureRecognizer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTaps:)];
    self.tapGestureRecognizer.numberOfTouchesRequired = 1;//点击手指数量
    self.tapGestureRecognizer.numberOfTapsRequired = 3;//点击次数
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    
}

-(void)handleTaps:(UITapGestureRecognizer *)sender
{
    NSUInteger touchCenter = 0;
    for (touchCenter = 0; touchCenter < sender.numberOfTouchesRequired; touchCenter++) {
        CGPoint touchPoint = [sender locationOfTouch:touchCenter inView:sender.view];
        NSLog(@"Touch #%lu : %@",(unsigned long)touchCenter+1,NSStringFromCGPoint(touchPoint));
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.tapGestureRecognizer = nil;
    }
}

@end




























