//
//  ViewController.m
//  拖拽
//
//  Created by 陈 海涛 on 13-5-29.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic,strong) UILabel *helloWorldLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect labelFrame = CGRectMake(0.0f, 0.0f, 150.0f, 100.0f);
    self.helloWorldLabel = [[UILabel alloc]  initWithFrame:labelFrame];
    self.helloWorldLabel.text = @"Hello world";
    self.helloWorldLabel.backgroundColor = [UIColor blackColor];
    self.helloWorldLabel.textColor = [UIColor whiteColor];
    self.helloWorldLabel.textAlignment = NSTextAlignmentCenter;
	self.helloWorldLabel.userInteractionEnabled = YES;
    
    [self.view addSubview:self.helloWorldLabel];
    
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestures:)];
    self.panGestureRecognizer.minimumNumberOfTouches = 1;
    self.panGestureRecognizer.maximumNumberOfTouches = 1;
    
    [self.helloWorldLabel addGestureRecognizer:self.panGestureRecognizer];
    
}

-(void)handlePanGestures:(UIPanGestureRecognizer *)sender
{
    if (sender.state != UIGestureRecognizerStateEnded && sender.state != UIGestureRecognizerStateFailed) {
        CGPoint location = [sender locationInView:sender.view.superview];
        sender.view.center = location;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.panGestureRecognizer = nil;
        self.helloWorldLabel = nil;
    }
}

@end






















