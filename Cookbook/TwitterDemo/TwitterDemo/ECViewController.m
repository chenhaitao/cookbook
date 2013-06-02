//
//  ECViewController.m
//  TwitterDemo
//
//  Created by 陈 海涛 on 13-5-31.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ECViewController.h"
#import  <Twitter/Twitter.h>

@interface ECViewController ()
@property (nonatomic,strong)  TWTweetComposeViewController *twitterController;
@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.twitterController = [[TWTweetComposeViewController alloc] init];
    [self.twitterController setInitialText:@"Your Tweet Goes Here"];
    [self.twitterController addImage:[UIImage imageNamed:@"Default"]];
    [self.twitterController addURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    

    [self.navigationController presentViewController:self.twitterController animated:YES completion:^{}];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end




























