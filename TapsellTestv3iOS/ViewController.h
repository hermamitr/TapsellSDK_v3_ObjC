//
//  ViewController.h
//  TapsellTestv3iOS
//
//  Created by Tapsell on 5/29/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnRequestAd;
@property (weak, nonatomic) IBOutlet UIButton *btnShowAd;
- (IBAction)requestButtonClicked:(id)sender;
- (IBAction)showButtonClicked:(id)sender;

@end

