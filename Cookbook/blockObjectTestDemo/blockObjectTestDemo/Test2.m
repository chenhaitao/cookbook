//
//  Test2.m
//  blockObjectTestDemo
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "Test2.h"

int theValue = 100;
int (^getTheValue)(void) = ^(void){
    return theValue;
};

@implementation Test2
-(void)createblock
{
    NSLog(@"%i",getTheValue());
}
@end
