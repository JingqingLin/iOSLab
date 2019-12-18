//
//  main.m
//  Arithmetic
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Arithmetic.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Arithmetic *a = [[Arithmetic alloc] init];
        NSLog(@"Start!");
        NSString *expression = @"-10-(-1/1)*-8";
        NSString *result = [a ExpressionCalculate: expression];
        if([result isEqualToString:@"Nah"] || [result isEqualToString:@"字符串不是数学表达式无法计算"]){
            NSLog(@"%@", result);
        }
        else{
            NSLog(@"%@=%@", expression, result);
        }
    }
    return 0;
}
