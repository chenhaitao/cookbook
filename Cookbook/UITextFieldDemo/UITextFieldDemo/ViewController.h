//
//  ViewController.h
//  UITextFieldDemo
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,strong) UITextField *myTextField;
@property (nonatomic,strong) UILabel *labelCounter;

@end
