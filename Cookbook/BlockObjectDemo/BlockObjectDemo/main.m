//
//  main.m
//  BlockObjectDemo
//
//  Created by 陈 海涛 on 13-5-24.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test1.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        [[Test1 new] doSomeThing];
         [[Test1 new] doSomeThing2];
    }
    return 0;
}

