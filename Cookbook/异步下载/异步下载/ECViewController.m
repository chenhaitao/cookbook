//
//  ECViewController.m
//  异步下载
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
	NSString *urlString = @"http://www.apple.com";
    NSURL *url = [NSURL URLWithString:urlString];
   // NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10.0f];//设置超时时间
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest
                           queue:queue
                           completionHandler:
                            ^(NSURLResponse *response, NSData *data, NSError *error){
                               
                                if (data.length > 0 && error == nil) {
                                    NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                    NSLog(@"HTML = %@",html);
                                    
                                    NSString *documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                                    NSString *filePath = [documentsDir stringByAppendingPathComponent:@"apple.html"];
                                 BOOL flag =   [data writeToFile:filePath atomically:YES];
                                    
                                    NSLog(@"%@ saved the file to %@ ",(flag?@"successfully":@"Failed"),filePath);
                                    
                                }else if(data.length == 0 && error ==nil){
                                    NSLog(@"Nothing was download");
                                }else if(error != nil){
                                    NSLog(@"Error happended = %@",[error localizedDescription]);
                                }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














































