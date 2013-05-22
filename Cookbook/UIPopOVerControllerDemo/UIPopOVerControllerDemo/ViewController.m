//
//  ViewController.m
//  UIPopOVerControllerDemo
//
//  Created by 陈 海涛 on 13-5-22.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"
#import "PopContentViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize popOverController;
@synthesize barButtonAdd;

- (void)viewDidLoad
{
    [super viewDidLoad];
	Class popOverClass = NSClassFromString(@"UIPopoverController");
    if (popOverClass !=nil && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        PopContentViewController *content  = [[PopContentViewController alloc] initWithNibName:nil bundle:nil];
        self.popOverController =  [[UIPopoverController alloc] initWithContentViewController:content];
        content.popoverController = self.popOverController;
        self.barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performAddWithPopover:)];
    }else{
        self.barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performAddWithAlertView:)];
    }
    self.navigationItem.rightBarButtonItem = self.barButtonAdd;
}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    NSLog(@"%@",buttonTitle);
}

-(void)performAddWithAlertView:(id)sender
{
    [[[UIAlertView alloc]initWithTitle:nil message:@"add..." delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"photo",@"audio", nil] show];
}

-(void)performAddWithPopover:(id)sender
{
    [self.popOverController presentPopoverFromBarButtonItem:self.barButtonAdd permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
























