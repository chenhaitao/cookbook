//
//  NextViewController.m
//  AddHeaderAndFooterForTableViewDemo
//
//  Created by 陈 海涛 on 13-5-23.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
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
#pragma UITableView delegate and dataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger result = 0.0f;
    if ([tableView isEqual:self.myTableView]) {
        result = 3;
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

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        static NSString *CellIdentifier = @"MyCell";
        result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        result.textLabel.text = @"Line";
    }
    
    return result;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat result = 0.0f;
    if ([tableView isEqual:self.myTableView]) {
        if (section == 1) {
            result = 30;
        }
    }
    return result;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat result = 0.0f;
    if ([tableView isEqual:self.myTableView]) {
        if (section == 1) {
            result = 30.0f;
        }
    }
    return result;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        if (section == 1) {
            result = @"Section 1 Header";
        }
    }
    return result;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        if (section == 1) {
            result = @"Section 1 footer";
        }
    }
    return result;
}

@end




























