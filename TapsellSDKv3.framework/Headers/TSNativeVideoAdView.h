//
//  TSNativeVideoAdView.h
//  TapsellSDKv3
//
//  Created by Tapsell on 11/16/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSNativeAdView.h"
#import "TSAVPlayerViewController.h"

@interface TSNativeVideoAdView : TSNativeAdView <TSAVPlayerViewControllerDelegate>

@property(nonatomic, readonly) NSInteger videoViewTag;

-(void) loadAd:(NSObject*)ad;

@end
