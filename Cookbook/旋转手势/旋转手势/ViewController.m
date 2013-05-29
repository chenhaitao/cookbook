//
//  ViewController.m
//  旋转手势
//
//  Created by 陈 海涛 on 13-5-28.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UILabel *helloWorldLabel;
@property (nonatomic,strong) UIRotationGestureRecognizer *rotationGestureRecognizer;
@property (nonatomic,unsafe_unretained) CGFloat rotationAngleInRadians;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    self.helloWorldLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.helloWorldLabel.text = @"Hello World";
    self.helloWorldLabel.font = [UIFont systemFontOfSize:16.0f];
    [self.helloWorldLabel sizeToFit];
    self.helloWorldLabel.textColor = [UIColor redColor];
    self.helloWorldLabel.center = self.view.center;
    [self.view addSubview:self.helloWorldLabel];
    
    self.rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc]  initWithTarget:self action:@selector(handleRotations:)];
    [self.view addGestureRecognizer:self.rotationGestureRecognizer];
}

-(void)handleRotations:(UIRotationGestureRecognizer *)sender
{
    if (self.helloWorldLabel == nil) {
        return;
    }
    self.helloWorldLabel.transform = CGAffineTransformMakeRotation(self.rotationAngleInRadians + sender.rotation);
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.rotationAngleInRadians += sender.rotation;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.helloWorldLabel = nil;
        self.rotationGestureRecognizer = nil;
    }
}

@end
