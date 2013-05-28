//
//  ViewController.m
//  滑动手势
//
//  Created by 陈 海涛 on 13-5-28.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UISwipeGestureRecognizer *swipeGestureRecognizer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(handleSwipes:)];
    //UISwipeGestureRecognizerDirectionLeft;从右往左滑动 一般指定一个方向
    self.swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.swipeGestureRecognizer.numberOfTouchesRequired = 1;//只需要一个手指滑动
    [self.view addGestureRecognizer:self.swipeGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.swipeGestureRecognizer = nil;
    }
}
-(void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction & UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"swipe down");
    }
    if (sender.direction & UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe left");
    }
    if (sender.direction & UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe right");
    }
    if (sender.direction & UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
    }
}



@end























