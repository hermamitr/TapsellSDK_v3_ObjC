//
//  TSAVPlayerViewController.h
//  Tapsell
//
//  Created by Ali Soltani-Farani on 8/26/15.
//  Copyright (c) 2015 Pegah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TSDirectCreativeModel.h"
#import "TSAdShowOptions.h"

@protocol TSAVPlayerViewControllerDelegate;

@interface TSAVPlayerViewController : UIViewController

-(instancetype) initWithOptions:(TSAdShowOptions *)showOptions forCreativeType:(CreativeType)creativeType;

-(void) resumePlayback;
-(void) replay;
-(NSNumber*) getVideoDuration;
-(void) stopPlayback;
-(BOOL) isVideoPlaying;
-(BOOL) isSkipButtonVisible;
-(void) setSkipButtonVisible:(BOOL)visible;
-(void) prepareForDismiss;

@property (nonatomic, strong, readwrite) NSString * urlString;
@property (nonatomic, strong, readwrite) NSString * videoFilePath;
@property (nonatomic, readwrite) CGRect playerFrame;
@property (nonatomic, weak) id<TSAVPlayerViewControllerDelegate> delegate;

@end

@protocol TSAVPlayerViewControllerDelegate <NSObject>

@optional

-(void) tsAVPlayerViewController: (TSAVPlayerViewController *) tsavpvc didReachEndOfVideoWithUrl: (NSURL *) videoUrl;
-(void) tsAVPlayerViewController:(TSAVPlayerViewController *)tsavpvc couldNotLoadVideoWithUrl:(NSURL *) videoUrl;
-(void) tsAVPlayerViewControllerWillBeDismissedAfterFinishingVideoPlayback;
-(void) tsOnAVPlayerDismissed:(BOOL)finishedVideo;

-(void) tsOnVideoMuted;
-(void) tsOnVideoUnmuted;
-(void) tsOnVideoSkipped;
-(void) tsOnProgressUpdated:(float)progress currentTime:(float)currentTime;

@end
