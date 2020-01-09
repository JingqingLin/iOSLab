//
//  News.h
//  SA19225242_sseNews
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *date;
@property (strong,nonatomic) NSString *content;
@end

NS_ASSUME_NONNULL_END
