//
//  PopContentViewController.m
//  UIPopOVerControllerDemo
//
//  Created by 陈 海涛 on 13-5-22.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "PopContentViewController.h"

@interface PopContentViewController ()

@end

@implementation PopContentViewController
@synthesize popoverController;
@synthesize buttonAudio;
@synthesize buttonPhoto;

-(BOOL)isInPopover
{
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    if (popoverClass != nil && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && self.popoverController!= nil) {
        return YES;
    }else{
        return NO;
    }
}

-(void)gotoAppleWebSite:(id)sender
{
    if ([self isInPopover]) {
         [self.popoverController dismissPopoverAnimated:YES];
    }
   
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.contentSizeForViewInPopover = CGSizeMake(200.0f, 125.0f);
    CGRect buttonRect = CGRectMake(20.0f, 20.0f, 160.0f, 37.0f);
    self.buttonPhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonPhoto.frame = buttonRect;
    [self.buttonPhoto setTitle:@"photo" forState:UIControlStateNormal];
    [self.buttonPhoto addTarget:self action:@selector(gotoAppleWebSite:) forControlEvents:UIControlEventTouchUpInside];
    
    buttonRect.origin.y += 50.0f;
    self.buttonAudio = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonAudio.frame = buttonRect;
    [self.buttonAudio setTitle:@"audio" forState:UIControlStateNormal];
    [self.buttonAudio addTarget:self action:@selector(gotoAppleWebSite:) forControlEvents:UIControlEventTouchUpInside];
    
     [self.view addSubview:self.buttonPhoto];
     [self.view addSubview:self.buttonAudio];
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window  == nil) {
        self.buttonPhoto = nil;
        self.buttonAudio = nil;
    }
}

@end



















