//
//  HelloWorld.m
//  HelloWorld
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "HelloWorld.h"

@implementation HelloWorld

//给实例变量起个别名
//如果属性只使用 @property 声明，而没使用 @synthesize 的话，系统会自动的给你声明一个 _ 开头的实例变量。
@synthesize something = _something;
//重载 set 方法，前面加 set 才会起效果
- (void)setSomething:(NSString *)something{
    NSMutableString *mstr = [NSMutableString stringWithString:something];
    [mstr appendString:@"!"];
    _something = mstr;
}

//重载 get 方法
- (NSString *)something{
    return _something;
}

+ (void)sayHelloWorld{
    NSLog(@"Hello World from class method.");
}

- (void)saySomething{
    NSString *str = @"Hello ";
    NSMutableString *mstr = [NSMutableString stringWithString:str];
    [mstr appendString:self.something];
    NSLog(@"%@",mstr);
}

- (void)sayHello:(NSString *)greeting{
    NSString *str = @"Hello ";
    NSMutableString *mstr = [NSMutableString stringWithString:str];
    [mstr appendString:greeting];
    NSLog(@"%@", mstr);
}

@end
