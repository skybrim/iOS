//
//  LF_ShareHeadView.m
//  iOS
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LFShareHeadView.h"

@implementation LFShareHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.headLabel];
        [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
    return self;
}

#pragma mark -getter

- (UILabel *)headLabel {
 
    if (!_headLabel) {
        
        _headLabel = [[UILabel alloc] init];
        _headLabel.textColor = [UIColor colorWithRed:65/255.0 green:65/255.0 blue:65/255.0 alpha:1];
        _headLabel.textAlignment = NSTextAlignmentCenter;
        _headLabel.text = @"我是头部";
    }
    return _headLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
