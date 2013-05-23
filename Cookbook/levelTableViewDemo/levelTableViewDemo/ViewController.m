//
//  ViewController.m
//  levelTableViewDemo
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
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.myTableView];
	
}

#pragma mark -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger result = 0;
    if ([self.myTableView isEqual:tableView]) {
        result = 3;
    }
    return result;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 0;
    if ([tableView isEqual:self.myTableView]) {
        result = 5;
    }
    return result;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    
    if ([tableView isEqual:self.myTableView]) {
        static NSString *MyCellIdentifier = @"SimpleCells";
        result = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
        if (result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellIdentifier];
        }
        result.textLabel.text = [NSString stringWithFormat:@"Section %ld,Cell %ld",(long)indexPath.section,(long)indexPath.row];
        result.indentationLevel = indexPath.row;
        result.indentationWidth = 10.0f;
    }
    
    return result;
}


#pragma mark -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
