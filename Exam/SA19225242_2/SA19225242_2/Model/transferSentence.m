//
//  transferSentence.m
//  SA19225242_2
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "transferSentence.h"

@implementation transferSentence
//初始化为空串
- (id)init {
    self = [super init];
    if (self) {
        self.disp = [NSMutableString stringWithString:@""];
    }
    return self;
}
@end
