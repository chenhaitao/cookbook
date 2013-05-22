//
//  ViewController.m
//  UIScrollViewDemo
//
//  Created by 陈 海涛 on 13-5-22.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myImageView;
@synthesize myScrollView;

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.myScrollView.alpha = 0.50f;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.myScrollView.alpha = 1.0f;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.myScrollView.alpha = 1.0f;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir"];
    self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.myScrollView addSubview:self.myImageView];
    self.myScrollView.contentSize = self.myImageView.bounds.size;
    [self.view addSubview:self.myScrollView];
    
    self.myScrollView.delegate = self;
    
    self.myScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    /*
     UIScrollView 有一个很有用的功能就是它支持委托。滑动视图能发送很重要的事件给他们的委托对象。滑 动视图的任何一个委托都必须遵守 UIScrollViewDelegate 的协议。下面是一些定义在这个协议中的方法解释:
     
     // any offset changes
     - (void)scrollViewDidScroll:(UIScrollView *)scrollView;     

     // called on start of dragging (may require some time and or distance to move)
     - (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
     
     // called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
     - (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
     
     - (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;   // called on finger up as we are moving
     
     - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;   // called when scroll view grinds to a halt
     
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end
