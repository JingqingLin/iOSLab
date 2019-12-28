//
//  Calculator.h
//  Calculator
//
//  Created by 林靖清 on 2019/12/23.
//  Copyright © 2019 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject
@property(strong, nonatomic)NSMutableString *disp;
- (void) delNumber;
- (NSString *)computedResult;
- (void)clearDisp;
@end

NS_ASSUME_NONNULL_END
