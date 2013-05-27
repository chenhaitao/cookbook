//
//  BlockTest.m
//  BlockObjectDemo
//
//  Created by 陈 海涛 on 13-5-24.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "BlockTest.h"

@implementation BlockTest

NSString* (^intToString)(NSInteger) = ^(NSInteger param){
    return [NSString stringWithFormat:@"%lu",(long)param];
};

-(void)callIntToString
{
    NSString *str = intToString(10);
    NSLog(@"%@",str);
}

-(NSString *)convertIntToString:(NSInteger)intParam usingBlockObject:(intToStringConverter)blockParam
{
    return blockParam(intParam);
}

-(void)callIntToString2
{
   NSString *str = [self convertIntToString:9 usingBlockObject:intToString];
    NSLog(@"%@",str);
}

-(void)doTheConversion
{
    intToStringConverter inlineConverter = ^(NSInteger intParam){
        NSString *result = [NSString stringWithFormat:@"%lu",(unsigned long)intParam];
        return result;
    };
    NSString *result = [self convertIntToString:8 usingBlockObject:inlineConverter];
    NSLog(@"%@",result);
}

-(void)doTheConversion2
{
    NSString *result = [self convertIntToString:7 usingBlockObject:^NSString *(NSInteger intparam){
        return [NSString stringWithFormat:@"%lu",(unsigned long)intparam];
    }];
    NSLog(@"%@",result);
}

@end


















