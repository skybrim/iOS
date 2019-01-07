//
//  MarqueeView.m
//  KMPharmacy
//
//  Created by mac on 2018/5/10.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "MarqueeView.h"

@interface MarqueeView()

@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) CADisplayLink *marqueeDisplayLink;
@property (nonatomic,assign) BOOL isReversing;

@end

@implementation MarqueeView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    //当视图将被移除父视图的时候，newSuperview就为nil。在这个时候，停止掉CADisplayLink，断开循环引用，视图就可以被正确释放掉了。
    
    if (newSuperview == nil) {
        
        [self stopMarquee];
    }
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self initializeViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initializeViews];
    }
    return self;
}

- (void)initializeViews {
    
    self.type = left;
    self.contentMargin = 12.0;
    self.frameInterval = 1;
    self.pointsPerFrame = 0.5;
    self.isReversing = NO;
    
    
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    self.containerView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.containerView];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    UIView *validContentView = self.contentView;
    
    for (UIView *view in self.containerView.subviews) {
        [view removeFromSuperview];
    }
    
    //对于复杂的视图，需要自己重写contentView的sizeThatFits方法，返回正确的size
    [validContentView sizeToFit];
    validContentView.frame = CGRectMake(0, 0, validContentView.bounds.size.width, self.bounds.size.height);
    [self.containerView addSubview:validContentView];
    
    if (self.type == reverse) {
        self.containerView.frame = CGRectMake(0, 0, validContentView.bounds.size.width, self.bounds.size.height);
    }
    else {
        self.containerView.frame = CGRectMake(0, 0, validContentView.bounds.size.width*2 + self.contentMargin, self.bounds.size.height);
    }
    
    if (validContentView.bounds.size.width > self.bounds.size.width) {
        
        if (self.type != reverse) {
             //UIView是没有遵从拷贝协议的。可以通过UIView支持NSCoding协议，间接来复制一个视图
            NSData *otherContentViewData = [NSKeyedArchiver archivedDataWithRootObject:validContentView];
            UIView *otherContentView = [NSKeyedUnarchiver unarchiveObjectWithData:otherContentViewData];
            otherContentView.frame = CGRectMake(validContentView.bounds.size.width + self.contentMargin, 0, validContentView.bounds.size.width, self.bounds.size.height);
            [self.containerView addSubview:otherContentView];
        }
        
        [self startMarquee];

    }
}

//如果你的contentView的内容在初始化的时候，无法确定。需要通过网络等延迟获取，那么在内容赋值之后，在调用该方法即可。
- (void)reloadData {
    
    [self setNeedsLayout];
}

- (void)startMarquee {
    
    [self stopMarquee];
    if (self.type == right) {
        CGRect frame = self.containerView.frame;
        frame.origin.x = self.bounds.size.width - frame.size.width;
        self.containerView.frame = frame;
    }
    
    self.marqueeDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(processMarquee)];
    self.marqueeDisplayLink.frameInterval = self.frameInterval;
    [self.marqueeDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopMarquee {
    [self.marqueeDisplayLink invalidate];
    self.marqueeDisplayLink = nil;
}

- (void)processMarquee {
    
    CGRect frame = self.containerView.frame;
    switch (self.type) {
        case left:
        {
            
            CGFloat targetX = -(self.contentView.bounds.size.width + self.contentMargin);
            if (frame.origin.x <= targetX) {
                frame.origin.x = 0;
                self.containerView.frame = frame;
            }
            else {
                frame.origin.x -= self.pointsPerFrame;
                if (frame.origin.x < targetX) {
                    frame.origin.x = targetX;
                }
                self.containerView.frame = frame;
            }
            
        }
            break;
        
        case right:
        {
            CGFloat targetX = self.bounds.size.width - self.contentView.bounds.size.width;
            if (frame.origin.x >= targetX) {
                frame.origin.x = self.bounds.size.width - self.containerView.bounds.size.width;
                self.containerView.frame = frame;
            }
            else {
                frame.origin.x += self.pointsPerFrame;
                if (frame.origin.x > targetX) {
                    frame.origin.x = targetX;
                }
                self.containerView.frame = frame;
            }
            
        }
            break;
        case reverse:
        {
         
            if (self.isReversing) {
                
                CGFloat targetX = 0.0;
                if (frame.origin.x > targetX) {
                    frame.origin.x = 0;
                    self.containerView.frame = frame;
                    self.isReversing = NO;
                }
                else {
                    frame.origin.x += self.pointsPerFrame;
                    if (frame.origin.x > 0) {
                        frame.origin.x = 0;
                        self.isReversing = NO;
                    }
                    self.containerView.frame = frame;
                }
                
            }
            else {
                
                CGFloat targetX = self.bounds.size.width - self.containerView.bounds.size.width;
                if (frame.origin.x <= targetX) {
                    self.isReversing = YES;
                }
                else {
                    frame.origin.x -= self.pointsPerFrame;
                    if (frame.origin.x < targetX) {
                        frame.origin.x = targetX;
                        self.isReversing = YES;
                    }
                    self.containerView.frame = frame;
                }
            }
            
        }
            break;
    }
}


#pragma mark -
- (UIView *)containerView {
    
    if (!_containerView) {
        
        _containerView = [[UIView alloc] init];
    }
    return _containerView;
}

- (UIView *)contentView {
    
    if (!_contentView) {
        
        _contentView = [[UIView alloc] init];
        [_contentView setNeedsLayout];
    }
    return _contentView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
