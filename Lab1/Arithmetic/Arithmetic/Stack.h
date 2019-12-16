//
//  Stack.h
//  Arithmetic
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Stack: NSObject

@property(nonatomic, retain)NSMutableArray *stackArray;
@property(nonatomic, retain)NSString *top;
@property(nonatomic) NSUInteger size;

-(instancetype)initWithSize:(NSUInteger)size;
-(BOOL)push:(NSString *)obj;
-(NSString *)pop;
-(NSString *)top;
-(BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END
