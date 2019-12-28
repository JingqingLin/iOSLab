//
//  Advanced.m
//  Calculator
//
//  Created by 林靖清 on 2019/12/28.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "Advanced.h"

@implementation Advanced
- (NSString *)sqrt:(NSString *)content
{
    double d=[content doubleValue];
    double result=sqrt(d);
    NSNumber *n=[[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

//覆盖父类方法
- (void) delNumber
{
    long len = self.disp.length - 1;
    if (len >= 0)
    {
        [self.disp deleteCharactersInRange:NSMakeRange(len, 1)];
        [_screen deleteCharactersInRange:NSMakeRange(len, 1)];
    }
    
}
@end
