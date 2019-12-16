//
//  Arithmetic.m
//  Arithmetic
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "Arithmetic.h"

@implementation Arithmetic

-(NSArray *)validOperator{
    NSArray * opers = @[@"+", @"-", @"*", @"/", @"%", @"(", @")", @"="];
    return opers;
}

-(NSDictionary *)inStackPriority{
    return @{@"(":@1, @"*":@5, @"/":@5, @"%":@5, @"+":@3, @"-":@3, @")":@8, @"=":@0 };
}

-(NSDictionary *)outStackPriority{
    return @{@"(":@8, @"*":@4, @"/":@4, @"%":@4, @"+":@2, @"-":@2, @")":@1, @"=":@0 };
}

-(BOOL)isLegal:(NSString *)str{
    return YES;
}

-(BOOL)isOperator:(NSString *)str{
    //containsObject
    if ([[self validOperator]containsObject: str])
        return YES;
    return NO;
}

-(NSString *)comparePriority:(NSString *)inOptr outOptr:(NSString *)outOptr{
    NSDictionary *inStackPriority = [self inStackPriority];
    NSDictionary *outStackPriority = [self outStackPriority];
    
    NSString *inPriority = inStackPriority[inOptr];
    NSString *outPriority = outStackPriority[outOptr];
    
    NSInteger isp = [inPriority integerValue];
    NSInteger icp = [outPriority integerValue];
    
    if (isp > icp)
        return @">";
    else if (isp < icp)
        return @"<";
    else
        return @"=";
}

-(double)calculate:(double)opnd1 opnd2:(double)opnd2 optr:(NSString *)optr{
    if ([optr isEqual: @"+"])
        return opnd1 + opnd2;
    else if ([optr isEqual: @"-"])
        return opnd1 - opnd2;
    else if ([optr isEqual: @"*"])
        return opnd1 * opnd2;
    else if ([optr isEqual: @"/"]){
        if (opnd2 == 0)
            NSLog(@"错误！除数为0。");
        else
            return opnd1 / opnd2;
        return 0;
    }
    return 0;
}

-(NSString *)ExpressionCalculate:(NSString *)inputString{
    inputString = [inputString stringByAppendingString:@"="];
    if (![self isLegal:inputString])
        return @"表达式格式错误";
    
    //操作数，运算符数组初始化
    _opndArray = [NSMutableArray array];
    _optrArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < inputString.length; i++) {
        char ch = [inputString characterAtIndex:i];
        NSString *tempChar = [NSString stringWithFormat:@"%c",ch];
        if ([self isOperator:tempChar] && ![tempChar isEqualToString: @"="]){
            [_optrArray addObject:tempChar];
        }
    }
    NSArray *tempArray = [inputString componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"(+-*/%=)"]];//字符串拆分
    _opndArray = [NSMutableArray arrayWithArray:tempArray];
    
    _optrSize = _optrArray.count;
    _opndSize = _opndArray.count;
    _optrStack = [[Stack alloc]initWithSize:_optrSize];
    _opndStack = [[Stack alloc]initWithSize:_opndSize];
    
    [_optrStack push:@"="];
    //暂存括号
    NSString *bracket;
    //暂存运算符
    NSString *oper;
    //暂存操作数
    NSString *value1, *value2;
    

    for (NSUInteger i = 0; i < inputString.length; i++) {
        char ch = [inputString characterAtIndex:i];
        NSString *tempChar = [NSString stringWithFormat:@"%c", ch];
        
        //当前字符为等号或者栈顶元素为等号
        if (([tempChar isEqualToString:@"="]) && ([[_optrStack top] isEqualToString:@"="]) ) {
            break;
        }
        //当前字符为运算符
        else if ([self isOperator:tempChar]){
            NSString *pr = [self comparePriority:[_optrStack top] outOptr:tempChar];
            //优先级高于栈顶运算符则压入堆栈
            if([pr isEqualToString:@"<"])
                [_optrStack push:tempChar];
            else if([pr isEqualToString:@"="])
                bracket = [_optrStack pop];
            else{
                i--;
                oper = [_optrStack pop];
                value2 = [_opndStack pop];
                value1 = [_opndStack pop];
                
                double a = [value1 doubleValue];
                double b = [value2 doubleValue];
                
                double c = [self calculate:a opnd2:b optr:oper];
                NSNumber *num = [[NSNumber alloc] initWithDouble:c];
                NSString *result = [num stringValue];
                [_opndStack push:result];
            }
        }
        //当前字符为操作数
        else{
            //判断下一个字符
            NSUInteger j = i + 1;
            if (j<[inputString length]) {
                char nextch = [inputString characterAtIndex:j];
                NSString *nextstr = [NSString stringWithFormat:@"%c", nextch];
                //下一个还是操作数
                if(![self isOperator:nextstr])
                    continue;
                else{
                    [_opndStack push:[_opndArray firstObject]];
                    [_opndArray removeObjectAtIndex:0];
                }
            }
            else{
                [_opndStack push:[_opndArray firstObject]];
                [_opndArray removeObjectAtIndex:0];
            }
        }
    }
    
    NSString *expResult = [_opndStack top];
    return expResult;
}

@end
