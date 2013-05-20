//
//  SecondViewController.m
//  UINavigationController
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)goback1
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)goback2
{
    //获取navigationController的栈中所有的ViewControllers
    NSArray *currentController = self.navigationController.viewControllers;
    NSMutableArray *newControllers = [NSMutableArray arrayWithArray:currentController];
    //删除最后一个ViewControlelr
    [newControllers removeLastObject];
    //将修改后的ViewController的数组赋值给navigationController
    self.navigationController.viewControllers = newControllers;
    
}

//这种方式有动画，可以修改navigationController的栈中的viewController的显示位置
-(void)goback3
{
    NSArray *currentControllers = self.navigationController.viewControllers;
    NSMutableArray *newControllers = [NSMutableArray arrayWithArray:currentControllers];
    
    [newControllers removeLastObject];
    
    [self.navigationController setViewControllers:newControllers animated:YES];
    

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
 //   [self performSelector:@selector(goback1) withObject:nil afterDelay:5.0f];
 //   [self performSelector:@selector(goback2) withObject:nil afterDelay:5.0f];
    [self performSelector:@selector(goback3) withObject:nil afterDelay:5.0f];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Second Controller";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





















