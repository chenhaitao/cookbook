//
//  ECViewController.m
//  访问音乐库
//
//  Created by 陈 海涛 on 13-6-3.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ECViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ECViewController () <MPMediaPickerControllerDelegate,AVAudioPlayerDelegate>
@property (nonatomic,strong) MPMusicPlayerController *myMusicPlayer;
@property (nonatomic,strong) UIButton *buttonPickAndPlay;
@property (nonatomic,strong) UIButton *buttonStopPlaying;
@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    self.buttonPickAndPlay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonPickAndPlay.frame = CGRectMake(0.0f,0.0f, 200.0f, 37.0f);
    self.buttonPickAndPlay.center = CGPointMake(self.view.center.x, self.view.center.y - 50);
    [self.buttonPickAndPlay setTitle:@"Pick and paly" forState:UIControlStateNormal];
    [self.buttonPickAndPlay addTarget:self action:@selector(displayMediaPickerAndPlayItem) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonPickAndPlay];
    
    
    self.buttonStopPlaying = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonStopPlaying.frame = CGRectMake(0.0f, 0.0f, 200.0f, 37.0f);
    self.buttonStopPlaying.center = CGPointMake(self.view.center.x, self.view.center.y + 50);
    [self.buttonStopPlaying setTitle:@"stop playing" forState:UIControlStateNormal];
    [self.buttonStopPlaying addTarget:self action:@selector(stopPlayingAudio) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonStopPlaying];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}

-(void)displayMediaPickerAndPlayItem
{
    MPMediaPickerController *mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    if (mediaPicker != nil) {
        NSLog(@"successfully instantiated a media picker");
        mediaPicker.delegate = self;
        mediaPicker.allowsPickingMultipleItems = NO;
        [self.navigationController presentViewController:mediaPicker animated:YES completion:nil];
    }
    
}

-(void)stopPlayingAudio
{
    if (self.myMusicPlayer != nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMusicPlayerControllerPlaybackStateDidChangeNotification object:self.myMusicPlayer];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:self.myMusicPlayer];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMusicPlayerControllerVolumeDidChangeNotification object:self.myMusicPlayer];
        [self.myMusicPlayer stop];
    }
}

#pragma mark -
#pragma mark MPMediaPickerController delegate methods
-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    self.myMusicPlayer = nil;
    self.myMusicPlayer = [[MPMusicPlayerController alloc] init];
    [self.myMusicPlayer beginGeneratingPlaybackNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(musicPlayerStateChanged:) name:MPMusicPlayerControllerPlaybackStateDidChangeNotification object:self.myMusicPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nowPlayingItemIsChanged:) name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:self.myMusicPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeIsChagned) name:MPMusicPlayerControllerVolumeDidChangeNotification object:self.myMusicPlayer];
    
    
    [self.myMusicPlayer setQueueWithItemCollection:mediaItemCollection];
    [self.myMusicPlayer play];
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///未完待续。。。。。。

@end




























