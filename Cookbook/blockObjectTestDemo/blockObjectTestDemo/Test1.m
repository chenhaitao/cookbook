//
//  Test1.m
//  blockObjectTestDemo
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "Test1.h"

int value = 99;

int (^getIntValue)(void) = ^(void){
    return value;
};

@implementation Test1
-(void)createBlockObject
{
    int (^oneForm) (int);
    oneForm = ^(int anInt){
        return anInt - 1;
    };
    
    NSLog(@"%i",getIntValue());
}
@end

































