//
//  ViewController.m
//  InstantiatingATableView
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
    
    /*
     typedef NS_ENUM(NSInteger, UITableViewStyle) {
     UITableViewStylePlain,                  
     UITableViewStyleGrouped                 
     };
     */
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
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
    if ([tableView isEqual:self.myTableView]) {
        result = 3;
    }
    return result;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 0;
    if ([tableView isEqual:self.myTableView]) {
        switch (section) {
            case 0:
                result = 3;
                break;
            case 1:
                result = 5;
                break;
            case 2:
                result = 8;
                break;
            default:
                break;
        }
    }
    return result;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        static NSString *TableViewCellIdentifier = @"MyCells";
        result = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
        if (result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableViewCellIdentifier];
        }
        result.textLabel.text = [NSString stringWithFormat:@"Section %ld,Cell %ld",(long)indexPath.section,(long)indexPath.row];
        /*
         typedef NS_ENUM(NSInteger, UITableViewCellAccessoryType) {
         UITableViewCellAccessoryNone,                   // don't show any accessory view
         UITableViewCellAccessoryDisclosureIndicator,    // regular chevron. doesn't track
         UITableViewCellAccessoryDetailDisclosureButton, // blue button w/ chevron. tracks
         UITableViewCellAccessoryCheckmark               // checkmark. doesn't track
         };
         */
        
        /*
         点击UITableViewCellAccessoryDetailDisclosureButton 按钮将会触发-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath 方法
         */
      //  result.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0.0f, 0.0f, 150.0f, 25.0f);
        [button setTitle:@"Expand" forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(performExpand:) forControlEvents:UIControlEventTouchUpInside];
        result.accessoryView = button;
        
    }
    return result;
}

//-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"Accessory button is tapped for cell at index path = %@",indexPath);
//    UITableViewCell *ownerCell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"cell title = %@",ownerCell.textLabel.text);
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.myTableView]) {
        NSLog(@"%@",[NSString stringWithFormat:@"Cell %ld in Section %ld is Selected",(long)indexPath.section,(long)indexPath.row]);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat result = 20.0f;
    if ([tableView isEqual:self.myTableView]) {
        result = 40.0f;
    }
    return result;
}

#pragma mark -

-(void)performExpand:(UIButton *)sender
{
    NSLog(@"tap on expand button");
    UIView *view = sender.superview;
    while (![view isKindOfClass:[UITableViewCell class]]) {
        view = sender.superview;
    }
    UITableViewCell *cell = (UITableViewCell *)view;
    if (cell != nil ) {
        NSIndexPath *indexPath = [self.myTableView indexPathForCell:cell];
        NSLog(@"Accessory in index path is tapped. index path = %@",indexPath);
    }
    
    
}

@end





















