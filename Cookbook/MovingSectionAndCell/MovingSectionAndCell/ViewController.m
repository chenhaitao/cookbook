//
//  ViewController.m
//  MovingSectionAndCell
//
//  Created by 陈 海涛 on 13-5-23.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView;
@synthesize arrayOfSections;

-(NSMutableArray *)newSectionWithIndex:(NSUInteger)index withCellCount:(NSUInteger)cellCount
{
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSUInteger counter = 0; counter < cellCount; counter++) {
        [result addObject:[[NSString alloc] initWithFormat:@"Section %lu Cell %lu",(unsigned long)index,(unsigned long)counter]];
    }
    return result;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.arrayOfSections = [[NSMutableArray alloc] init];
    NSMutableArray *section1 = [self newSectionWithIndex:1 withCellCount:3];
    NSMutableArray *section2 = [self newSectionWithIndex:2 withCellCount:3];
    NSMutableArray *section3 = [self newSectionWithIndex:3 withCellCount:3];
    
    [arrayOfSections addObject:section1];
    [arrayOfSections addObject:section2];
    [arrayOfSections addObject:section3];
    
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
        self.arrayOfSections = nil;
    }
}

#pragma mark -
#pragma mark UITableView delegate and dataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger result = 0;
    if ([tableView isEqual:self.myTableView]) {
        result = self.arrayOfSections.count;
    }
    return result;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 0;
    if ([tableView isEqual:self.myTableView]) {
        if ( section < self.arrayOfSections.count ) {
            NSMutableArray *sectionArray = self.arrayOfSections[section];
            result = sectionArray.count;
        }
    }
    return result;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    if ([tableView isEqual:self.myTableView]) {
        static NSString *CellIdentifier = @"CellIdentifier";
        result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        NSMutableArray *sectionArray = [self.arrayOfSections objectAtIndex:indexPath.section];
        result.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
    }
    return result;
}

#pragma mark -


- (void) moveCell2InSection1ToCell1InSection2{
    
    NSMutableArray *section1 = [self.arrayOfSections objectAtIndex:0];
    NSMutableArray *section2 = [self.arrayOfSections objectAtIndex:1];
    
    NSString *cell2InSection1 = [section1 objectAtIndex:1];
    [section1 removeObject:cell2InSection1];
    
    [section2 insertObject:cell2InSection1
                   atIndex:0];
    
    NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:1
                                                      inSection:0];
    NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:0
                                                           inSection:1];
    
    [self.myTableView moveRowAtIndexPath:sourceIndexPath
                             toIndexPath:destinationIndexPath];
    
}

- (void) moveCell1InSection1ToCell2InSection1{
    
    NSMutableArray *section1 = [self.arrayOfSections objectAtIndex:0];
    NSString *cell1InSection1 = [section1 objectAtIndex:0];
    [section1 removeObject:cell1InSection1];
    [section1 insertObject:cell1InSection1
                   atIndex:1];
    
    NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:0
                                                      inSection:0];
    NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:1
                                                           inSection:0];
    
    [self.myTableView moveRowAtIndexPath:sourceIndexPath
                             toIndexPath:destinationIndexPath];
    
}

- (void) moveSection1ToSection3{
    
    NSMutableArray *section1 = [self.arrayOfSections objectAtIndex:0];
    [self.arrayOfSections removeObject:section1];
    [self.arrayOfSections addObject:section1];
    
    [self.myTableView moveSection:0
                        toSection:2];
    
}


-(IBAction)changes:(UISegmentedControl *)segment
{
    NSInteger index = segment.selectedSegmentIndex;
    switch (index) {
        case 0:
            [self moveCell1InSection1ToCell2InSection1];
            break;
        case 1:
            [self moveCell2InSection1ToCell1InSection2];
            break;
        case 2:
            [self moveSection1ToSection3];
            break;
        default:
            break;
    }
}

@end







































