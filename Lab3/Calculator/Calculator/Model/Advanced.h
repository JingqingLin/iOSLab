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

@interface Advanced : Calculator
@property (strong, nonatomic)NSMutableString *screen;

- (NSString *)sqrt:(NSString *) content;
@end

NS_ASSUME_NONNULL_END
