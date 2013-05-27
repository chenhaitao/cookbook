//
//  main.m
//  useBlockDemo
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <Foundation/Foundation.h>

void usingblock()
{
    __block BOOL found = NO;
    NSSet *aSet = [NSSet setWithObjects:@"Alpha",@"Beta",@"Gamma",@"X", nil];
    
    NSString *string = @"gamma";
    
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop){
        if ([obj localizedCaseInsensitiveCompare:string] == NSOrderedSame) {
            *stop = YES;
            found = YES;
        }
    }];
    NSLog(@"%i",found);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *array = [NSArray arrayWithObjects:@"A",@"B",@"C",@"A",@"B",@"Z",@"G",@"are",@"Q", nil];
        NSSet *filterSet = [NSSet setWithObjects:@"A",@"Z",@"Q", nil];
        
        BOOL (^test)(id obj,NSUInteger idx,BOOL *stop);
        test = ^(id obj,NSUInteger idx,BOOL *stop){
            if (idx < 5) {
                if ([filterSet containsObject:obj]) {
                    return YES;
                }
            }
            return NO;
        };
        
        NSIndexSet *indexes = [array indexesOfObjectsPassingTest:test];
        
        NSLog(@"indexs:%@",indexes);
        
        usingblock();
        
    }
    return 0;
}









































