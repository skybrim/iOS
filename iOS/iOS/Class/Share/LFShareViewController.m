//
//  LF_ShareViewController.m
//  iOS
//
//  Created by mac on 2018/10/19.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LFShareViewController.h"

@interface LFShareViewController ()

@property (nonatomic,strong) UIButton *shareBtn;

@end

@implementation LFShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self layoutPages];
}

#pragma mark - layout
- (void)layoutPages {
    
    self.title = @"分享";
    
    [self.view addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@-100);
    }];
}

#pragma mark - getter
- (UIButton *)shareBtn {
    
    if (!_shareBtn) {
        
        _shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _shareBtn.backgroundColor = [UIColor cyanColor];
        [_shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [_shareBtn sizeToFit];
        
        [_shareBtn bk_whenTapped:^{

            [LFShareHandle showShareView];
        }];
    }
    return _shareBtn;
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
