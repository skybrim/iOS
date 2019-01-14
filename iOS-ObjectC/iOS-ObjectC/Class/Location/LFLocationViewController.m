//
//  LFLocationViewController.m
//  iOS-ObjectC
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019 skybrim. All rights reserved.
//

#import "LFLocationViewController.h"

#import "AppDelegate+AMAP.h"

@interface LFLocationViewController ()

@property (nonatomic,strong) UIButton *locationBtn;

@end

@implementation LFLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self layoutPages];
}

#pragma mark - layout
- (void)layoutPages {
    
    self.title = @"定位";
    
    [self.view addSubview:self.locationBtn];
    [self.locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@-100);
    }];
}

#pragma mark - getter
- (UIButton *)locationBtn {
    
    if (!_locationBtn) {
        
        _locationBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _locationBtn.backgroundColor = [UIColor cyanColor];
        [_locationBtn setTitle:@"定位" forState:UIControlStateNormal];
        [_locationBtn sizeToFit];
        
        [_locationBtn bk_whenTapped:^{
            
            AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [appDelegate LF_getCurrentLocationWithSuccess:^(CLLocation * _Nonnull location, AMapLocationReGeocode * _Nonnull regeocode) {
                
                NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
                if (regeocode) {
                    NSLog(@"reGeocode:%@", regeocode);
                }
                
            } failure:^(NSError * _Nonnull error) {
                
                NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            }];
        }];
    }
    return _locationBtn;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
