//
//  BlockTest.h
//  BlockObjectDemo
//
//  Created by 陈 海涛 on 13-5-24.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString* (^intToStringConverter)(NSInteger param);
@interface BlockTest : NSObject
-(void)callIntToString;
-(void)callIntToString2;
-(void)doTheConversion;
-(void)doTheConversion2;
@end
