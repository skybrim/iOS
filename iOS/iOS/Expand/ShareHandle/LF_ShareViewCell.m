//
//  LF_ShareViewCell.m
//  iOS
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareViewCell.h"

@implementation LF_ShareViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark - getter
- (UIImageView *)shareItemImageView {
    
    if (!_shareItemImageView) {
        
    }
    return _shareItemImageView;
}

- (UILabel *)shareItemLabel {
    
    if (!_shareItemLabel) {
        
    }
    return _shareItemLabel;
}
@end
