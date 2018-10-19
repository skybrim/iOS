//
//  ShareViewController.m
//  iOS
//
//  Created by mac on 2018/10/17.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "ShareViewController.h"

#import "KMPShareHandle.h"

@interface ShareViewController ()

@property (nonatomic,strong) UIButton *shareBtn;

@end

@implementation ShareViewController

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
           
            [KMPShareHandle sharedKMPShareHandle].shareTitle = @"shareTitle";
            //内容在30字以内
            [KMPShareHandle sharedKMPShareHandle].shareContent = @"shareContent";
            [KMPShareHandle sharedKMPShareHandle].shareImage = [UIImage imageNamed:@"placeholder"];
            [KMPShareHandle sharedKMPShareHandle].shareUrl = @"https://www.baidu.com";
            [[KMPShareHandle sharedKMPShareHandle] showWithVC:self];
            
            [[KMPShareHandle sharedKMPShareHandle] setSuccessBlock:^{
                
                NSLog(@"share-success");
            }];
            
            [[KMPShareHandle sharedKMPShareHandle] setFailureBlock:^(NSError *error) {
                
                NSLog(@"%@",error);
            }];
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
