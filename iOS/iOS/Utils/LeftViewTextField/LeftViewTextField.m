//
//  LeftViewTextField.m
//  KMPharmacy
//
//  Created by mac on 2018/5/29.
//  Copyright © 2018年 Kangmei Pharmaceutical Co.,Ltd. All rights reserved.
//

#import "LeftViewTextField.h"

@implementation LeftViewTextField

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 15; //像右边偏15
    return iconRect;
}



//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    CGRect iconRect = [self leftViewRectForBounds:bounds];
    return CGRectMake(iconRect.size.width + iconRect.origin.x + 15, 0, bounds.size.width - (iconRect.size.width + iconRect.origin.x + 15), bounds.size.height);
    
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    CGRect iconRect = [self leftViewRectForBounds:bounds];
    return CGRectMake(iconRect.size.width + iconRect.origin.x + 15, 0, bounds.size.width - (iconRect.size.width + iconRect.origin.x + 15), bounds.size.height);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
