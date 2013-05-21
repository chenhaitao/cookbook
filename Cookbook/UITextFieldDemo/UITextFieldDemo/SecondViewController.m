//
//  SecondViewController.m
//  UITextFieldDemo
//
//  Created by 陈 海涛 on 13-5-21.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.myTextField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 200.0f, 31.0f)];
    self.myTextField.delegate = self;
    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.myTextField.textAlignment = NSTextAlignmentCenter;
    self.myTextField.placeholder = @"Enter text here ....";
    
    self.myTextField.keyboardType = UIKeyboardTypeNumberPad;
   
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    [self.myTextField addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:self.myTextField];
    
    
    UILabel *currencyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    currencyLabel.text = [[[NSNumberFormatter alloc] init] currencySymbol];
    currencyLabel.font = self.myTextField.font;
    [currencyLabel sizeToFit];
    self.myTextField.leftView = currencyLabel;
    self.myTextField.leftViewMode = UITextFieldViewModeAlways;
    
    /*
    typedef NS_ENUM(NSInteger, UITextFieldViewMode) {
        UITextFieldViewModeNever,       //永不出现
        UITextFieldViewModeWhileEditing,//编辑的时候出现
        UITextFieldViewModeUnlessEditing,//不编辑的时候出现
        UITextFieldViewModeAlways        //总是出现
    };*/
}

-(void)closeKeyboard:(UITapGestureRecognizer *)sender
{
    
    [self.myTextField resignFirstResponder];
    
}

-(void)textValueChanged:(id)sender
{
    if ([sender isEqual:self.myTextField]) {
        NSLog(@"text value changed");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end







































