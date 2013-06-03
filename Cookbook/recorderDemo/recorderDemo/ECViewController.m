//
//  ECViewController.m
//  recorderDemo
//
//  Created by 陈 海涛 on 13-6-3.
//  Copyright (c) 2013年 陈 海涛. All rights reserved.
//

#import "ECViewController.h"
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>


@interface ECViewController () <AVAudioPlayerDelegate,AVAudioRecorderDelegate>
@property (nonatomic,strong) AVAudioPlayer *audioPlayer;
@property (nonatomic,strong) AVAudioRecorder *audioRecorder;

-(NSString *)audioRecordingPath;
-(NSDictionary *)audioRecordingSetting;

@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSError *error = nil;
    NSString *filePath = [self audioRecordingPath];
    NSURL *audioRecordingURL = [NSURL fileURLWithPath:filePath];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *err= nil;
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&err];
    if (err) {
        NSLog(@"audioSession: %@ %d %@",err.domain,err.code,err.userInfo.description);
    }
    [audioSession setActive:YES error:&err];
    if (err) {
        NSLog(@"audioSession: %@ %d %@",err.domain,err.code,err.userInfo.description);
    }
    
    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:audioRecordingURL settings:[self audioRecordingSetting] error:&error];
    if (self.audioRecorder != nil) {
        self.audioRecorder.delegate = self;
        self.audioRecorder.meteringEnabled = YES;
        BOOL audioHWAvaible = audioSession.inputAvailable;
        if (audioHWAvaible) {
            if ([self.audioRecorder prepareToRecord]) {
                [self.audioRecorder record];
                NSLog(@"Successfully started record");
                [self performSelector:@selector(stopRecordingOnAudioRecorder:) withObject:self.audioRecorder afterDelay:5.0f];
            }
            
        }else{
            NSLog(@"Failed to record");
            self.audioRecorder = nil;
        }
    }else{
        NSLog(@"Failed to create an instance of audio recorder");
    }
}

-(NSString *)audioRecordingPath
{
    NSString *result = nil;
    
    NSArray *folders =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    
    NSString *documentsFolder = [folders objectAtIndex:0];
    
    result = [documentsFolder
              stringByAppendingPathComponent:@"Recording.caf"];
    
    return result;
}

-(NSDictionary *)audioRecordingSetting
{
    NSDictionary *result = nil;
    NSMutableDictionary *recordSetting = [NSMutableDictionary dictionary];
    //录音设置
    
    //录音格式
    [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey: AVFormatIDKey];
    //采样率
    [recordSetting setValue :[NSNumber numberWithFloat:44100] forKey: AVSampleRateKey];
    //通道数
    [recordSetting setValue :[NSNumber numberWithInt:2] forKey: AVNumberOfChannelsKey];
    //线性采样位数
    [recordSetting setValue :[NSNumber numberWithInt:16] forKey: AVLinearPCMBitDepthKey];
    
    
    result = [NSDictionary dictionaryWithDictionary:recordSetting];
    
    return result;
}

-(void)stopRecordingOnAudioRecorder:(AVAudioRecorder*)recorder
{
    [recorder stop];
}

#pragma mark -
#pragma audioRecorder  delegate methods
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    if (flag) {
        NSLog(@"Successfully stopped the audio recording process");
        NSError *readingError = nil;
        NSData *fileData = [NSData dataWithContentsOfFile:self.audioRecordingPath options:NSDataReadingMapped error:&readingError];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
        if (self.audioPlayer != nil) {
            self.audioPlayer.delegate = self;
            if ([self.audioPlayer prepareToPlay]) {
                [self.audioPlayer play];
                NSLog(@"started playing the recorded audio");
            }else{
                NSLog(@"Could not play the audio");
            }
        }else{
            NSLog(@"Failed to create an audio player");
        }
    }else{
        NSLog(@"Stopping the audio recording failed");
    }
    self.audioRecorder = nil;
}

-(void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder
{
    
}
-(void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder withOptions:(NSUInteger)flags
{
    if (flags == AVAudioSessionInterruptionOptionShouldResume) {
        [recorder record];
    }
}


#pragma audioPlayer delegate method

-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    
}
-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags
{
    if (flags == AVAudioSessionInterruptionOptionShouldResume) {
        [player play];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (flag) {
        NSLog(@"Audio player stopped correctly");
    }else{
        NSLog(@"Audio player did not stop correctly");
    }
    if ([player isEqual:self.audioPlayer]) {
        self.audioPlayer = nil;
    }
}

#pragma mark -


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        if ([self.audioRecorder isRecording]) {
            [self.audioRecorder stop];
        }
        if ([self.audioPlayer isPlaying]) {
            [self.audioPlayer stop];
        }
        self.audioPlayer = nil;
        self.audioRecorder = nil;
    }
    
}

@end









