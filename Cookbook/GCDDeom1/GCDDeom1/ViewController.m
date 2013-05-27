//
//  ViewController.m
//  GCDDeom1
//
//  Created by 陈 海涛 on 13-5-27.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)print1To100
{
    void (^printFrom1To100)(void) = ^(void){
        NSInteger counter = 0;
        for (counter = 1; counter <= 100; counter++) {
            NSLog(@"%ld",(long)counter);
        }
    };
    
    /*
     #define DISPATCH_QUEUE_PRIORITY_HIGH 2
     #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0
     #define DISPATCH_QUEUE_PRIORITY_LOW (-2)
     #define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
     */
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(concurrentQueue, printFrom1To100);
    dispatch_sync(concurrentQueue, printFrom1To100);
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    dispatch_queue_t  queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^(void) {
        
        __block UIImage *image = nil;
        
        dispatch_sync(queue, ^(void){
            NSString *urlAsString = @"http://images.apple.com/mobileme/features/images/ipad_findyouripad_20100518.jpg";
            NSURL *url = [NSURL URLWithString:urlAsString];
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            NSError *downloadError = nil;
            NSData *imageData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:&downloadError];
            if (downloadError == nil && imageData!=nil) {
                image = [UIImage imageWithData:imageData];
            }else if(downloadError != nil){
                NSLog(@"Error happened = %@",downloadError);
            }else{
                NSLog(@"No data could get download from the URL");
            }
        });
        
        dispatch_sync(dispatch_get_main_queue(), ^(void){
            if (image != nil) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
                [imageView setImage:image];
                [imageView setContentMode:UIViewContentModeScaleAspectFit];
                [self.view addSubview:imageView];
            }else{
                NSLog(@"Image is not downloaded.NOthing to dispaly");
            }
        });
        
    });
}






- (void)viewDidLoad
{
    [super viewDidLoad];
//	[self print1To100];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

























