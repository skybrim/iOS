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
            make.center.equalTo(@0);
        }];
    }
    return self;
}

#pragma mark - getter
- (UIImageView *)shareItemImageView {
    
    if (!_shareItemImageView) {
        
        _shareItemImageView = [[UIImageView alloc] init];
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
