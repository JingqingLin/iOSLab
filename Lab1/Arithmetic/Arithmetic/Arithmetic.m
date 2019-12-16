//
//  Arithmetic.m
//  Arithmetic
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "Arithmetic.h"

@implementation Arithmetic

BOOL flag = YES;

//未用到 % =
-(NSArray *)validOperator{
    NSArray * opers = @[@"+", @"-", @"*", @"/", @"%", @"(", @")", @"="];
    return opers;
}

//未用到 % =
-(NSDictionary *)inStackPriority{
    return @{@"(":@1, @"*":@5, @"/":@5, @"%":@5, @"+":@3, @"-":@3, @")":@8, @"=":@0 };
}

-(NSDictionary *)outStackPriority{
    return @{@"(":@8, @"*":@4, @"/":@4, @"%":@4, @"+":@2, @"-":@2, @")":@1, @"=":@0 };
}

-(BOOL)isLegal:(NSString *)str{
    if ([str containsString:@"."])
        return NO;
    else{
        //判断左右括号数量是否匹配
        NSUInteger l = 0, r = 0;
        for (NSUInteger i = 0;i < str.length;i++){
            char ch = [str characterAtIndex:i];
            NSString* tempChar = [NSString stringWithFormat:@"%c",ch];
            
            if (![self isOperator:tempChar]){
                continue;
            }
            else if ([tempChar isEqualToString:@"("]){
                l++;
            }
            else if ([tempChar isEqualToString:@")"]){
                r++;
            }
            //判断下一个字符，是否会连续出现运算符
            else{
                NSUInteger j = i + 1;
                if (j < str.length){
                    char nextCh = [str characterAtIndex:j];
                    NSString *nextChar = [NSString stringWithFormat:@"%c",nextCh];
                    if ([self isOperator:nextChar]){
                        if (![nextChar isEqualToString:@"("] && ![nextChar isEqualToString:@")"]){
                            return NO;
                        }
                    }
                }
            }
        }
        if (l != r){
            return NO;
        }
    }
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
        if (opnd2 == 0){
            flag = NO;
            NSLog(@"错误！除数为0。");
        }
        else
            return opnd1 / opnd2;
        return 0;
    }
    return 0;
}

-(NSString *)ExpressionCalculate:(NSString *)inputString{
    //去除空格，替换字符串
    inputString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@""];
    inputString = [inputString stringByReplacingOccurrencesOfString:@"×" withString:@"*"];
    inputString = [inputString stringByReplacingOccurrencesOfString:@"÷" withString:@"/"];
    
    
    if (![self isLegal:inputString])
        return @"字符串不是数学表达式无法计算";
    
    //初始化符号栈和后缀表达式栈
    _optrStack = [[Stack alloc]initWithSize:inputString.length];
    _opndStack = [[Stack alloc]initWithSize:inputString.length];
    
    NSString *postfixNotation = @"";
    NSMutableArray *opndDigits = [NSMutableArray array];
    //前缀转后缀
    for (NSUInteger i = 0; i < inputString.length; i++) {
        char ch = [inputString characterAtIndex:i];
        NSString *tempChar = [NSString stringWithFormat:@"%c", ch];
        //操作数，直接输出
        if (![self isOperator:tempChar]){
            // k 记录数字位数并存到 opndDigits
            int k = 1;
            NSLog(@"i = %lu  : %@", (unsigned long)i, tempChar);
            postfixNotation = [postfixNotation stringByAppendingString:tempChar];
            //继续往后面读取，若是数字则输出到后缀表达式中
            NSUInteger j = i + 1;
            while (j < inputString.length) {
                char nextCh = [inputString characterAtIndex:j];
                NSString *nextChar = [NSString stringWithFormat:@"%c", nextCh];
                //下一个还是操作数
                if (![self isOperator:nextChar]){
                    postfixNotation = [postfixNotation stringByAppendingString:nextChar];
                    j++;i++;k++;
                }
                else
                    break;
            }
            //基本类型 int 不能直接存入 NSMutableArray
            NSNumber *num = [NSNumber numberWithInt:k];
            [opndDigits addObject:num];
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
                //如果栈顶运算符优先级低于栈外，压入栈
                if ([pr isEqualToString:@"<"]){
                    NSLog(@"i = %-3.lu: (栈顶) %@ %@ %@ (栈外)", (unsigned long)i, [_optrStack top], pr, tempChar);
                    [_optrStack push:tempChar];
                }
                //如果栈顶运算符优先级高于等于栈外，弹出栈顶运算符并输出，直到栈顶运算符优先级小于栈外或者栈空，再将该运算符入栈
                else {
                    postfixNotation = [postfixNotation stringByAppendingString:[_optrStack pop]];
                    NSLog(@"i = %-3.lu: (栈顶) %@ %@ %@ (栈外)", (unsigned long)i, [_optrStack top], pr, tempChar);
                    NSString *prLoop = [self comparePriority:[_optrStack top] outOptr:tempChar];
                    while ([prLoop isEqualToString:@">"] && ![_optrStack isEmpty]){
                        postfixNotation = [postfixNotation stringByAppendingString:[_optrStack pop]];
                        prLoop = [self comparePriority:[_optrStack top] outOptr:tempChar];
                        NSLog(@"i = %-3.lu: (栈顶) %@ %@ %@ (栈外)", (unsigned long)i, [_optrStack top], pr, tempChar);
                    }
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
    
    //遍历后缀表达式计算结果
    NSUInteger j = 0;// opndDigits 下标（控制每次存到栈中操作数的位数）
    for (NSUInteger i = 0; i < postfixNotation.length; i++) {
        char ch = [postfixNotation characterAtIndex:i];
        NSString *tempChar = [NSString stringWithFormat:@"%c", ch];
        
        // 遇到运算符则弹出两个操作数
        NSString *opnd1 = @"";
        NSString *opnd2 = @"";
        
        //如果是操作数，存入栈
        if (![self isOperator:tempChar]){
            NSString *tempNum = @"";
            tempNum = [tempNum stringByAppendingString:tempChar];
            
            //判断是否有多位数字
            NSNumber *digitNSNumber = opndDigits[j];
            NSUInteger digit = [digitNSNumber integerValue];//读出 opndDigits 中的位数并转为 int
            while (digit - 1) {
                i++;
                char nextCh = [postfixNotation characterAtIndex:i];
                NSString *nextNum = [NSString stringWithFormat:@"%c", nextCh];
                //往后读数字并存到tempNum
                tempNum = [tempNum stringByAppendingString:nextNum];
                digit--;
            }
            j++;
            //把数字压入栈中
            [_opndStack push:tempNum];
        }
        else {
            opnd2 = [_opndStack pop];
            opnd1 = [_opndStack pop];
            
            NSDecimalNumber *decNumber1 = [NSDecimalNumber decimalNumberWithString:opnd1];
            NSDecimalNumber *decNumber2 = [NSDecimalNumber decimalNumberWithString:opnd2];
            double tempResult = [self calculate:[decNumber1 doubleValue] opnd2:[decNumber2 doubleValue] optr:tempChar];
            [_opndStack push:[NSString stringWithFormat:@"%.2f", tempResult]];
        }
    }
    
    
    NSString *expResult = [_opndStack top];
    if (flag == NO){
        return @"Nah";
    }
    else
        return expResult;
}

@end
