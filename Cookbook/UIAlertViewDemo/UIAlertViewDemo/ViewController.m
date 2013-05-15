//
//  ViewController.m
//  UIAlertViewDemo
//
//  Created by 陈 海涛 on 13-5-15.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSString *)yesButtonTitle
{
    return @"YES";
}
-(NSString *)noButtonTitle
{
    return @"NO";
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self alertViewOfAlertViewTypeDefault];
    [self alertViewOfAlertViewStylePlainTextInput];
    [self alertViewOfAlertViewStyleSecureTextInput];
    [self alertViewOfAlertViewStyleLoginAndPasswrodInput];
}

/*
 typedef NS_ENUM(NSInteger, UIAlertViewStyle) {
 UIAlertViewStyleDefault = 0,               //默认格式的alertView
 UIAlertViewStyleSecureTextInput,           //以密码形式显示的输入框的alertView
 UIAlertViewStylePlainTextInput,            //以可见内容形式的输入框的alertView
 UIAlertViewStyleLoginAndPasswordInput      //登陆用户名喝密码的alertView
 };
 */

//UIAlertViewStyleDefault
-(void)alertViewOfAlertViewTypeDefault
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Rating" message:@"Can you please rate our app ?" delegate:self cancelButtonTitle:[self noButtonTitle] otherButtonTitles:[self yesButtonTitle], nil];
    [alertView setAlertViewStyle:UIAlertViewStyleDefault];//默认就是UIAlerViewStyleDefault，可以不加
    [alertView show];
}

//UIAlertViewStylePlainTextInput
-(void)alertViewOfAlertViewStylePlainTextInput
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Credit Card Number" message:@"Please enter your credit card number" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    UITextField *textField = [alertView textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeNumberPad;
    [alertView show];
}

//UIAlertViewStyleSecureTextInput
-(void)alertViewOfAlertViewStyleSecureTextInput
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"password" message:@"please enter the password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView setAlertViewStyle:UIAlertViewStyleSecureTextInput];
    [alertView show];
}
//UIAlertViewStyleLoginAndPasswordInput
-(void)alertViewOfAlertViewStyleLoginAndPasswrodInput
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"login" message:@"please enter the credentials" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [alertView show];
}


#pragma mark -
#pragma mark UIAlertViewDelegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:[self yesButtonTitle]]) {
        NSLog(@"User pressed the YES button");
    }else if([buttonTitle isEqualToString:[self noButtonTitle]]){
        NSLog(@"User pressed the NO button");
    }
}

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


































