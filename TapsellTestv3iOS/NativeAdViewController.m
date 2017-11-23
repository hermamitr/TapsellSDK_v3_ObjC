//
//  NativeAdViewController.m
//  TapsellTestv3iOS
//
//  Created by Tapsell on 11/8/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import "NativeAdViewController.h"

@interface NativeAdViewController ()

@end

@implementation NativeAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_nativeVideo setHidden:YES];
    [_nativeBanner setHidden:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBackClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)requestAd:(id)sender {
    [_nativeVideo setHidden:YES];
    [_nativeBanner setHidden:NO];
    NSLog(@"request banner ad");
    [Tapsell requestNativeBannerAdForZone:@"58aa98994684653c04d9b22d"
                         andContainerView:_nativeBanner
                          onRequestFilled:^(void) {
                              NSLog(@"onRequestFilled native banner ad");
                          }
                          onNoAdAvailable:^(void) {
                              NSLog(@"onNoAdAvailable native banner ad");
                          }
                                  onError:^(NSString* error) {
                                      NSLog(@"onError native banner ad : %@", error);
                           }];
}

- (IBAction)requestNativeVideo:(id)sender {
        NSLog(@"request video ad");
        [_nativeVideo setHidden:NO];
        [_nativeBanner setHidden:YES];
        [Tapsell requestNativeVideoAdForZone:@"58aa9d0d4684653c04da4e5e"
                            andContainerView:_nativeVideo
                             onRequestFilled:^(void) {
                                 NSLog(@"onRequestFilled native video ad");
                             }
                             onNoAdAvailable:^(void) {
                                 NSLog(@"onNoAdAvailable native video ad");
                             }
                                     onError:^(NSString* error) {
                                         NSLog(@"onError native video ad : %@", error);
                                     }];
}

@end
