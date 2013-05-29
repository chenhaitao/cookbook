//
//  ViewController.m
//  放大缩小手势
//
//  Created by 陈 海涛 on 13-5-29.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *myBlackLabel;
@property (nonatomic,unsafe_unretained)CGFloat currentScale;
@property (nonatomic,strong) UIPinchGestureRecognizer *pinchGestureRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect labelFrame = CGRectMake(0.0f, 0.0f, 200.0f, 200.0f);
    self.myBlackLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.myBlackLabel.center = self.view.center;
    self.myBlackLabel.backgroundColor = [UIColor blackColor];
    self.myBlackLabel.userInteractionEnabled = YES;
    [self.view addSubview:self.myBlackLabel];
    
    self.pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchs:)];
    [self.myBlackLabel addGestureRecognizer:self.pinchGestureRecognizer];
    
}

-(void)handlePinchs:(UIPinchGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.currentScale = sender.scale;
    }else if(sender.state == UIGestureRecognizerStateBegan && self.currentScale != 0.0f){
        sender.scale = self.currentScale;
    }
    
    if (sender.scale != NAN && sender.scale !=0) {
        sender.view.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.myBlackLabel = nil;
        self.pinchGestureRecognizer = nil;
    }
}

@end











