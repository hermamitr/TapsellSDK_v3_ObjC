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
#import <UIKit/UIKit.h>
#import "NativeAdViewController.h"
#import "NativeAdListController.h"

@interface ViewController ()

@property (strong, nonatomic) TapsellAd * tapsellAd;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.bannerAdView loadAdWithZoneId:@"59a27ab94684655433e74ef8" andBannerType:BANNER_250x250];
    
    TSConfiguration* config = [[TSConfiguration alloc] init];
    [config setDebugMode:YES];
    [Tapsell initializeWithAppKey:@"nmgaencpajlfecantijkeejrllkbqjokmtfaqgahbgbefhghhmorknlqotlbeaoolbgger" andConfig:config];
 
    //NSString* vastUrl = [TapsellVAST getVastUrlForZone:@"5913110746846551e1340acf" withType:PrerollTypeShort ofVastVersion:VAST3];
    //NSLog(@"%@", [NSString stringWithFormat:@"vastUrl: %@",vastUrl]);
    [self.btnShowAd setHidden:YES];
    self.btnRequestAd.titleLabel. numberOfLines = 0; // Dynamic number of lines
    self.btnRequestAd.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    [Tapsell setAdShowFinishedCallback:^(TapsellAd *ad, BOOL completed) {
        NSLog(@"completed? %d",completed);
        if([ad isRewardedAd] && completed)
        {
            NSLog(@"Congratulations! 1 coin awarded.");
        }
    }];
}

- (IBAction)requestButtonClicked:(id)sender{
    NSLog(@"requestButtonClicked");
    if(self.tapsellAd==nil)
    {
        [self.btnRequestAd setTitle:@"Fetching..." forState:UIControlStateNormal];
        TSAdRequestOptions* requestOptions = [[TSAdRequestOptions alloc] init];
        [requestOptions setCacheType:CacheTypeStreamed];
        [Tapsell requestAdForZone:@"5a326023d005ec0001199256"
                       andOptions:requestOptions
                    onAdAvailable:^(TapsellAd *ad){
                        NSLog(@"AdAvailable");
//                        NSLog([ad getId]);
                        self.tapsellAd = ad;
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            
                            [self.btnRequestAd setTitle:@"Ready" forState:UIControlStateNormal];
                            [self.btnShowAd setHidden:NO];
                            
                        }];
                    }
                  onNoAdAvailable:^{
                      NSLog(@"NoAdAvailable");
                      [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                          
                          [self.btnRequestAd setTitle:@"No ad available,\nClick to Retry" forState:UIControlStateNormal];
                          
                      }];
                  }
                          onError:^(NSString* error){
                              NSLog(@"%@", [NSString stringWithFormat:@"No ad available, error:%@",error]);
                              [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                  
                                  [self.btnRequestAd setTitle:@"Error occured,\nClick to Retry" forState:UIControlStateNormal];
                                  
                              }];
                          }
                       onExpiring:^(TapsellAd *ad){
                           NSLog(@"Expiring");
                       }];
    }
//    [self.btnShowAd setHidden:YES];
}

- (IBAction)showButtonClicked:(id)sender{
    NSLog(@"showButtonClicked");
    
    if(self.tapsellAd!=nil)
    {
        TSAdShowOptions* showOptions = [[TSAdShowOptions alloc] init];
        [showOptions setOrientation:OrientationUnlocked];
        [showOptions setBackDisabled:NO];
        [showOptions setShowDialoge:YES];
        [self.tapsellAd showWithOptions:showOptions
                      andOpenedCallback:^(TapsellAd * _Nullable ad) {
                          NSLog(@"Opened!");
                      }
                      andClosedCallback:^(TapsellAd * _Nullable ad) {
                          NSLog(@"Closed!");
                      }
         ];
        self.tapsellAd = nil;
        [self.btnShowAd setHidden:YES];
        [self.btnRequestAd setTitle:@"Request Ad" forState:UIControlStateNormal];
    }
}

- (IBAction)nativeAdClicked:(id)sender {
    NSLog(@"NATIVE CLICKED");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"NativeAd" bundle:nil];
    NativeAdViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"NativeAdViewController"];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)nativeAdListClicked:(id)sender {
    NSLog(@"LIST CLICKED");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"NativeAdList" bundle:nil];
    NativeAdListController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"NativeAdListController"];
    [self presentViewController:viewController animated:YES completion:nil];
}

-(void) tsBannerAdNoAdAvailable {
    NSLog(@"BANNER_AD: No Banner Ad Available");
}

-(void) tsBannerAdHideBannerAdView {
    NSLog(@"BANNER_AD: Banner Ad view is hidden!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
