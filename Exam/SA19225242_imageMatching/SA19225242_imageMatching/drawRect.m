//
//  drawRect.m
//  SA19225242_imageMatching
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "drawRect.h"

@implementation drawRect
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

- (void)draw:(CGRect)rectangle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 0.5, 0.5, 0.5);
    CGContextSetLineWidth(context, 5.0);
    CGContextStrokeRect(context,rectangle);
    CGContextStrokePath(context);
}
@end
