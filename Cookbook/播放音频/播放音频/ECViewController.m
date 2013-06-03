//
//  ECViewController.m
//  播放音频
//
//  Created by 陈 海涛 on 13-6-2.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ECViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ECViewController ()
@property (nonatomic,strong) AVAudioPlayer *audioPlayer;
@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:@"MySong" ofType:@"mp3"];
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        NSError *error = nil;
        
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:&error];
        
        if (self.audioPlayer != nil) {
            self.audioPlayer.delegate = self;
            if (self.audioPlayer.prepareToPlay && [self.audioPlayer play]) {
                NSLog(@"播放成功");
            }else{
                NSLog(@"播放失败");
            }
        }
    });
}

//播放被中断
-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    
}

//播放中断结束
-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags
{
    if (flags == AVAudioSessionInterruptionOptionShouldResume && player != nil ) {
        [player play];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












