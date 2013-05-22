//
//  ViewController.m
//  KeyboardNotificationDemo
//
//  Created by 陈 海涛 on 13-5-22.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView;


/*
 UIKeyboardWillShowNotification
 当键盘即将要显示的时候将会发出这个通知。这个通知包含了用户信息库,库里面包括了键盘的各种信息,键盘将以动画的形式显示在屏幕上。
 
 UIKeyboardDidShowNotification
 当键盘显示在屏幕上时将发出这个通知。
 
 UIKeyboardWillHideNotification
 当键盘将要从屏幕上移除时将会发出此通知。通知里包含了用户信息库,库里包括了各种关于键盘信息的详细信息,当键盘隐藏时的动画,动画的持续时间,等等。
 
 UIKeyboardDidHideNotification
 当键盘完全隐藏后将发出此通知。
 */

/*
 UIKeyboardAnimationCurveUserInfoKey
 这个关键字的值指明了动画的类型,用来显示和隐藏键盘。这个关键字包含了一个 NSNumber 类型的值, 此类型包含了一个 NSUInteger 类型无符号整数
 
 UIKeyboardAnimationDurationUserInfoKey 这个键值指明了键盘显示或隐藏的动画所用的时间。这个键包含一个 NSNumber 类型的值,此类包
 含一个 double 类型的双字节值。
 
 UIKeyboardFrameBeginUserInfoKey
 这个键值指明了键盘在动画之前的框架。假如键盘将要显示时,在显示之前将这个框架传递给这个动 画。假如键盘已经显示了并即将要隐藏时,这个框架将会传递给这个隐藏动画,在键盘消失之前。这个键包含 了一个 CGRect 类型的值。
 
 UIKeyboardFrameEndUserInfoKey
 这个键值指明了动画完成后的键盘框架。假如键盘即将要显示时,这个框架将会在键盘完全显示后传递给键盘。。假如键盘已经完全显示,而且将要隐藏时,在完全隐藏后这个框架将会传递给键盘。这个键值包含了一个 CGRect 类型的值。
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
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
#pragma mark UITextField delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark UITableView delegate and dataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString *cellIdentifier = @"CellIdentifier";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld",(long)indexPath.row ];
    CGRect accessoryRect = CGRectMake(0.0f, 0.0f, 150.0f, 31.0f);
    UITextField *accessory = [[UITextField alloc] initWithFrame:accessoryRect];
    accessory.borderStyle = UITextBorderStyleRoundedRect;
    accessory.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    accessory.placeholder = @"Enter Text";
    accessory.delegate = self;
    accessory.keyboardType = UIKeyboardTypeDefault;
    cell.accessoryView = accessory;
    
    
    return cell;
    
}

#pragma mark -

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)handleKeyboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    //键盘动画的路线
    NSValue *animationCurveObject = [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    //键盘动画的时间
    NSValue *animationDurationObject = [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
    //键盘动画结束后的frame
    NSValue *keyboardEndRectObject = [userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    
    NSUInteger animationCurve = 0;
    double animationDuration = 0.0f;
    CGRect keyboardEndRect = CGRectZero;
    
    [animationCurveObject getValue:&animationCurve];
    [animationDurationObject getValue:&animationDuration];
    [keyboardEndRectObject getValue:&keyboardEndRect];
    
    [UIView beginAnimations:@"changeTableViewContentInset" context:NULL];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationDuration:animationDuration];
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    //获取2个矩形的相交区域 CGRect CGRectIntersection(CGRect r1, CGRect r2)
    CGRect intersectionOfKeyboardRectAndWindowRect = CGRectIntersection(window.frame, keyboardEndRect);
    CGFloat bottomInset = intersectionOfKeyboardRectAndWindowRect.size.height;
    self.myTableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, bottomInset, 0.0f);
    
    
    NSIndexPath *indexPathOfOWnerCell = nil;
    NSInteger numberOfCells = [self.myTableView.dataSource tableView:self.myTableView numberOfRowsInSection:0];
    for (NSInteger counter = 0; counter <numberOfCells; counter++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:counter inSection:0];
        UITableViewCell *cell = [self.myTableView cellForRowAtIndexPath:indexPath];
        UITextField *textField = (UITextField *)cell.accessoryView;
        if ([textField isKindOfClass:[UITextField class]] == NO ) {
            continue;
        }
        if([textField isFirstResponder]){
            indexPathOfOWnerCell = indexPath;
            break;
        }
    }
    [UIView commitAnimations];
    
    if (indexPathOfOWnerCell != nil) {
        [self.myTableView scrollToRowAtIndexPath:indexPathOfOWnerCell atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}

-(void)handleKeyboardWillHide:(NSNotification *)notification
{

}

@end





































