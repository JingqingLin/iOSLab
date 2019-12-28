//
//  ViewController.m
//  Calculator
//
//  Created by 林靖清 on 2019/12/23.
//  Copyright © 2019 USTC. All rights reserved.
//

#import "ViewController.h"
#import "Model/Calculator.h"

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
@property (strong, nonatomic) Calculator *cal;

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
}

- (IBAction)clear:(UIButton *)sender {
    _txtDisplay.text = @"";
    [_cal clearDisp];
}

- (IBAction)delNumber:(UIButton *)sender {
    long len = _cal.disp.length - 1;
    if(len >= 0){
        [_cal.disp deleteCharactersInRange:NSMakeRange(len, 1)];
        _txtDisplay.text = _cal.disp;
    }
    [_cal delNumber];
}

- (IBAction)compute:(UIButton *)sender {
    _txtDisplay.text = _cal.computedResult;
}

- (void)viewWillAppear:(BOOL)animated{
}

- (Calculator *)cal{
    if(!_cal)
        _cal = [[Calculator alloc] init];
    return _cal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _cal = [[Calculator alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
