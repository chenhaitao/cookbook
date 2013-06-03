//
//  ECViewController.m
//  播放视频
//
//  Created by 陈 海涛 on 13-6-3.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ECViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ECViewController ()

@property (nonatomic,strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic,strong) UIButton *playButton;

-(void)startPlayingVideo:(id)sender;
-(void)stopPlayingVideo:(id)sender;

@end

@implementation ECViewController

-(void)startPlayingVideo:(id)sender
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *urlString = [mainBundle pathForResource:@"Sample" ofType:@"m4v"];
    NSURL *url = [NSURL fileURLWithPath:urlString];
    
    if (self.moviePlayer != nil) {
        [self stopPlayingVideo:nil];
    }
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    if (self.moviePlayer != nil) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoHasFinishedPlaying:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
        //监听当捕获相应的楨结束的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoThumbnailIsAvailable:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:self.moviePlayer];
        
        
        NSLog(@"Successfully instantiated the movie player");
        self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
        [self.moviePlayer play];
        [self.view addSubview:self.moviePlayer.view];
        [self.moviePlayer setFullscreen:YES animated:YES];
        
        //捕获第三秒的那个楨
        NSNumber *thumbnial = [NSNumber numberWithFloat:3.0f];
        NSArray *requestedThumbnails = [NSArray arrayWithObject:thumbnial];
        [self.moviePlayer requestThumbnailImagesAtTimes:requestedThumbnails timeOption:MPMovieTimeOptionExact];
        
    }else{
        NSLog(@"Failed to instantiate the movie player");
    }
}

-(void)videoThumbnailIsAvailable:(NSNotification *)notification
{
    MPMoviePlayerController *controller = (MPMoviePlayerController *)notification.object;
    if (controller!=nil && [self.moviePlayer isEqual:controller]) {
        UIImage *thumbnial = [notification.userInfo objectForKey:MPMoviePlayerThumbnailImageKey];
        if (thumbnial) {
         NSData *imageData = UIImagePNGRepresentation(thumbnial);
            NSString *filePath =  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"hello.png"];
            [imageData writeToURL:[NSURL fileURLWithPath:filePath] atomically:YES];
        }
    }
}


-(void)videoHasFinishedPlaying:(NSNotification *)notification
{
    NSNumber *reason = [notification.userInfo valueForKey:MPMoviePlayerPlaybackDidFinishNotification];
    if (reason != nil) {
        NSInteger reasonInteger = [reason integerValue];
        switch (reasonInteger) {
            case MPMovieFinishReasonPlaybackEnded:
                NSLog(@"正常结束");
                break;
            case MPMovieFinishReasonPlaybackError:
                NSLog(@"错误结束");
                break;
            case MPMovieFinishReasonUserExited :
                NSLog(@"用户退出了播放器");
                break;
            default:
                break;
        }
        [self stopPlayingVideo:nil];
    }
}

-(void)stopPlayingVideo:(id)sender
{
    if (self.moviePlayer != nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:self.moviePlayer];
        [self.moviePlayer stop];
        if( [self.moviePlayer.view.superview isEqual:self.view]){
            [self.moviePlayer.view removeFromSuperview];
        }
        self.moviePlayer = nil;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
    [self.playButton sizeToFit];
    self.playButton.center = self.view.center;
    [self.playButton addTarget:self action:@selector(startPlayingVideo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        [self stopPlayingVideo:nil];
        self.moviePlayer = nil;
    }
}

@end




























