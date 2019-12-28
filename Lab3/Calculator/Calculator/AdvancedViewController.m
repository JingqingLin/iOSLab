//
//  AdvancedViewController.m
//  Calculator
//
//  Created by 林靖清 on 2019/12/28.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "AdvancedViewController.h"

@interface AdvancedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *txtDisplay;
@property (weak, nonatomic) IBOutlet UIButton *btnLeftBracket;
@property (weak, nonatomic) IBOutlet UIButton *btnRightBracket;
@property (weak, nonatomic) IBOutlet UIButton *btnNaturalLogarithm;
@property (weak, nonatomic) IBOutlet UIButton *btnPi;

@end

@implementation AdvancedViewController
- (IBAction)inputKey:(UIButton *)sender {
    if (sender.tag==0 || sender.tag==1 || sender.tag==2 || sender.tag==3) {
        NSMutableString *str = [NSMutableString stringWithString:_txtDisplay.text];
        if([[[sender titleLabel] text] isEqualToString:@"e"]) {
            if (str.length == 0) {
                str = [NSMutableString stringWithString:@"2.71828"];
                _cal.disp = [NSMutableString stringWithString:@"2.71828"];
            }
            // 若屏幕显示的最后一位是数字，则先清空，再显示e
            else if (str.length > 0) {
                NSString *s = [NSString stringWithFormat:@"%c",[str characterAtIndex:(str.length - 1)]];
                if ([s isEqualToString:@"+"] || [s isEqualToString:@"-"] || [s isEqualToString:@"×"] || [s isEqualToString:@"÷"]) {
                    [_cal.disp appendString:@"2.71828"];
                    [str appendString:@"2.71828"];
                }
                else {
                    _cal.disp = [NSMutableString stringWithString:@"2.71828"];
                    str = [NSMutableString stringWithString:@"2.71828"];
                }
            }
        }
        else if ([[[sender titleLabel] text] isEqualToString:@"π"]){
            if (str.length == 0) {
                str = [NSMutableString stringWithString:@"3.14159"];
                _cal.disp = [NSMutableString stringWithString:@"3.14159"];
            }
            // 若屏幕显示的最后一位是数字，则先清空，再显示π
            else if (str.length > 0) {
                NSString *s = [NSString stringWithFormat:@"%c",[str characterAtIndex:(str.length - 1)]];
                if ([s isEqualToString:@"+"] || [s isEqualToString:@"-"] || [s isEqualToString:@"×"] || [s isEqualToString:@"÷"]) {
                    [_cal.disp appendString:@"3.14159"];
                    [str appendString:@"3.14159"];
                }
                else {
                    _cal.disp = [NSMutableString stringWithString:@"3.14159"];
                    str = [NSMutableString stringWithString:@"3.14159"];
                }
            }
        }
        else{
            [_cal.disp appendString:[[sender titleLabel] text]];
            [str appendString:[[sender titleLabel] text]];
        }
        _txtDisplay.text = str;
        _cal.screen = str;
    }
    else if (sender.tag == 4) {
        _cal.disp = [NSMutableString stringWithString:[_cal abs:[_cal computedResult]]];
        _cal.screen = _cal.disp;
        _txtDisplay.text = _cal.screen;
    }
    else if (sender.tag == 5) {
        _cal.disp = [NSMutableString stringWithString:[_cal sqrt:[_cal computedResult]]];
        _cal.screen = _cal.disp;
        _txtDisplay.text = _cal.screen;
    }
    else if (sender.tag == 6) {
        _cal.disp = [NSMutableString stringWithString:[_cal inverse:[_cal computedResult]]];
        _cal.screen = _cal.disp;
        _txtDisplay.text = _cal.screen;
    }
    else if (sender.tag == 7) {
        _cal.disp = [NSMutableString stringWithString:[_cal power2:[_cal computedResult]]];
        NSLog(@"result__ = %@", _cal.disp);
        _cal.screen = _cal.disp;
        _txtDisplay.text = _cal.screen;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    _txtDisplay.text = _cal.screen;
    NSLog(@"高级运算界面加载中...");
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
