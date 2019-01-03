//
//  ShareView.m
//  iOS
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 Mr.T. All rights reserved.
//

#import "LFShareFatherView.h"


@implementation LFShareFatherView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.headHeight = 0;
        self.footHeight = 0;
        self.contentHeight = 250.0;
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        
        [self addSubview:self.backgroundView];
        [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
    return self;
}

#pragma mark - private
- (void)cancelShare {
    
    [self removeFromSuperview];
}

#pragma mark - layoutPages
- (void)layoutPages {
 
    [self.shareFootView removeFromSuperview];
    [self.shareContentView removeFromSuperview];
    [self.shareHeadView removeFromSuperview];
    
    CGFloat bottomSafeHeight = [UIApplication sharedApplication].statusBarFrame.size.height == 44? 34:0;
    
    [self addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-bottomSafeHeight));
        make.left.equalTo(@0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(44);
    }];
    
    [self addSubview:self.shareFootView];
    [self.shareFootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cancelBtn.mas_top).offset(0);
        make.left.equalTo(@0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(@(self.footHeight));
    }];
    
    [self addSubview:self.shareContentView];
    [self.shareContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.equalTo(self.shareFootView.mas_top).offset(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(@(self.contentHeight));
    }];
    
    [self addSubview:self.shareHeadView];
    [self.shareHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.shareContentView.mas_top).offset(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(@(self.headHeight));
    }];
    
}

#pragma mark - getter

- (UIControl *)backgroundView {
 
    if (!_backgroundView) {
        
        _backgroundView = [[UIControl alloc] init];
        [_backgroundView addTarget:self action:@selector(cancelShare) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundView;
}

- (UIView *)shareHeadView {
    
    if (!_shareHeadView) {
        
        _shareHeadView = [[LF_ShareHeadView alloc] initWithFrame:CGRectZero];
    }
    return _shareHeadView;
}

- (UIView *)shareFootView {
    
    if (!_shareFootView) {
        
        _shareFootView = [[LF_ShareFootView alloc] initWithFrame:CGRectZero];
    }
    return _shareFootView;
}

- (UIView *)shareContentView {
    
    if (!_shareContentView) {
        
        _shareContentView = [[LF_ShareContentView alloc] initWithFrame:CGRectZero];
    }
    return _shareContentView;
}

- (UIButton *)cancelBtn {
 
    if (!_cancelBtn) {
        
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn setBackgroundColor:[UIColor whiteColor]];
    }
    return _cancelBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
