//
//  ViewController.m
//  UIDatePickerViewDemo
//
//  Created by 陈 海涛 on 13-5-16.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myDatePicker;


-(void)datePickerDateChanged:(UIDatePicker *)sender
{
    if ([sender isEqual:self.myDatePicker]) {
        NSLog(@"selected date = %@",sender.date);
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.myDatePicker = [[UIDatePicker alloc] init];
    self.myDatePicker.center = self.view.center;
   /*
    typedef NS_ENUM(NSInteger, UIDatePickerMode) {
        UIDatePickerModeTime,           // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
        UIDatePickerModeDate,           // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
        UIDatePickerModeDateAndTime,    // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
        UIDatePickerModeCountDownTimer  // Displays hour and minute (e.g. 1 | 53)
    };*/
    
   self.myDatePicker.datePickerMode = UIDatePickerModeDateAndTime;    // default is UIDatePickerModeDateAndTime
    [self.view addSubview:self.myDatePicker];
    
    [self.myDatePicker addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
    
    NSDate *todayDate = [NSDate date];
    NSTimeInterval oneYearTime = 365*24*60*60;
    
    NSDate *oneYearFromToday = [todayDate dateByAddingTimeInterval:oneYearTime];
    NSDate *twoYearFromToday = [todayDate dateByAddingTimeInterval:oneYearTime *2];
    
    self.myDatePicker.minimumDate = oneYearFromToday;
    self.myDatePicker.maximumDate = twoYearFromToday;
    
    
    
    //倒计时功能
    /*
    self.myDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    NSTimeInterval time = 2 *60*60;//要倒计时的时间,以秒为单位
    [self.myDatePicker setCountDownDuration:time];//倒计时功能
   */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end




































