//
//  TableViewController.h
//  SA19225242_sseNews
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController
- (void)writeToFile:(NSMutableArray *)n filepath:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
