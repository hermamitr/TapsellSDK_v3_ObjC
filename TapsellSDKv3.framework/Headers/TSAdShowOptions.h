//
//  TSAdShowOptions.h
//  TapsellSDKv3
//
//  Created by Tapsell on 5/13/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#ifndef TSAdShowOptions_h
#define TSAdShowOptions_h

#import <Foundation/Foundation.h>

typedef enum Orientation : NSInteger {
    OrientationLockedPortrait=1,
    OrientationLockedLandscape=2,
    OrientationUnlocked=3,
    OrientationLockedReverserdLandscape=4,
    OrientationLockedReverserdPortrait=5
} Orientation;

@interface TSAdShowOptions : NSObject

@property(nonatomic, strong, readonly) NSNumber* mOrientation;
@property(nonatomic, strong, readonly) NSNumber* mBackDisabled;
@property(nonatomic, strong, readonly) NSNumber* mShowDialog;

-(Orientation) getOrientation;
-(void) setOrientation:(Orientation)orientation;
-(BOOL) getBackDisabled;
-(void) setBackDisabled:(BOOL)backDisabled;
-(BOOL) getShowDialoged;
-(void) setShowDialoged:(BOOL)showDisabled;

@end


#endif /* TSAdShowOptions_h */
