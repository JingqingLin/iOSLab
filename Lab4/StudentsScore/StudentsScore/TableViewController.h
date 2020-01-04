//
//  TableViewController.h
//  StudentsScore
//
//  Created by 林靖清 on 2020/1/3.
//  Copyright © 2020 USTC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController
- (void)writeToFile:(NSMutableArray *)sts filepath:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
