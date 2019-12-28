//
//  Calculator+Health.h
//  Calculator
//
//  Created by 林靖清 on 2019/12/29.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "Calculator.h"

NS_ASSUME_NONNULL_BEGIN

@interface Calculator (Health)
- (NSString *)computeHeathWithHeight:(NSString *) height andWeight:(NSString*) weight;
@end

NS_ASSUME_NONNULL_END
