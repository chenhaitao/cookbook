//
//  ViewController.m
//  AddHeaderAndFooterForTableViewDemo
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
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        static NSString *CellIdentifier = @"CellIdentifier";
        result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        result.textLabel.text = @"line";
    }
   
    return result;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger result = 0;
    if ([tableView isEqual:self.myTableView]) {
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

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView  *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        if (section == 0) {
            result = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, [tableView.delegate tableView:tableView heightForHeaderInSection:section])];
            UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            textLabel.text = @"Section 0 Header";
            textLabel.backgroundColor = [UIColor clearColor];
            [textLabel sizeToFit];
            CGRect frame = textLabel.frame;
            frame.origin.x += 10;
            frame.origin.y += 10;
            textLabel.frame =frame;
            
            [result addSubview:textLabel];
        }
    }
    return result;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        if (section == 0) {
            result = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.frame.size.width, [tableView.delegate tableView:tableView heightForFooterInSection:section])];
            UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            textLabel.text = @"Section 0 Footer";
            textLabel.backgroundColor = [UIColor clearColor];
            [textLabel sizeToFit];
            CGRect frame = textLabel.frame;
            frame.origin = CGPointMake(10.0f, 0.0f);
            textLabel.frame = frame;
            
            [result addSubview:textLabel];
        }
    }
    return result;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat result = 0.0f;
    if ([tableView isEqual:self.myTableView]) {
        if (section == 0) {
            result = 30.0f;
        }
    }
    return result;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat result = 0.0f;
    if ([tableView isEqual:self.myTableView]) {
        if (section == 0) {
            result = 30.0f;
        }
    }
    return result;
}

@end


















