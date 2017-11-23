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

-(void) loadTitleIntoLabel:(NSString*)title;
-(void) loadDescriptionIntoLabel:(NSString*)description;
-(void) loadLogoIntoImage:(NSString*)logoUrl;
-(void) loadCallToActionIntoButton:(NSString*)callToActionText;
-(void) commonInit;

@end
