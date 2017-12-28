//
//  BannerAdView.h
//  TapsellSDKv3
//
//  Created by Tapsell on 10/26/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum BannerType : NSInteger {
    BANNER_320x50=1,
    BANNER_320x100=2,
    BANNER_250x250=3,
    BANNER_300x250=4
} BannerType;

@protocol TSBannerAdDelegate;

@interface TSBannerAdView : UIWebView <UIWebViewDelegate>
    @property (nonatomic, strong) NSNumber* bannerType;
    @property (nonatomic, strong) NSString* zoneId;
-(void) loadAdWithZoneId:(NSString*)zoneId andBannerType:(NSNumber*)bannerType;

    @property (nonatomic, weak) id<TSBannerAdDelegate> bannerDelegate;
@end

@protocol TSBannerAdDelegate <NSObject>

-(void) tsBannerAdHideBannerAdView;

-(void) tsBannerAdNoAdAvailable;
-(void) tsBannerAdOnRequestFilled;
@end
