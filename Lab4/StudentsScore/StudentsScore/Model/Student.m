//
//  Student.m
//  StudentsScore
//
//  Created by 林靖清 on 2020/1/3.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "Student.h"

@implementation Student
//实现NSCoding中的方法来序列化
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.number forKey:@"number"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeFloat:self.score forKey:@"score"];
    [aCoder encodeObject:self.teacher forKey:@"teacher"];
    [aCoder encodeObject:self.memo forKey:@"memo"];
    
    
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.number = [aDecoder decodeObjectForKey:@"number"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.score = [aDecoder decodeFloatForKey:@"score"];
        self.memo = [aDecoder decodeObjectForKey:@"memo"];
        self.teacher = [aDecoder decodeObjectForKey:@"teacher"];
    }
    return self;
}
@end
