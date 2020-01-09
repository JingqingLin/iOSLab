//
//  SecondViewController.m
//  SA19225242_wordCount
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *SA19225242_countLabel;
@property (weak, nonatomic) IBOutlet UIButton *SA19225242_Uppercase;
@property (weak, nonatomic) IBOutlet UIButton *SA19225242_Lowercase;
@end

@implementation SecondViewController
- (IBAction)upperCase:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:_txt.disp];
    _txt.disp = [NSMutableString stringWithString:@""];
    NSMutableString *temp;
    BOOL flag = NO;
    for (NSUInteger i = 0; i < str.length; ++i) {
        temp = [NSMutableString stringWithString:@""];
        char ch = [str characterAtIndex:i];
        temp = [NSMutableString stringWithFormat:@"%c", ch];
        if (i == 0) {
            [_txt.disp appendString:[temp uppercaseString]];
            continue;
        }
        if ([temp isEqualToString:@" "]) {
            [_txt.disp appendString:temp];
            flag = YES;
            continue;
        }
        if (flag == YES) {
            [_txt.disp appendString:[temp uppercaseString]];
        }
        else
            [_txt.disp appendString:temp];
        flag = NO;
    }
    NSLog(@"upper: %@", _txt.disp);
}

- (IBAction)lowerCase:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:_txt.disp];
    _txt.disp = [NSMutableString stringWithString:@""];
    NSMutableString *temp;
    BOOL flag = NO;
    for (NSUInteger i = 0; i < str.length; ++i) {
        temp = [NSMutableString stringWithString:@""];
        char ch = [str characterAtIndex:i];
        temp = [NSMutableString stringWithFormat:@"%c", ch];
        if (i == 0) {
            [_txt.disp appendString:[temp lowercaseString]];
            continue;
        }
        if ([temp isEqualToString:@" "]) {
            [_txt.disp appendString:temp];
            flag = YES;
            continue;
        }
        if (flag == YES) {
            [_txt.disp appendString:[temp lowercaseString]];
        }
        else
            [_txt.disp appendString:temp];
        flag = NO;
    }
    NSLog(@"lower: %@", _txt.disp);
}

- (void)viewWillAppear:(BOOL)animated{
    NSUInteger count = 0;
    NSMutableString *str = [NSMutableString stringWithString:_txt.disp];
    NSMutableString *temp;
    //默认不是字符
    BOOL flag0 = NO;
    BOOL flag1 = NO;
    for (NSUInteger i = 0; i < str.length; ++i) {
        temp = [NSMutableString stringWithString:@""];
        char ch = [str characterAtIndex:i];
        temp = [NSMutableString stringWithFormat:@"%c", ch];
        if ([temp isEqualToString:@" "]) {
            flag0 = flag1;
            flag1 = NO;
        }
        else {
            flag0 = flag1;
            flag1 = YES;
        }
        if (flag0 == NO && flag1 == YES)
            count += 1;
    }
    NSLog(@"disp: %lu", (unsigned long)count);
    _SA19225242_countLabel.text = [NSMutableString stringWithFormat:@"%lu", (unsigned long)count];
    NSLog(@"统计界面加载中...");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
