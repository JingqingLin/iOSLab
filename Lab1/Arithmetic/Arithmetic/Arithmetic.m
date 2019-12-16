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
    NSInteger icp = [outPriority integerValue];//栈外
    
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
    if (![self isLegal:inputString])
        return @"表达式格式错误";
    
    //运算符栈初始化
    _optrArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < inputString.length; i++) {
        char ch = [inputString characterAtIndex:i];
        NSString *tempChar = [NSString stringWithFormat:@"%c",ch];
        if ([self isOperator:tempChar]){
            [_optrArray addObject:tempChar];
        }
    }
    _optrSize = _optrArray.count;
    _optrStack = [[Stack alloc]initWithSize:_optrSize];
    
    NSString *postfixNotation = @"";
    //前缀转后缀
    for (NSUInteger i = 0; i < inputString.length; i++) {
        char ch = [inputString characterAtIndex:i];
        NSString *tempChar = [NSString stringWithFormat:@"%c", ch];
        //操作数，直接输出
        if (![self isOperator:tempChar]){
            NSLog(@"i = %lu  : %@", (unsigned long)i, tempChar);
            postfixNotation = [postfixNotation stringByAppendingString:tempChar];
//            //继续往后面读取，若是数字则输出到后缀表达式中
//            NSUInteger j = i + 1;
//            while (j < inputString.length) {
//                char nextCh = [inputString characterAtIndex:j];
//                NSString *nextChar = [NSString stringWithFormat:@"%c", nextCh];
//                //下一个还是操作数
//                if (![self isOperator:nextChar]){
//                    postfixNotation = [postfixNotation stringByAppendingString:nextChar];
//                    j++;
//                    i++;
//                }
//                else
//                    break;
//            }
        }
        else{
            //左括号，直接压入堆栈
            if ([tempChar isEqualToString:@"("])
                [_optrStack push:tempChar];
            //右括号，不断弹出栈顶运算符并输出直到遇到左括号（左括号弹出，但不输出）
            else if ([tempChar isEqualToString:@")"]){
                while (![[_optrStack top] isEqualToString:@"("])
                    postfixNotation = [postfixNotation stringByAppendingString:[_optrStack pop]];
                [_optrStack pop];
            }
            //其他运算符
            else {
                //将该栈顶运算符与运算符进行比较
                NSString *pr = [self comparePriority:[_optrStack top] outOptr:tempChar];
                NSLog(@"i = %-3.lu: (栈顶) %@ %@ %@ (栈外)", (unsigned long)i, [_optrStack top], pr, tempChar);
                //如果栈顶运算符优先级低于栈外，压入栈
                if ([pr isEqualToString:@"<"])
                    [_optrStack push:tempChar];
                //如果栈顶运算符优先级高于等于栈外，弹出栈顶运算符，直到栈顶运算符优先级小于栈外或者栈空，再将该运算符入栈
                else {
                    postfixNotation = [postfixNotation stringByAppendingString:[_optrStack pop]];
                    NSString *prLoop = [self comparePriority:[_optrStack top] outOptr:tempChar];
                    while ([prLoop isEqualToString:@">"] && ![_optrStack isEmpty])
                        postfixNotation = [postfixNotation stringByAppendingString:[_optrStack pop]];
                    [_optrStack push:tempChar];
                }
            }
        }
        NSLog(@"后缀表达式：%@",postfixNotation);
    }
    while (![_optrStack isEmpty]){
        postfixNotation = [postfixNotation stringByAppendingString:[_optrStack pop]];
        NSLog(@"后缀表达式：%@",postfixNotation);
    }

//    for (NSUInteger i = 0; i < inputString.length; i++) {
//        char ch = [inputString characterAtIndex:i];
//        NSString *tempChar = [NSString stringWithFormat:@"%c", ch];
//
//        //当前字符为等号或者栈顶元素为等号
//        if (([tempChar isEqualToString:@"="]) && ([[_optrStack top] isEqualToString:@"="]) ) {
//            break;
//        }
//        //当前字符为运算符
//        else if ([self isOperator:tempChar]){
//            NSString *pr = [self comparePriority:[_optrStack top] outOptr:tempChar];
//            //优先级高于栈顶运算符则压入堆栈
//            if([pr isEqualToString:@"<"])
//                [_optrStack push:tempChar];
//            else if([pr isEqualToString:@"="])
//                bracket = [_optrStack pop];
//            else{
//                i--;
//                oper = [_optrStack pop];
//                value2 = [_opndStack pop];
//                value1 = [_opndStack pop];
//
//                double a = [value1 doubleValue];
//                double b = [value2 doubleValue];
//
//                double c = [self calculate:a opnd2:b optr:oper];
//                NSNumber *num = [[NSNumber alloc] initWithDouble:c];
//                NSString *result = [num stringValue];
//                [_opndStack push:result];
//            }
//        }
//        //当前字符为操作数
//        else{
//            //判断下一个字符
//            NSUInteger j = i + 1;
//            if (j<[inputString length]) {
//                char nextch = [inputString characterAtIndex:j];
//                NSString *nextstr = [NSString stringWithFormat:@"%c", nextch];
//                //下一个还是操作数
//                if(![self isOperator:nextstr])
//                    continue;
//                else{
//                    [_opndStack push:[_opndArray firstObject]];
//                    [_opndArray removeObjectAtIndex:0];
//                }
//            }
//            else{
//                [_opndStack push:[_opndArray firstObject]];
//                [_opndArray removeObjectAtIndex:0];
//            }
//        }
//    }
    
    NSString *expResult = [_opndStack top];
    return expResult;
}

@end
