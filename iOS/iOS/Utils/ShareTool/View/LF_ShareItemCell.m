//
//  LF_ShareViewCell.m
//  iOS
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareItemCell.h"

@implementation LF_ShareItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.shareItemImageView];
        [self.shareItemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.top.equalTo(@20);
            make.size.mas_equalTo(CGSizeMake(62, 62));
        }];
        
        [self.contentView addSubview:self.shareItemLabel];
        [self.shareItemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@-20);
            make.centerX.equalTo(@0);
            make.height.mas_equalTo(18);
        }];
    }
    return self;
}

#pragma mark - getter
- (UIImageView *)shareItemImageView {
    
    if (!_shareItemImageView) {
        
        _shareItemImageView = [[UIImageView alloc] init];
//        _shareItemImageView.backgroundColor = [UIColor whiteColor];
    }
    return _shareItemImageView;
}

- (UILabel *)shareItemLabel {
    
    if (!_shareItemLabel) {
        
        _shareItemLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _shareItemLabel.font = [UIFont systemFontOfSize:12];
        _shareItemLabel.textColor = [UIColor blackColor];
        [_shareItemLabel sizeToFit];
    }
    return _shareItemLabel;
}
@end
