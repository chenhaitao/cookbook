//
//  AppDelegate.h
//  UITabBarDemo
//
//  Created by 陈 海涛 on 13-5-20.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OneViewController;
@class TwoViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) OneViewController *one;
@property (strong, nonatomic) TwoViewController *two;
@property (strong, nonatomic) UINavigationController *oneNavigationController;
@property (strong, nonatomic) UINavigationController *twoNavigationController;
@end
