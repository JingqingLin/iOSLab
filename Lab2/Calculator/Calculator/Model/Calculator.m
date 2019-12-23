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
        NSExpression *exp1 = [NSExpression expressionWithFormat:self.disp];
        id value = [exp1 expressionValueWithObject:nil context:nil];
        NSLog(@"result = %f", [value floatValue]);
        _disp = [NSMutableString stringWithString:[value stringValue]];
        return [value stringValue];
    }
    @catch (NSException *exception) {
        _disp = nil;
        return @"error";
    }
}

- (void)clearDisp{
    _disp = nil;
}

@end

