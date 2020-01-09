//
//  drawRect.m
//  SA19225242_3
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "drawRect.h"

@implementation drawRect

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

//继承 UIView 重写 drawRect 方法
- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    // (context, r/255, g/255, b/255, 透明度？)
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, 2.0);
    CGContextStrokeRect(context,rect);
    CGContextStrokePath(context);
}
@end
