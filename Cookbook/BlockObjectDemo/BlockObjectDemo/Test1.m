//
//  Test1.m
//  BlockObjectDemo
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "Test1.h"

@implementation Test1
-(void)doSomeThing
{
    self.stringValue = @"hello";
    NSString* (^getStringValue)(void) = ^{
        return self.stringValue;
    };
    NSLog(@"%@",getStringValue());
    
    NSLog(@"%@",getStringValue2(self));
}

NSString* (^getStringValue2)(id) = ^(id self){
    return [self stringValue];
};

-(void)doSomeThing2
{
   // NSInteger value = 99;
   __block NSInteger value = 99;
    void (^showValue)(void) = ^{
        NSLog(@"%ld",(long)value);
    };
    value = 100;
    showValue();
}
@end

















