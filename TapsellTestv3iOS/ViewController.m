//
//  ViewController.m
//  TapsellTestv3iOS
//
//  Created by Tapsell on 5/29/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import "ViewController.h"

#import <TapsellSDKv3/TapsellSDKv3.h>
#import <Foundation/Foundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TSConfiguration* config = [[TSConfiguration alloc] init];
    [config setDebugMode:YES];
    [Tapsell initializeWithAppKey:@"mioeqormndnommjqoapteerhkhccdttralkisksfabprknrthaagbofcohiojadbiqhcrc" andConfig:config];
    
    //NSString* vastUrl = [TapsellVAST getVastUrlForZone:@"5913110746846551e1340acf" withType:PrerollTypeShort ofVastVersion:VAST3];
    //NSLog(@"%@", [NSString stringWithFormat:@"vastUrl: %@",vastUrl]);
    
    TSAdRequestOptions* requestOptions = [[TSAdRequestOptions alloc] init];
    [requestOptions setCacheType:CacheTypeCached];
    
    [Tapsell setAdShowFinishedCallback:^(TapsellAd *ad, BOOL completed) {
        NSLog(@"completed? %d",completed);
        if([ad isRewardedAd] && completed)
        {
            NSLog(@"Congratulations! 1 coin awarded.");
        }
    }];
    
    [Tapsell requestAdForZone:@"592be81646846575539c6a25"
                   andOptions:requestOptions
                onAdAvailable:^(TapsellAd *ad){
                    NSLog(@"AdAvailable");
                    TSAdShowOptions* showOptions = [[TSAdShowOptions alloc] init];
                    [showOptions setOrientation:OrientationUnlocked];
                    [showOptions setBackDisabled:YES];
                    [showOptions setShowDialoge:YES];
                    [ad showWithOptions:showOptions];
                }
              onNoAdAvailable:^{
                  NSLog(@"NoAdAvailable");
              }
                      onError:^(NSString* error){
                          NSLog(@"%@", [NSString stringWithFormat:@"No ad available, error:%@",error]);
                      }
                   onExpiring:^(TapsellAd *ad){
                       NSLog(@"Expiring");
                   }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
