//
//  ViewController.m
//  UISegmentControlDemo
//
//  Created by 陈 海涛 on 13-5-16.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mySegmentedControl;

-(void)segmentControlChagned:(UISegmentedControl *)sender
{
    if ([sender isEqual:self.mySegmentedControl]) {
        NSInteger selectedSegmentIndex = [sender selectedSegmentIndex];
        NSString *selectedSegmentText = [sender titleForSegmentAtIndex:selectedSegmentIndex];
        NSLog(@"segment %ld with %@ text is selected",(long)selectedSegmentIndex,selectedSegmentText);
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  //  NSArray *segments = [[NSArray alloc] initWithObjects:@"iphone",@"ipad",@"ipod",@"imac", nil];
    //显示图片
    NSArray *segments = [[NSArray alloc] initWithObjects:@"iphone",[UIImage imageNamed:@"iPad"],@"iPod",@"iMac", nil];
    
    self.mySegmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
    CGRect frame = self.mySegmentedControl.frame;
    frame.size.width = 300.0f;
    frame.size.height = 64.0f;
    self.mySegmentedControl.frame = frame;
    self.mySegmentedControl.center = self.view.center;
    [self.view addSubview:self.mySegmentedControl];
    
    //用户在选中一个选项之后，该选项马上变回原始状态
    self.mySegmentedControl.momentary = YES;
    
    /*
     typedef NS_ENUM(NSInteger, UISegmentedControlStyle) {
     UISegmentedControlStylePlain,     // large plain 默认风格
     UISegmentedControlStyleBordered,  // large bordered
     UISegmentedControlStyleBar,       // small button/nav bar style. tintable
     UISegmentedControlStyleBezeled,   // DEPRECATED. Do not use this style.
     };
     */
    self.mySegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    
    [self.mySegmentedControl addTarget:self action:@selector(segmentControlChagned:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end






































