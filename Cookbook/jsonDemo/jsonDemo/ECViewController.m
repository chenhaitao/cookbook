//
//  ECViewController.m
//  jsonDemo
//
//  Created by 陈 海涛 on 13-5-31.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ECViewController.h"

@interface ECViewController ()

@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
    [dictionary setValue:@"Anthony" forKey:@"First Name"];
    [dictionary setValue:@"Robbins" forKey:@"Last Name"];
    [dictionary setValue:@5 forKey:@"Age"];
    
    NSArray *arrayOfAnthonysChildren = @[@"Anthony's Son1",@"Anthony's daughter 1",@"Anthony's Son 2",@"Anthony's Son 3",@"Anthony's Daughter 2"];
    [dictionary setValue:arrayOfAnthonysChildren forKey:@"children"];
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    if (jsonData.length > 0 && error ==nil ) {
        NSString *jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"Successfully serialized the dictionary into data = %@",jsonStr);
        
        [self jsonToObject:jsonData];
        
    }else if(jsonData.length == 0 && error == nil ){
        NSLog(@"No data was returned after serialization");
    }else if(error != nil ){
        NSLog(@"An error happened = %@",error);
    }
    
}


-(void)jsonToObject:(NSData *)data
{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (jsonObject != nil && error == nil) {
        NSLog(@"Successfully deSerialized");
        if ([jsonObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = (NSDictionary *)jsonObject;
            NSLog(@"json dictionary = %@",dic);
        }else if([jsonObject isKindOfClass:[NSArray class]]){
            NSArray *array = (NSArray *)jsonObject;
            NSLog(@"json array = %@",array);
        }else{
            NSLog(@"some other class");
        }
    }else if(error != nil){
        NSLog(@"error = %@",[error localizedDescription]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end











































