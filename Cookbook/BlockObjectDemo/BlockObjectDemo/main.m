//
//  main.m
//  BlockObjectDemo
//
//  Created by 陈 海涛 on 13-5-24.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlockTest.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        BlockTest *test = [BlockTest new];
        [test  callIntToString];
        [test callIntToString2];
        [test doTheConversion];
        [test doTheConversion2];
    }
    return 0;
}

