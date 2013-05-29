//
//  ViewController.m
//  长按手势
//
//  Created by 陈 海涛 on 13-5-29.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UILongPressGestureRecognizer *longPressGestureRecognizer;
@property (nonatomic,strong) UIButton *dummyButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    self.dummyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.dummyButton.frame = CGRectMake(0.0f, 0.0f, 72.0f, 37.0f);
    self.dummyButton.center = self.view.center;
    [self.view addSubview:self.dummyButton];
    
    self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc]  initWithTarget:self action:@selector(handleLongPresssGestures:)];
    
    self.longPressGestureRecognizer.numberOfTouchesRequired = 1;
    self.longPressGestureRecognizer.allowableMovement = 100.0f;
    self.longPressGestureRecognizer.minimumPressDuration = 1.0;
    
    [self.view addGestureRecognizer:self.longPressGestureRecognizer];
    
}

-(void)handleLongPresssGestures:(UILongPressGestureRecognizer *)sender
{
    if ([sender isEqual:self.longPressGestureRecognizer]) {
        if (sender.numberOfTouchesRequired == 1) {
            CGPoint touchPoint1 = [sender locationOfTouch:0 inView:sender.view];
            self.dummyButton.center = touchPoint1;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.longPressGestureRecognizer = nil;
        self.dummyButton = nil;
    }
}

@end





















