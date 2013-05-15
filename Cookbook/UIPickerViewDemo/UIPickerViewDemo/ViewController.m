//
//  ViewController.m
//  UIPickerViewDemo
//
//  Created by 陈 海涛 on 13-5-15.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,assign) NSInteger beginning;
@end

@implementation ViewController
@synthesize myPicker;



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.beginning = 0;
	self.view.backgroundColor = [UIColor whiteColor];
    
    self.myPicker =[[UIPickerView alloc] init];
    self.myPicker.dataSource = self;
    self.myPicker.delegate = self;
    self.myPicker.center = self.view.center;
    self.myPicker.showsSelectionIndicator = YES;
    [self.view addSubview:self.myPicker];
}

#pragma mark -
#pragma mark UIPickerViewDelegate methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *result = nil;
    if ([pickerView isEqual:self.myPicker]) {
        result = [NSString stringWithFormat:@"row %ld",(long)row + self.beginning ];
    }
    
    return result;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([self.myPicker isEqual:pickerView]) {
        //获取pickerView在指定Component上选择的值
        NSInteger selectedRow = [self.myPicker selectedRowInComponent:component];
        NSLog(@"my selected row is %i",selectedRow);
        self.beginning = selectedRow;
        
        //重载UIPickerView [self.myPicker reloadAllComponents]; 
        [self.myPicker reloadComponent:component];
        
       
    }
}

#pragma mark UIPickerViewDataSource methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSInteger result = 0;
    if ([pickerView isEqual:self.myPicker]) {
        result = 1;
    }
    return result;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger result = 0;
    if ([pickerView isEqual:self.myPicker]) {
        return 10;
    }
    return result;
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


















