//
//  Test1.h
//  blockObjectTestDemo
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <Foundation/Foundation.h>


extern int value;
extern int (^getIntValue)(void);
@interface Test1 : NSObject

-(void) createBlockObject;

@end
