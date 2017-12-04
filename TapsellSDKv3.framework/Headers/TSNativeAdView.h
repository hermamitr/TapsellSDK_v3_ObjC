//
//  TSNativeAdView.h
//  TapsellSDKv3
//
//  Created by Tapsell on 11/16/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSNativeAdView : UIView

@property(nonatomic, readonly) NSInteger titleLabelTag;
@property(nonatomic, readonly) NSInteger descriptionLabelTag;
@property(nonatomic, readonly) NSInteger logoImageTag;
@property(nonatomic, readonly) NSInteger callToActionButtonTag;

-(BOOL) loadTitleIntoLabel:(NSString*)title;
-(BOOL) loadDescriptionIntoLabel:(NSString*)description;
-(BOOL) loadLogoIntoImage:(NSString*)logoUrl;
-(BOOL) loadCallToActionIntoButton:(NSString*)callToActionText;
-(void) commonInit;

@end
