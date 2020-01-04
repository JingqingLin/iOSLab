//
//  Student.h
//  StudentsScore
//
//  Created by 林靖清 on 2020/1/3.
//  Copyright © 2020 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject<NSCoding>
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *number;
@property (nonatomic) NSInteger age;
@property (nonatomic)float score;
@property (strong,nonatomic) NSString *memo;
@property (strong,nonatomic) NSString *teacher;
@end

NS_ASSUME_NONNULL_END
