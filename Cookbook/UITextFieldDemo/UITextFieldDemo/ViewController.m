//
//  ViewController.m
//  UITextFieldDemo
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTextField;
@synthesize labelCounter;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    //UITextField默认高度是31
    CGRect textFieldFrame = CGRectMake(20.0f, 20.0f, 200.0f, 31.0f);
    self.myTextField = [[UITextField alloc] initWithFrame:textFieldFrame];
    
    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.myTextField.textAlignment = NSTextAlignmentCenter;
    self.myTextField.delegate = self;
    
    self.myTextField.text = @"Sir Richard Branson";
    
    [self.view addSubview:self.myTextField];
    
    
    CGRect labelCounterFrame = self.myTextField.frame;
    labelCounterFrame.origin.y += textFieldFrame.size.height + 10;
    self.labelCounter = [[UILabel alloc]initWithFrame:labelCounterFrame];
    [self.view addSubview:self.labelCounter];
    
    [self calculateAndDisplayTextFieldLengthWithText:self.myTextField.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
 textFieldShouldBeginEditing:
 这是返回一个 BOOL 值的方法,它会告诉文本视图(这个方法的参数)是否允许用户开始在文本视图编
 辑。假如不想让用户编辑这个文本视图则将返回 NO。
 
 textFieldDidBeginin:
 当用户开始编辑文本视图时这个方法将会被调用。
 
 textFieldShouldEndEditing:
 这个方法返回一个 BOOL 值,它将告诉文本视图是否结束当前的编辑进程。假如返回 NO,用户将不
 能终止文本的编辑。
 
 textFieldDidEndEditing:
 当文本视图的编辑进程终止时将会被调用。
 
 textField:shouldChangCharacterInRange:replacementString: 任何时候文本视图里的文本被修改都会调动这个方法。方法返回的是一个布尔值。假如返回 YES,说明允许修改文本。如果返回 NO,文本视图里的文本的修改将不会被通知和发生。
 
 textFieldShouldClear:
 每个文本视图都有一个 Clear 按钮,通常是一个圆形 X 按钮。当用户按下这个按钮时,文本视图里的
 内容将会自动清除。但是我们需要人工启动清除按钮。如果已经启动了清除按钮并返回 NO 方法,它将会让用 户感觉程序没有正常工作。所以想清楚你在做什么,因为用户看见一个清除按钮后按下它却看不见文本视图里 的文本没有被清除。
 
 textFieldShouldReturn:
 当用户在键盘上按下 Return 或 Enter 键时将会调用这个方法,尝试隐藏键盘,你需要将这个文本视图
 注册为这个方法的第一个响应者。
 */

-(void)calculateAndDisplayTextFieldLengthWithText:(NSString *)text
{
    NSString *characterOrCharacters = @"Characters";
    if (text.length == 1) {
        characterOrCharacters = @"Character";
    }
    self.labelCounter.text = [NSString stringWithFormat:@"%lu %@",(unsigned long)text.length,characterOrCharacters];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL result = YES;
    if ([textField isEqual:self.myTextField]) {
        NSString *wholeText = [textField.text stringByReplacingCharactersInRange:range withString:string];
        [self calculateAndDisplayTextFieldLengthWithText:wholeText];
    }
    
    return result;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end




























































