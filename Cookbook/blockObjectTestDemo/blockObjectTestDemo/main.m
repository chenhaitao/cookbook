//
//  main.m
//  blockObjectTestDemo
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test1.h"
#import "Test2.h"


int (^oneForm)(int) = ^(int anInt){
    return anInt -1;
};

float (^distanceTraveled)(float,float,float) = ^(float startingSpeed,float acceleration,float time){
    float distance = (startingSpeed *time) + (0.5 *acceleration *time*time);
    return distance;
};

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        __block  int multiplier = 7;
//        int (^myBlock)(int) = ^(int num){
//            multiplier +=1;
//            return num * multiplier;
//        };
//        NSLog(@"%i",myBlock(3));
        int y = 99;
        void(^test)(void) = ^(void){
            NSLog(@"%i",y);
        };
        test();
        
        [[Test1 new] createBlockObject];
        [[Test2 new] createblock];
    }
    return 0;
}



