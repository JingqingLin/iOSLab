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

- (NSString *)sin:(NSString *)content {
    double d = [content doubleValue];
    double result = sin(d);
    NSLog(@"sin(%lf) = %lf", d, result);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)cos:(NSString *)content {
    double d = [content doubleValue];
    double result = cos(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)tan:(NSString *)content {
    double d = [content doubleValue];
    double result = tan(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)power3:(NSString *)content {
    double d = [content doubleValue];
    double result = d * d * d;
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)asin:(NSString *)content {
    double d = [content doubleValue];
    double result = asin(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)acos:(NSString *)content {
    double d = [content doubleValue];
    double result = acos(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)atan:(NSString *)content {
    double d = [content doubleValue];
    double result = atan(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)ln:(NSString *)content {
    double d = [content doubleValue];
    double result = log(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)sinh:(NSString *)content {
    double d = [content doubleValue];
    double result = sinh(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)cosh:(NSString *)content {
    double d = [content doubleValue];
    double result = cosh(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)tanh:(NSString *)content {
    double d = [content doubleValue];
    double result = tanh(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    return [n stringValue];
}

- (NSString *)log:(NSString *)content {
    double d = [content doubleValue];
    double result = log10(d);
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
