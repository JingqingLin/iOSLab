//
//  main.m
//  HelloWorld
//
//  Created by 林靖清 on 2019/12/15.
//  Copyright © 2019 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelloWorld.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [HelloWorld sayHelloWorld];
        
        HelloWorld *h = [[HelloWorld alloc] init];
        [h sayHello:@"Parameter."];
        h.something = @"Field";
        [h saySomething];
    }
    return 0;
}
