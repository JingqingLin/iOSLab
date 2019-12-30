//
//  Advanced.h
//  Calculator
//
//  Created by 林靖清 on 2019/12/28.
//  Copyright © 2019 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import <math.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdvancedCalculator : Calculator
@property (strong, nonatomic)NSMutableString *screen;

- (NSString *)sqrt:(NSString *) content;
- (NSString *)abs:(NSString *) content;
- (NSString *)inverse:(NSString *) content;
- (NSString *)power2:(NSString *) content;
- (NSString *)sin:(NSString *) content;
- (NSString *)cos:(NSString *) content;
- (NSString *)tan:(NSString *) content;
- (NSString *)power3:(NSString *) content;
- (NSString *)asin:(NSString *) content;
- (NSString *)acos:(NSString *) content;
- (NSString *)atan:(NSString *) content;
- (NSString *)ln:(NSString *) content;
- (NSString *)sinh:(NSString *) content;
- (NSString *)cosh:(NSString *) content;
- (NSString *)tanh:(NSString *) content;
- (NSString *)log:(NSString *) content;
@end

NS_ASSUME_NONNULL_END
