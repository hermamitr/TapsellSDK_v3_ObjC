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
    _nativeBanner.titleLabelTag = 100;
    _nativeBanner.descriptionLabelTag = 101;
    _nativeBanner.logoImageTag = 102;
    _nativeBanner.mainImageTag = 103;
    _nativeBanner.callToActionButtonTag = 104;
    _nativeVideo.titleLabelTag = 1000;
    _nativeVideo.descriptionLabelTag = 1001;
    _nativeVideo.logoImageTag = 1002;
    _nativeVideo.videoViewTag = 1003;
    _nativeVideo.callToActionButtonTag = 1004;
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
    [Tapsell requestNativeBannerAdForZone:@"59c8a9334684656c504f0e19"
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
        [Tapsell requestNativeVideoAdForZone:@"59c8ae514684656c504fce40"
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
