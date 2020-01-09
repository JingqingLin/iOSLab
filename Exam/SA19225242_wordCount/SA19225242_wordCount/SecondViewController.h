//
//  SecondViewController.h
//  SA19225242_wordCount
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model/wordProcess.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
@property (strong, nonatomic) wordProcess *txt;
@end

NS_ASSUME_NONNULL_END
