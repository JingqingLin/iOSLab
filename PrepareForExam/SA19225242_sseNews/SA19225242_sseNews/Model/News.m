//
//  News.m
//  SA19225242_sseNews
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "News.h"

@implementation News
//实现NSCoding中的方法来序列化
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_date forKey:@"date"];
    [aCoder encodeObject:_content forKey:@"content"];
    
    
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super init]){
        _title = [aDecoder decodeObjectForKey:@"title"];
        _date = [aDecoder decodeObjectForKey:@"date"];
        _content = [aDecoder decodeObjectForKey:@"content"];
    }
    return self;
}
@end
