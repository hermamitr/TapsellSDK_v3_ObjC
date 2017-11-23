//
//  ViewController.h
//  TapsellTestv3iOS
//
//  Created by Tapsell on 5/29/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapsellSDKv3/TapsellSDKv3.h>

@interface ViewController : UIViewController <TSBannerAdDelegate>
@property (strong, nonatomic) IBOutlet TSNativeBannerAdView *nativeBanner;

// connect TSBannerAdView outlet
@property (strong, nonatomic) IBOutlet TSBannerAdView *bannerAdView;

@property (weak, nonatomic) IBOutlet UIButton *btnRequestAd;
@property (weak, nonatomic) IBOutlet UIButton *btnShowAd;
@property (strong, nonatomic) IBOutlet UIView *btnNativeAd;

- (IBAction)requestButtonClicked:(id)sender;
- (IBAction)showButtonClicked:(id)sender;
- (IBAction)nativeAdClicked:(id)sender;

@end
