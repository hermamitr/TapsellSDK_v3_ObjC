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
@property (strong, nonatomic, readwrite) TSNativeVideoAdView *nativeVideo;
@property (strong, nonatomic, readwrite) TSNativeBannerBundle *nativeBannerBundle;
@property (strong, nonatomic, readwrite) TSNativeVideoBundle *nativeVideoBundle;
@end

@implementation NativeAdListController

- (void)viewDidLoad {
    [super viewDidLoad];
    _listData = [NSMutableArray arrayWithObjects:@"item1",@"item1",@"item1",@"item1",@"item1",@"item1",@"bannerAd",@"item1",@"item1",@"item1",@"item1",@"videoAd",@"item1",@"item1",nil];
    
    NativeBannerTableCellTableViewCell * cell;
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NativeBannerTableCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    _nativeBanner = cell.nativeBanner;
    [Tapsell requestNativeBannerAdForZone:@"5a291e3edc93ee00017fad23"
                         andContainerView:_nativeBanner
                          onRequestFilled:^(void) {
                              NSLog(@"onRequestFilled native banner ad");
                              _nativeBannerBundle = [_nativeBanner getBundle];
                          }
                          onNoAdAvailable:^(void) {
                              NSLog(@"onNoAdAvailable native banner ad");
                          }
                                  onError:^(NSString* error) {
                                      NSLog(@"onError native banner ad : %@", error);
                                  }];
    
    NativeVideoTableViewCell * cellV = (NativeVideoTableViewCell *)[_tableView dequeueReusableCellWithIdentifier:@"VideoAdItem"];
    NSArray *nibV = [[NSBundle mainBundle] loadNibNamed:@"NativeVideoTableCell" owner:self options:nil];
    cellV = [nibV objectAtIndex:0];
    _nativeVideo = cellV.nativeVideo;
    [Tapsell requestNativeVideoAdForZone:@"5a28eeffd005ec0001b386c6"
                        andContainerView:cellV.nativeVideo
                         onRequestFilled:^(void) {
                             NSLog(@"onRequestFilled native banner ad");
                             _nativeVideoBundle = [_nativeVideo getBundle];
                         }
                         onNoAdAvailable:^(void) {
                             NSLog(@"onNoAdAvailable native banner ad");
                         }
                                 onError:^(NSString* error) {
                                     NSLog(@"onError native banner ad : %@", error);
                                 }];

}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_listData count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 6) {
        NativeBannerTableCellTableViewCell * cell = (NativeBannerTableCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BannerAdItem"];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NativeBannerTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [cell.nativeBanner fillWithBundle:_nativeBannerBundle];
        }
        return cell;
    }
    else if(indexPath.row == 12) {
        NativeVideoTableViewCell * cell = (NativeVideoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"VideoAdItem"];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NativeVideoTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [cell.nativeVideo fillWithBundle:_nativeVideoBundle];
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
