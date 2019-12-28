//
//  ViewController.m
//  Calculator
//
//  Created by 林靖清 on 2019/12/23.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "ViewController.h"
#import "Model/Calculator.h"
#import "Model/AdvancedCalculator.h"
#import "AdvancedViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btnDot;
@property (weak, nonatomic) IBOutlet UIButton *btnDiv;
@property (weak, nonatomic) IBOutlet UIButton *btnMult;
@property (weak, nonatomic) IBOutlet UIButton *btnSub;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UILabel *txtDisplay;
@property (strong, nonatomic) AdvancedCalculator *cal;

@end

@implementation ViewController

- (IBAction)inputNumber:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:_txtDisplay.text];
    if([[[sender titleLabel] text] isEqualToString:@"×"])
        [_cal.disp appendString:@"*"];
    else if([[[sender titleLabel] text] isEqualToString:@"÷"])
        [_cal.disp appendString:@"/"];
    else
        [_cal.disp appendString:[[sender titleLabel] text]];

    [str appendString:[[sender titleLabel] text]];
    _txtDisplay.text = str;
    _cal.screen = str;
}

- (IBAction)clear:(UIButton *)sender {
    _txtDisplay.text = @"";
    _cal.screen = [NSMutableString stringWithString:_txtDisplay.text];
    [_cal clearDisp];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"AdvancedScene"]){
        if ([segue.destinationViewController isKindOfClass:[AdvancedViewController class]]){
            AdvancedViewController *avc = (AdvancedViewController *)segue.destinationViewController;
            avc.cal = _cal;
        }
    }
}

- (IBAction)delNumber:(UIButton *)sender {
    if ([_txtDisplay.text containsString:@"error"] ||  [_txtDisplay.text containsString:@"..."]) {
        _txtDisplay.text = @"";
        _cal.screen = [NSMutableString stringWithString:_txtDisplay.text];
        [_cal clearDisp];
    }
    else
        [_cal delNumber];
    _txtDisplay.text = _cal.screen;
}

- (IBAction)compute:(UIButton *)sender {
    _txtDisplay.text = _cal.computedResult;
    _cal.screen = [NSMutableString stringWithString:_txtDisplay.text];
}

- (void)viewWillAppear:(BOOL)animated{
    _txtDisplay.text = self.cal.screen;
    NSLog(@"基本运算界面加载中...");
}

- (AdvancedCalculator *)cal{
    if(!_cal)
        _cal = [[AdvancedCalculator alloc] init];
    return _cal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _cal = [[AdvancedCalculator alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
