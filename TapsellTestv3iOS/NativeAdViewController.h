//
//  NativeAdViewController.h
//  TapsellTestv3iOS
//
//  Created by Tapsell on 11/8/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapsellSDKv3/TapsellSDKv3.h>

@interface NativeAdViewController : UIViewController
@property (strong, nonatomic) IBOutlet TSNativeBannerAdView *nativeBanner;
@property (strong, nonatomic) IBOutlet TSNativeVideoAdView *nativeVideo;

- (IBAction)onBackClicked:(id)sender;
- (IBAction)requestAd:(id)sender;
- (IBAction)requestNativeVideo:(id)sender;

@end
