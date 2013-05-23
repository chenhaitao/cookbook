//
//  ViewController.m
//  DeleteTableViewCell
//
//  Created by 陈 海涛 on 13-5-23.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray *datas;
@end

@implementation ViewController
@synthesize myTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.datas = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
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
#pragma mark UITableView delegate and datasource methods;
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger result = 0;
    if ([self.myTableView isEqual:tableView]) {
        result = 1;
    }
    return result;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 0;
    if ([self.myTableView isEqual:tableView]) {
        result = self.datas.count;
    }
    return result;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        static NSString *MyCellIdentifier = @"MyCells";
        result = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
        if (result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellIdentifier];
        }
        result.textLabel.text = [NSString stringWithFormat:@"%@",self.datas[indexPath.row]];
    }
    
    return result;
}

//判断是否可以进行Edting
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL result = NO;
    if ([tableView isEqual:self.myTableView]) {
        result = YES;
    }
    return result;
}

//判断页面是否可以Edting
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.myTableView setEditing:editing animated:animated];
}

//此方法返回值决定了tableView允许用户做什么：插入、删除等。
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCellEditingStyle result = UITableViewCellEditingStyleNone;
    if ([tableView isEqual:self.myTableView]) {
        result = UITableViewCellEditingStyleDelete;
    }
    return result;
}



//此方法实现对tableView的操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (indexPath.row < self.datas.count ) {
            [self.datas removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            /**
             typedef NS_ENUM(NSInteger, UITableViewRowAnimation) {
             UITableViewRowAnimationFade,
             UITableViewRowAnimationRight,           // slide in from right (or out to right)
             UITableViewRowAnimationLeft,
             UITableViewRowAnimationTop,
             UITableViewRowAnimationBottom,
             UITableViewRowAnimationNone,            // available in iOS 3.0
             UITableViewRowAnimationMiddle,          // available in iOS 3.2.  attempts to keep cell centered in the space it will/did occupy
             UITableViewRowAnimationAutomatic = 100  // available in iOS 5.0.  chooses an appropriate animation style for you
             };
             */
        }
    }
}


@end


































