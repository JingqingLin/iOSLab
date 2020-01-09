//
//  SecondViewController.m
//  SA19225242_2
//
//  Created by 林靖清 on 2020/1/9.
//  Copyright © 2020 USTC. All rights reserved.
//

#import "SecondViewController.h"
#import "Model/transferSentence.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *SA242_countLabel;
@end

@implementation SecondViewController
//转大写
//遍历字串，flag = YES 表示当前字符为单词首字母
- (IBAction)upperCase:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:_SA242_transTxt.disp];
    _SA242_transTxt.disp = [NSMutableString stringWithString:@""];
    NSMutableString *temp;
    BOOL flag = NO;
    for (NSUInteger i = 0; i < str.length; ++i) {
        temp = [NSMutableString stringWithString:@""];
        // char 无法存储一些符号
        unichar ch = [str characterAtIndex:i];
        temp = [NSMutableString stringWithFormat:@"%C", ch];
        //首个单词单独讨论
        if (i == 0) {
            [_SA242_transTxt.disp appendString:[temp uppercaseString]];
            continue;
        }
        //若遇到空格，置 flag = YES 并 continue 跳出此次循环，进入下个循环后，置字母为大写并 flag = NO
        //连续空格情况也符合逻辑
        if ([temp isEqualToString:@" "]) {
            [_SA242_transTxt.disp appendString:temp];

            flag = YES;
            continue;
        }
        if (flag == YES) {
            [_SA242_transTxt.disp appendString:[temp uppercaseString]];
        }
        else
            [_SA242_transTxt.disp appendString:temp];
        flag = NO;
    }
    //NSLog(@"upper: %@", _SA242_transTxt.disp);
}
//转小写同理
- (IBAction)lowerCase:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:_SA242_transTxt.disp];
    _SA242_transTxt.disp = [NSMutableString stringWithString:@""];
    NSMutableString *temp;
    BOOL flag = NO;
    for (NSUInteger i = 0; i < str.length; ++i) {
        temp = [NSMutableString stringWithString:@""];
        unichar ch = [str characterAtIndex:i];
        temp = [NSMutableString stringWithFormat:@"%C", ch];
        if (i == 0) {
            [_SA242_transTxt.disp appendString:[temp lowercaseString]];
            continue;
        }
        if ([temp isEqualToString:@" "]) {
            [_SA242_transTxt.disp appendString:temp];
            flag = YES;
            continue;
        }
        if (flag == YES) {
            [_SA242_transTxt.disp appendString:[temp lowercaseString]];
        }
        else
            [_SA242_transTxt.disp appendString:temp];
        flag = NO;
    }
    NSLog(@"lower: %@", _SA242_transTxt.disp);
}
//统计字数
- (void)viewWillAppear:(BOOL)animated{
    NSUInteger count = 0;
    NSMutableString *str = [NSMutableString stringWithString:_SA242_transTxt.disp];
    NSMutableString *temp;
    // flagPre 和 flagPost 分别记录前后相隔字符的种类
    // NO 代表空格，YES 代表字母
    //仅当 flagPre == NO，flagPost == YES 时计数+1，即前空格，后字母的情况
    BOOL flagPre = NO;
    BOOL flagPost = NO;
    for (NSUInteger i = 0; i < str.length; ++i) {
        temp = [NSMutableString stringWithString:@""];
        char ch = [str characterAtIndex:i];
        temp = [NSMutableString stringWithFormat:@"%c", ch];
        if ([temp isEqualToString:@" "]) {
            flagPre = flagPost;
            flagPost = NO;
        }
        else {
            flagPre = flagPost;
            flagPost = YES;
        }
        if (flagPre == NO && flagPost == YES)
            count += 1;
    }
    NSLog(@"disp: %lu", (unsigned long)count);
    _SA242_countLabel.text = [NSMutableString stringWithFormat:@"%lu", (unsigned long)count];
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
