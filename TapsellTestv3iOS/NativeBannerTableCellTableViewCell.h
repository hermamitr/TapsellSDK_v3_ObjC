//
//  NativeBannerTableCellTableViewCell.h
//  TapsellTestv3iOS
//
//  Created by Tapsell on 12/11/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapsellSDKv3/TapsellSDKv3.h>

@interface NativeBannerTableCellTableViewCell : UITableViewCell
@property (strong, nonatomic, readwrite) IBOutlet TSNativeBannerAdView *nativeBanner;
@end
