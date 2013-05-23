//
//  ViewController.m
//  MenuForTableViewDemo
//
//  Created by 陈 海涛 on 13-5-23.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        self.myTableView = nil;
    }
}

#pragma mark -
#pragma mark UITableView delegate and dataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger result = 0;
    if([tableView isEqual:self.myTableView]){
        result = 1;
    }
    
    return result;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 0;
    if ([tableView isEqual:self.myTableView]) {
        result = 3;
    }
    return result;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    static NSString *CellIdentifier = @"CellIdentifier";
    result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (result == nil) {
        result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    result.textLabel.text = @"Line";
    
    return result;
}


-(BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL result = NO;
    if ([tableView isEqual:self.myTableView]) {
        result = YES;
    }
    return result;
}

-(BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    BOOL result = NO;
   
    if ([tableView isEqual:self.myTableView]) {
         NSLog(@"%@",NSStringFromSelector(action));
        if (action == @selector(copy:)) {
            result = YES;
        }
        
    }
    return result;
}

-(void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    if ([tableView isEqual:self.myTableView]) {
        if (action == @selector(copy:)) {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            [pasteboard setString:cell.textLabel.text];
        }
    }
    
}

#pragma mark -


@end















