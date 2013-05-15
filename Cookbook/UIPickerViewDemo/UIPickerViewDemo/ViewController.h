//
//  ViewController.h
//  UIPickerViewDemo
//
//  Created by 陈 海涛 on 13-5-15.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,strong) UIPickerView *myPicker;

@end
