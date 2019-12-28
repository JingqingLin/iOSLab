//
//  Advanced.m
//  Calculator
//
//  Created by 林靖清 on 2019/12/28.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "AdvancedCalculator.h"

@implementation AdvancedCalculator

- (id)init {
    self = [super init];
    if (self) {
        self.screen = [NSMutableString stringWithString:@""];
    }
    return self;
}

- (NSString *)sqrt:(NSString *)content {
    double d = [content doubleValue];
    if (d < 0) {
        return @"error";
    }
    double result = sqrt(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)abs:(NSString *)content {
    double d = [content doubleValue];
    double result = fabs(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)inverse:(NSString *)content {
    double d = [content doubleValue];
    double result = 1.0 / d;
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)power2:(NSString *)content {
    double d = [content doubleValue];
    double result = d * d;
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

//覆盖父类方法
- (void) delNumber {
    long len = self.disp.length - 1;
    if (len >= 0)
    {
        [self.disp deleteCharactersInRange:NSMakeRange(len, 1)];
        [_screen deleteCharactersInRange:NSMakeRange(len, 1)];
    }
    
}
@end
