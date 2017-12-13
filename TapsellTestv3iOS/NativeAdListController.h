//
//  NativeAdListController.h
//  TapsellTestv3iOS
//
//  Created by Tapsell on 12/11/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NativeAdListController : UIViewController <UITableViewDelegate, UITableViewDataSource>
- (IBAction)onBackClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong, readonly) NSMutableArray* listData;
@end
