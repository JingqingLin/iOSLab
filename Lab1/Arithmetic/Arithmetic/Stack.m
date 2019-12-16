//
//  Stack.m
//  Arithmetic
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "Stack.h"

@implementation Stack

NSUInteger const size = 500;

//实例变量带参数的构造方法
-(instancetype)initWithSize:(NSUInteger)size{
    self = [super init];
    if(self){
        self.stackArray = [[NSMutableArray alloc]initWithCapacity:size];
    }
    return self;
}

-(void)clear{
    [self.stackArray removeAllObjects];
}

-(BOOL)push:(NSString *) obj{
    if (self.stackArray.count == size)
    {
        NSLog(@"Stack is full.");
        return NO;
    }
    else
    {
        [self.stackArray addObject:obj];
        return YES;
    }
}

-(NSString *)pop{
    if([self isEqual:nil])
        return nil;
    else{
        NSString* s = [self.stackArray lastObject];
        [self.stackArray removeLastObject];
        return s;
    }
}

-(NSString *)top{
    if ([self isEqual:nil])
        return nil ;
    else
        return [self.stackArray lastObject];
}

-(BOOL)isEmpty{
    return ![self.stackArray count];
}

@end
