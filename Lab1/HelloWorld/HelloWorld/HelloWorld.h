//
//  HelloWorld.h
//  HelloWorld
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HelloWorld : NSObject

@property(strong, nonatomic)NSString *something;

//类方法
+ (void)sayHelloWorld;
//实例方法
- (void)saySomething;
- (void)sayHello:(NSString *)greeting;

@end

NS_ASSUME_NONNULL_END
