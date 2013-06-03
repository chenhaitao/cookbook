//
//  XMLElement.h
//  XMLDemo
//
//  Created by 陈 海涛 on 13-6-2.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLElement : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) NSDictionary *attributes;
@property (nonatomic,strong) NSMutableArray *subElements;
@property (nonatomic,weak)XMLElement *parent;

@end











