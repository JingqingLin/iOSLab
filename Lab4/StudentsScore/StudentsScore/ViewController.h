//
//  ViewController.h
//  StudentsScore
//
//  Created by 林靖清 on 2020/1/3.
//  Copyright © 2020 USTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISearchBarDelegate>
@property(strong, nonatomic) NSMutableArray *students;
@property(strong, nonatomic) NSIndexPath *indexPath;
@property(strong, nonatomic) NSString *path;

@end

