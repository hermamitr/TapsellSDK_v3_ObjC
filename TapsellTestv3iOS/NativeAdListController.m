//
//  NativeAdListController.m
//  TapsellTestv3iOS
//
//  Created by Tapsell on 12/11/17.
//  Copyright © 2017 Tapsell. All rights reserved.
//

#import "NativeAdListController.h"
#import "NativeBannerTableCellTableViewCell.h"
#import "NativeVideoTableViewCell.h"

@interface NativeAdListController ()
@property(nonatomic, strong, readwrite) NSMutableArray* listData;
@property (strong, nonatomic, readwrite) TSNativeBannerAdView *nativeBanner;
@end

@implementation NativeAdListController

- (void)viewDidLoad {
    [super viewDidLoad];
    _listData = [NSMutableArray arrayWithObjects:@"item1",@"item1",@"item1",@"item1",@"item1",@"item1",@"bannerAd",@"item1",@"item1",@"item1",@"item1",@"videoAd",@"item1",@"item1",nil];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_listData count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    if(indexPath.row == 6) {
        NativeBannerTableCellTableViewCell * cell = (NativeBannerTableCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BannerAdItem"];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NativeBannerTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [Tapsell requestNativeBannerAdForZone:@"5a291e3edc93ee00017fad23"
                                 andContainerView:cell.nativeBanner
                                  onRequestFilled:^(void) {
                                      NSLog(@"onRequestFilled native banner ad");
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          NativeBannerTableCellTableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                                          [cell reloadInputViews];
                                      });
                                  }
                                  onNoAdAvailable:^(void) {
                                      NSLog(@"onNoAdAvailable native banner ad");
                                  }
                                          onError:^(NSString* error) {
                                              NSLog(@"onError native banner ad : %@", error);
                                          }];
        }
        return cell;
    }
    else if(indexPath.row == 12) {
        NativeVideoTableViewCell * cell = (NativeVideoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"VideoAdItem"];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NativeVideoTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [Tapsell requestNativeVideoAdForZone:@"5a28eeffd005ec0001b386c6"
                                 andContainerView:cell.nativeVideo
                                  onRequestFilled:^(void) {
                                      NSLog(@"onRequestFilled native banner ad");
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          NativeVideoTableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                                          [cell reloadInputViews];
                                      });
                                  }
                                  onNoAdAvailable:^(void) {
                                      NSLog(@"onNoAdAvailable native banner ad");
                                  }
                                          onError:^(NSString* error) {
                                              NSLog(@"onError native banner ad : %@", error);
                                          }];
        }
        return cell;
    }
    else {
        NativeBannerTableCellTableViewCell * cell = (NativeBannerTableCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BannerAdItem"];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NativeBannerTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 12) {
        return 281;
    }
    return 232;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)onBackClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
