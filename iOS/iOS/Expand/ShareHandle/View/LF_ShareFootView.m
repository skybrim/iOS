//
//  LF_ShareFootView.m
//  iOS
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LF_ShareFootView.h"

@implementation LF_ShareFootView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];

        [self addSubview:self.footLabel];
        [self.footLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
    return self;
}

#pragma mark -getter

- (UILabel *)footLabel {
    
    if (!_footLabel) {
        
        _footLabel = [[UILabel alloc] init];
        _footLabel.textColor = [UIColor colorWithRed:65/255.0 green:65/255.0 blue:65/255.0 alpha:1];
        _footLabel.textAlignment = NSTextAlignmentCenter;
        _footLabel.text = @"我是底部";
    }
    return _footLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
