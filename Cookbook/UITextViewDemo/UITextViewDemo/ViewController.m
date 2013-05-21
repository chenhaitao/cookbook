//
//  ViewController.m
//  UITextViewDemo
//
//  Created by 陈 海涛 on 13-5-21.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTextView;

-(void)closeKeybaord:(id)sender
{
    [self.myTextView resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.myTextView = [[UITextView alloc]initWithFrame:self.view.bounds];
    self.myTextView.text = @"some text here........";
    self.myTextView.font = [UIFont boldSystemFontOfSize:16.0f];
    self.myTextView.delegate = self;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 35.0f)];
    UIBarButtonItem *finshButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(closeKeybaord:)];
    UIBarButtonItem *flexibleButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *barButtonItems = @[flexibleButton,finshButton];
    toolbar.items = barButtonItems;
    self.myTextView.inputAccessoryView = toolbar;
    
    [self.view addSubview:self.myTextView];
    
    /*
     UIKeyboarWillShowNotification
     当键盘正准备显示子屏幕上时这个通知将会被发送给任何部件,比如文本视图等等。
     UIKeyboardDidShowNotification
     当键盘已经显示在屏幕上时将会发送这个通知。
     UIKeyboardWillHideNotification
     当键盘即将被隐藏时将会发送这个通知。
     UIKeyboardDidHideNotification
     当键盘完全隐藏时将会发送这个通知。
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        self.myTextView = nil;
    }
}

-(void)handleKeyboardDidShow:(NSNotification *)notification
{
    NSValue *keyboardFrameAsObject = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrame ;
    [keyboardFrameAsObject getValue:&keyboardFrame];
    
    //用于设置contentView与控件边界的距离，UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    self.myTextView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, keyboardFrame.size.height, 0.0f);
    
}

-(void)handleKeyboardWillHide:(NSNotification *)notification
{
    self.myTextView.contentInset = UIEdgeInsetsZero;
}

#pragma mark -
#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"textView changed !");
}

@end





































