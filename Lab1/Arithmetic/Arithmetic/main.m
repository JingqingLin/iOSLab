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
        NSString *expression = @"10/1*7+15-8";
        NSString *result = [a ExpressionCalculate: expression];
        if([result isEqualToString:@"Nah"]){
            
        }
        NSLog(@"%@=%@", expression, result);
    }
    return 0;
}
