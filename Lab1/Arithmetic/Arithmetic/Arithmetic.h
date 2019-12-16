//
//  Arithmetic.h
//  Arithmetic
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

NS_ASSUME_NONNULL_BEGIN

@interface Arithmetic : NSObject

//运算符栈（前缀转后缀时存储运算符）
@property (nonatomic, strong)Stack *optrStack;
//操作数栈（计算后缀表达式时存储操作数）
@property (nonatomic, strong)Stack *opndStack;

-(NSArray *)validOperator;
-(NSArray *)validNumber;
//栈内优先级
-(NSDictionary *)inStackPriority;
//栈外优先级
-(NSDictionary *)outStackPriority;
//判断表达式是否合法
-(BOOL)isLegal:(NSString*)str;
//判断当前字符是不是运算符
-(BOOL)isOperator:(NSString*)str;
//判断当前字符是不是阿拉伯数字
-(BOOL)isNumber:(NSString*)str;
//比较运算符优先级大小
-(NSString *)comparePriority:(NSString *)inOptr outOptr:(NSString *)outOptr;
//二元运算
-(double)calculate:(double)opnd1 opnd2:(double)opnd2 optr:(NSString *)optr;

-(NSString *)ExpressionCalculate:(NSString *)inputString;

@end

NS_ASSUME_NONNULL_END
