//
//  Calculator.m
//  Calculator
//
//  Created by 林靖清 on 2019/12/23.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

//重载 get 方法
- (NSMutableString *)disp{
    if(!_disp){
        _disp = [[NSMutableString alloc] init];
    }
    return _disp;
}

- (void) delNumber{
    long len = _disp.length - 1;
    if(len >= 0){
        //删除指定位置字符
        [_disp deleteCharactersInRange:NSMakeRange(len, 1)];
    }
}

- (NSString *)computedResult{
    @try {
        if ([_disp containsString:@"/0"]) {
            _disp = nil;
            return @"Error";
        }
            
        if ([_disp containsString:@"/"] && ![_disp containsString:@"."]) {
            NSLog(@"YES");
            NSRange range = NSMakeRange(0, [_disp length]);
            [_disp replaceOccurrencesOfString:@"/" withString:@".0/" options:NSCaseInsensitiveSearch range:range];
            NSLog(@"%@", _disp);
        }
        NSExpression *exp = [NSExpression expressionWithFormat:_disp];
        id value = [exp expressionValueWithObject:nil context:nil];
        NSLog(@"result = %f", [value floatValue]);
        _disp = [NSMutableString stringWithString:[value stringValue]];
        return [value stringValue];
    }
    @catch (NSException *exception) {
        _disp = nil;
        return @"Error";
    }
}

- (void)clearDisp{
    _disp = nil;
}

@end

